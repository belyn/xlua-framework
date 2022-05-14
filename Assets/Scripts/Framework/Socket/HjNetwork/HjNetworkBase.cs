using System;
using System.Collections.Generic;
using System.Net.Sockets;
using CustomDataStruct;
using System.Threading;

namespace Networks
{
    public enum SOCKSTAT
    {
        CLOSED = 0,
        CONNECTING,
        CONNECTED,
    }

    public abstract class HjNetworkBase
    {
        public Action<object, int, string> OnConnect = null;
        public Action<object, int, string> OnClosed = null;

        private List<HjNetworkEvt> mNetworkEvtList = null;
        private object mNetworkEvtLock = null;

        protected int mMaxBytesOnceSent = 0;
        protected int mMaxReceiveBuffer = 0;

        protected string mIp;
        protected int mPort;
        protected volatile SOCKSTAT mStatus = SOCKSTAT.CLOSED;

        public HjNetworkBase(int maxBytesOnceSent = 1024 * 512, int maxReceiveBuffer = 1024 * 1024 * 2)
        {
            mStatus = SOCKSTAT.CLOSED;
            
            mMaxBytesOnceSent = maxBytesOnceSent;
            mMaxReceiveBuffer = maxReceiveBuffer;

            mNetworkEvtList = new List<HjNetworkEvt>();
            mNetworkEvtLock = new object();
        }

        public virtual void Dispose()
        {
            Close();
        }

        public void SetHostPort(string ip, int port)
        {
            mIp = ip;
            mPort = port;
        }
        
        protected abstract void DoConnect();
        public void Connect()
        {
            Close();

            int result = ESocketError.NORMAL;
            string msg = null;
            try
            {
                DoConnect();
            }
            catch (ObjectDisposedException ex)
            {
                result = ESocketError.ERROR_3;
                msg = ex.Message;
                mStatus = SOCKSTAT.CLOSED;
            }
            catch (Exception ex)
            {
                result = ESocketError.ERROR_4;
                msg = ex.Message;
                mStatus = SOCKSTAT.CLOSED;
            }
            finally
            {
                if (result != ESocketError.NORMAL && OnConnect != null)
                {
                    ReportSocketConnected(result, msg);
                }
            }
        }

        protected virtual void OnConnected()
        {
            StartAllThread();
            mStatus = SOCKSTAT.CONNECTED;
            ReportSocketConnected(ESocketError.NORMAL, "Connect successfully");
        }

        public virtual void StartAllThread()
        {
        }

        public virtual void StopAllThread()
        {
        }

        protected virtual void DoClose()
        {
            StopAllThread();
        }

        public virtual void Close()
        {
            if (SOCKSTAT.CLOSED == mStatus) return;

            mStatus = SOCKSTAT.CLOSED;
            try
            {
                DoClose();
                ReportSocketClosed(ESocketError.ERROR_5, "Disconnected!");
            }
            catch (Exception e)
            {
                ReportSocketClosed(ESocketError.ERROR_4, e.Message);
            }
        }

        protected void ReportSocketConnected(int result, string msg)
        {
            if (OnConnect != null)
            {
                AddNetworkEvt(new HjNetworkEvt(this, result, msg, OnConnect));
            }
        }

        protected void ReportSocketClosed(int result, string msg)
        {
            if (OnClosed != null)
            {
                AddNetworkEvt(new HjNetworkEvt(this, result, msg, OnClosed));
            }
        }

        
        protected void AddNetworkEvt(HjNetworkEvt evt)
        {
            lock (mNetworkEvtLock)
            {
                mNetworkEvtList.Add(evt);
            }
        }

        private void UpdateEvt()
        {
            lock (mNetworkEvtLock)
            {
                try
                {
                    for (int i = 0; i < mNetworkEvtList.Count; ++i)
                    {
                        HjNetworkEvt evt = mNetworkEvtList[i];
                        evt.evtHandle(evt.sender, evt.result, evt.msg);
                    }
                }
                catch (Exception e)
                {
                    Logger.LogError("Got the fucking exception :" + e.Message);
                }
                finally
                {
                    mNetworkEvtList.Clear();
                }
            }
        }

        public virtual void UpdateNetwork()
        {
            UpdateEvt();
        }

        // 发送消息的时候要注意对buffer进行拷贝，网络层发送完毕以后会对buffer执行回收
        public virtual void SendMessage(byte[] msgObj)
        {
        }

        public bool IsConnect()
        {
            return mStatus == SOCKSTAT.CONNECTED;
        }
    }
}
