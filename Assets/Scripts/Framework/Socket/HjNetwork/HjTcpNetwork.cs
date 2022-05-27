using System;
using System.Net.Sockets;
using CustomDataStruct;
using System.Threading;
using System.Collections.Generic;
using XLua;

namespace Networks
{
    [Hotfix]
    public class HjTcpNetwork : HjNetworkBase
    {
        private Thread mSendThread = null;
        private volatile bool mSendWork = false;
        private HjSemaphore mSendSemaphore = null;

        protected IMessageQueue mSendMsgQueue = null;

        protected Socket mClientSocket = null;

        private Thread mReceiveThread = null;
        private volatile bool mReceiveWork = false;
        private IMessageQueue mReceiveMsgQueue = null;
        private List<byte[]> mTempMsgList = null;

        public HjTcpNetwork(int maxBytesOnceSent = 1024 * 100, int maxReceiveBuffer = 1024 * 512) : base(maxBytesOnceSent, maxReceiveBuffer)
        {
            mSendSemaphore = new HjSemaphore();
            mSendMsgQueue = new MessageQueue();
            mReceiveMsgQueue = new MessageQueue();
            mTempMsgList = new List<byte[]>();
        }

        public override void Dispose()
        {
            mSendMsgQueue.Dispose();
            mReceiveMsgQueue.Dispose();
            base.Dispose();
        }

        protected override void DoConnect()
        {
            if (mStatus != SOCKSTAT.CLOSED)
            {
                throw new Exception("HjTcpNetworld DoConnect error the mStatus expect CLOSED");
            }
            String newServerIp = "";
            AddressFamily newAddressFamily = AddressFamily.InterNetwork;
            IPv6SupportMidleware.getIPType(mIp, mPort.ToString(), out newServerIp, out newAddressFamily);
            if (!string.IsNullOrEmpty(newServerIp))
            {
                mIp = newServerIp;
            }

            mClientSocket = new Socket(newAddressFamily, SocketType.Stream, ProtocolType.Tcp);
            mClientSocket.BeginConnect(mIp, mPort, (IAsyncResult ia) =>
            {
                mClientSocket.EndConnect(ia);
                OnConnected();
            }, null);
            mStatus = SOCKSTAT.CONNECTING;
        }

        protected override void DoClose()
        {
            // 关闭socket，Tcp下要等待现有数据发送、接受完成
            // https://msdn.microsoft.com/zh-cn/library/system.net.sockets.socket.shutdown(v=vs.90).aspx
            // mClientSocket.Shutdown(SocketShutdown.Both);
            mClientSocket.Close();
            if (mClientSocket.Connected)
            {
                throw new InvalidOperationException("Should close socket first!");
            }
            mClientSocket = null;
            base.DoClose();
        }

        public override void StartAllThread()
        {
            base.StartAllThread();

            if (mReceiveThread == null)
            {
                mReceiveThread = new Thread(ReceiveThread);
                mReceiveWork = true;
                mReceiveThread.Start(null);
            }

            if (mSendThread == null)
            {
                mSendThread = new Thread(SendThread);
                mSendWork = true;
                mSendThread.Start(null);
            }
        }

        public override void StopAllThread()
        {
            base.StopAllThread();

            mReceiveMsgQueue.Dispose();
            if (mReceiveThread != null)
            {
                mReceiveWork = false;
                mReceiveThread.Join();
                mReceiveThread = null;
            }

            //先把队列清掉
            mSendMsgQueue.Dispose();

            if (mSendThread != null)
            {
                mSendWork = false;
                mSendSemaphore.ProduceResrouce();// 唤醒线程
                mSendThread.Join();// 等待子线程退出
                mSendThread = null;
            }
        }

