--[[
-- added by wsh @ 2017-01-09
-- 大厅网络连接器
--]]

local HallConnector = BaseClass("HallConnector", Singleton)
local SendMsgDefine = require "Net.Config.SendMsgDefine"
local NetUtil = require "Net.Util.NetUtil"
local ByteArray = require "Net.Connector.ByteArray"
local PackageLen = 4

local ConnStatus = {
	Init = 0,
	Connecting = 1,
	WaitLogin = 2,
	Done = 3,
}

local function __init(self)
	self.hallSocket = nil
	self.globalSeq = 0
	self.m_sReadBuff = ByteArray.New(ByteArray.ENDIAN_LITTLE)
end

local function OnReceivePackage(self, receive_bytes)
	assert(receive_bytes ~= nil and type(receive_bytes) == "string")
	print("OnReceivePackage:", string.byte(receive_bytes, 1, string.len(receive_bytes)))
	self.m_sReadBuff:writeBuf(receive_bytes)
	self.m_sReadBuff:setPos(1)

	local receive_msgs = NetUtil.DeserializeMessage(self.m_sReadBuff)

	if self.m_sReadBuff:getAvailable() > 0 then
		local nLeft = self.m_sReadBuff:getAvailable()
		local msgData = self.m_sReadBuff:readBuf(nLeft)
		assert(self.m_sReadBuff:getAvailable() == 0)
		self.m_sReadBuff:setPos(1)
		self.m_sReadBuff:setLen(0)
		self.m_sReadBuff:writeBuf(msgData)
		
		self.m_sReadBuff:setPos(1)
		assert(self.m_sReadBuff:getAvailable() == nLeft)
	else
		self.m_sReadBuff:setPos(1)
		self.m_sReadBuff:setLen(0)
	end

	for i = 1, #receive_msgs do
		local receive_msg = receive_msgs[i]
		Logger.Log(tostring(receive_msg))
		-- TODO 协议分发
	end
end

local function Connect(self, host_ip, host_port, on_connect, on_close)
	if not self.hallSocket then
		self.hallSocket = CS.Networks.HjTcpNetwork()
		self.hallSocket.ReceivePkgHandle = Bind(self, OnReceivePackage)
	end
	self.m_sReadBuff:setPos(1)
	self.m_sReadBuff:setLen(0)
	self.hallSocket.OnConnect = on_connect
	self.hallSocket.OnClosed = on_close
	self.hallSocket:SetHostPort(host_ip, host_port)
	self.hallSocket:Connect()
	Logger.Log("Connect to "..host_ip..", port : "..host_port)
	return self.hallSocket
end

local function SendMessage(self, msg_id, msg_obj, show_mask, need_resend)
	show_mask = show_mask == nil and true or show_mask
	need_resend = need_resend == nil and true or need_resend
	
	local request_seq = 0
	local send_msg = SendMsgDefine.New(msg_id, msg_obj, request_seq)
	local msg_bytes = NetUtil.SerializeMessage(send_msg, self.globalSeq)
	Logger.Log(tostring(send_msg))
	self.hallSocket:SendMessage(msg_bytes)
	self.globalSeq = self.globalSeq + 1
end

local function Update(self)
	if self.hallSocket then
		self.hallSocket:UpdateNetwork()
	end
end

local function Disconnect(self)
	if self.hallSocket then
		self.hallSocket:Disconnect()
	end
end

local function Dispose(self)
	if self.hallSocket then
		self.hallSocket:Dispose()
	end
	self.hallSocket = nil
end

HallConnector.__init = __init
HallConnector.Connect = Connect
HallConnector.SendMessage = SendMessage
HallConnector.Update = Update
HallConnector.Disconnect = Disconnect
HallConnector.Dispose = Dispose

return HallConnector
