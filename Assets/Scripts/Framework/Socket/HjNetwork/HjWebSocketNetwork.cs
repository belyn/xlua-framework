using System;
using System.Net.Sockets;
using CustomDataStruct;
using System.Threading;
using System.Collections.Generic;
using XLua;
using WebSocketSharp;

namespace Networks
{
    [Hotfix]
    public class HjWebSocketNetwork: HjNetworkBase
    {
        public Action<byte[]> ReceivePkgHandle = null;
        private Thread mSendThread = null;
        private volatile bool mSendWork = false;
        private HjSemaphore mSendSemaphore = null;

        protected IMessageQueue mSendMsgQueue = null;

        protected WebSocket mClientSocket = null;

        private IMessageQueue mReceiveMsgQueue = null;
        private List<byte[]> mTempMsgList = null;

        public HjWebSocketNetwork(int maxBytesOnceSent = 1024 * 100, int maxReceiveBuffer = 1024 * 512) : base(maxBytesOnceSent, maxReceiveBuffer)
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
                throw new Exception("HjWebSocketNetwork DoConnect error the mStatus expect CLOSED");
            }
            mClientSocket = new WebSocket("ws://" + mIp + ":" + mPort, "chat");
            mClientSocket.OnOpen += MClientSocket_OnOpen;
            mClientSocket.OnError += MClientSocket_OnError;
            mClientSocket.OnMessage += MClientSocket_OnMessage;
            mClientSocket.OnClose += MClientSocket_OnClose;
            mStatus = SOCKSTAT.CONNECTING;
            mClientSocket.ConnectAsync(); 
        }

        private void MClientSocket_OnClose(object sender, CloseEventArgs e)
        {
            Logger.Log("HjWebSocketNetwork, code={0}, reason={1}", e.Code, e.Reason);
            Close();
        }

        private void MClientSocket_OnMessage(object sender, MessageEventArgs e)
        {
            if(e.IsBinary && e.RawData != null && e.RawData.Length > 0)
            {
                mReceiveMsgQueue.Add(e.RawData);
            } 
        }

        private void MClientSocket_OnError(object sender, ErrorEventArgs e)
        {
            Logger.LogError(string.Format("HjWebSocketNetwork OnError : {0}", e.Message));
        }

        private void MClientSocket_OnOpen(object sender, EventArgs e)
        {
            OnConnected();
        }

        protected override void DoClose()
        {
            Logger.Log("HjWebSocketNetword, DoClose, 1");
            mClientSocket.Close(CloseStatusCode.Abnormal);
            Logger.Log("HjWebSocketNetword, DoClose, 2");
            mClientSocket = null;
            base.DoClose();
        }

        public override void StartAllThread()
        {
            base.StartAllThread();

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

                if (mClientSocket == null)
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
                            mClientSocket.Send(msgObj);
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
    public static class HjWebSocketNetworkExporter
    {
        [LuaCallCSharp]
        public static List<Type> LuaCallCSharp = new List<Type>()
        {
            typeof(HjWebSocketNetwork),
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