        private void SendThread(object o)
        {
            List<byte[]> workList = new List<byte[]>(10);

            while (mSendWork)
            {
                if (!mSendWork)
                {
                    break;
                }

                if (mClientSocket == null || !mClientSocket.Connected)
                {
                    continue;
                }

                mSendSemaphore.WaitResource();
                if (mSendMsgQueue.Empty())
                {
                    continue;
                }

                mSendMsgQueue.MoveTo(workList);
                try
                {
                    for (int k = 0; k < workList.Count; ++k)
                    {
                        var msgObj = workList[k];
                        if (mSendWork)
                        {
                            mClientSocket.Send(msgObj, msgObj.Length, SocketFlags.None);
                        }
                    }
                }
                catch (ObjectDisposedException e)
                {
                    ReportSocketClosed(ESocketError.ERROR_1, e.Message);
                    break;
                }
                catch (Exception e)
                {
                    ReportSocketClosed(ESocketError.ERROR_2, e.Message);
                    break;
                }
                finally
                {
                    for (int k = 0; k < workList.Count; ++k)
                    {
                        var msgObj = workList[k];
                        StreamBufferPool.RecycleBuffer(msgObj);
                    }
                    workList.Clear();
                }
            }

            if (mStatus == SOCKSTAT.CONNECTED)
            {
                mStatus = SOCKSTAT.CLOSED;
            }
        }
        private void ReceiveThread(object o)
        {
            StreamBuffer receiveStreamBuffer = StreamBufferPool.GetStream(mMaxReceiveBuffer, false, true);
            int bufferCurLen = 0;
            while (mReceiveWork)
            {
                try
                {
                    if (!mReceiveWork) break;
                    if (mClientSocket != null)
                    {
                        int bufferLeftLen = receiveStreamBuffer.size - bufferCurLen;
                        int readLen = mClientSocket.Receive(receiveStreamBuffer.GetBuffer(), bufferCurLen, bufferLeftLen, SocketFlags.None);
                        if (readLen == 0) throw new ObjectDisposedException("DisposeEX", "receive from server 0 bytes,closed it");
                        if (readLen < 0) throw new Exception("Unknow exception, readLen < 0" + readLen);

                        bufferCurLen += readLen;
                        DoReceive(receiveStreamBuffer, ref bufferCurLen);
                        if (bufferCurLen == receiveStreamBuffer.size)
                            throw new Exception("Receive from sever no enough buff size:" + bufferCurLen);
                    }
                }
                catch (ObjectDisposedException e)
                {
                    ReportSocketClosed(ESocketError.ERROR_3, e.Message);
                    break;
                }
                catch (Exception e)
                {
                    ReportSocketClosed(ESocketError.ERROR_4, e.Message);
                    break;
                }
            }

            StreamBufferPool.RecycleStream(receiveStreamBuffer);
            if (mStatus == SOCKSTAT.CONNECTED)
            {
                mStatus = SOCKSTAT.CLOSED;
            }
        }

        private void DoReceive(StreamBuffer streamBuffer, ref int bufferCurLen)
        {
            try
            {
                byte[] buf = streamBuffer.ToArray(0, bufferCurLen);
                bufferCurLen = 0;
                mReceiveMsgQueue.Add(buf);
            }
            catch (Exception ex)
            {
                Logger.LogError(string.Format("Tcp receive package err : {0}\n {1}", ex.Message, ex.StackTrace));
            }
        }

        //业务线程调用
        public override void UpdateNetwork()
        {
            if (!mReceiveMsgQueue.Empty())
            {
                mReceiveMsgQueue.MoveTo(mTempMsgList);

                try
                {
                    for (int i = 0; i < mTempMsgList.Count; ++i)
                    {
                        var objMsg = mTempMsgList[i];
                        if (ReceivePkgHandle != null)
                        {
                            ReceivePkgHandle(objMsg);
                        }
                    }
                }
                catch (Exception e)
                {
                    Logger.LogError("Got the fucking exception :" + e.Message);
                }
                finally
                {
                    for (int i = 0; i < mTempMsgList.Count; ++i)
                    {
                        StreamBufferPool.RecycleBuffer(mTempMsgList[i]);
                    }
                    mTempMsgList.Clear();
                }
            }
            base.UpdateNetwork();
        }

        //线程安全，随便调用
        public override void SendMessage(byte[] msgObj)
        {
            mSendMsgQueue.Add(msgObj);
            mSendSemaphore.ProduceResrouce();
        }
    }

#if UNITY_EDITOR
    public static class HjTcpNetworkExporter
    {
        [LuaCallCSharp]
        public static List<Type> LuaCallCSharp = new List<Type>()
        {
            typeof(HjTcpNetwork),
        };

        [CSharpCallLua]
        public static List<Type> CSharpCallLua = new List<Type>()
        {
            typeof(Action<object, int, string>),
            typeof(Action<byte[]>),
        };
    }
#endif
}