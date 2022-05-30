--[[
-- added by wsh @ 2017-01-09
-- 大厅网络连接器
--]]
local pcall = pcall
local traceback = debug.traceback

local HallConnector = BaseClass("HallConnector", Singleton)
local SendMsgDefine = require "Net.Config.SendMsgDefine"
local NetUtil = require "Net.Util.NetUtil"
local ByteArray = require "Net.Connector.ByteArray"

local function __init(self)
	self.hallSocket = nil
	self.globalSeq = 0
	self.nRndKey = 0 -- 网关密钥
	self.readBuff = ByteArray.New(ByteArray.ENDIAN_LITTLE)
	self.tMsgHandler = {} -- 协议监听
end

local function __delete(self)
	if self.hallSocket ~= nil then
		self.hallSocket.Dispose()
		self.hallSocket = nil
	end
	self.readBuff = nil
	self.tMsgHandler = {}
end

local function SetRndKey(self, rnd_key)
	self.nRndKey = rnd_key
end

local function RegisterMsgHandler(self, module_id, msg_id, func)
	assert(type(func) == "function")
	local real_msg_id = CustomMsgIDMap.CombieMsgId(module_id, msg_id)
	print(string.format("HallConnector.RegisterMsgHandler, real_msg_id[%d](module_id:%d, msg_id:%d)", real_msg_id, module_id, msg_id))
	assert(self.tMsgHandler[real_msg_id] == nil)
	self.tMsgHandler[real_msg_id] = func
end

local function UnRegisterMsgHandler(self, module_id, msg_id)
	local real_msg_id = CustomMsgIDMap.CombieMsgId(module_id, msg_id)
	print(string.format("HallConnector.UnRegisterMsgHandler, real_msg_id[%d](module_id:%d, msg_id:%d)", real_msg_id, module_id, msg_id))
	assert(type(self.tMsgHandler[real_msg_id]) == "function")
	self.tMsgHandler[real_msg_id] = nil
end

local function OnReceivePackage(self, receive_bytes)
	assert(receive_bytes ~= nil and type(receive_bytes) == "string")
	-- print("OnReceivePackage:", string.byte(receive_bytes, 1, string.len(receive_bytes)))
	self.readBuff:writeBuf(receive_bytes)
	self.readBuff:setPos(1)

	local receive_msgs = NetUtil.DeserializeMessage(self.readBuff)

	if self.readBuff:getAvailable() > 0 then
		local nLeft = self.readBuff:getAvailable()
		local msgData = self.readBuff:readBuf(nLeft)
		assert(self.readBuff:getAvailable() == 0)
		self.readBuff:setPos(1)
		self.readBuff:setLen(0)
		self.readBuff:writeBuf(msgData)
		
		assert(self.readBuff:getLen() == nLeft)
	else
		self.readBuff:setPos(1)
		self.readBuff:setLen(0)
	end

	for i = 1, #receive_msgs do
		local receive_msg = receive_msgs[i]
		-- 协议分发
		local real_msg_id = receive_msg.MsgID
		print(string.format("real_msg_id[%d](module_id:%d, msg_id:%d)", real_msg_id, CustomMsgIDMap.TranslateMsgId(real_msg_id)), tostring(receive_msg))
		local handler = self.tMsgHandler[real_msg_id]
		if handler ~= nil then
			local status,err = pcall(handler, real_msg_id, receive_msg.MsgProto)
			if not status then
				Logger.LogError(string.format("HallConnector Dispatch real_msg_id[%d](module_id:%d, msg_id:%d) handler err :", real_msg_id, CustomMsgIDMap.TranslateMsgId(real_msg_id))..err.."\n"..traceback())
			end
		else 
			Logger.Log(string.format("HallConnector Dispatch real_msg_id[%d](module_id:%d, msg_id:%d)  handler is nil", real_msg_id, CustomMsgIDMap.TranslateMsgId(real_msg_id)))
		end
	end
end

local function Connect(self, host_ip, host_port, on_connect, on_close)
	if not self.hallSocket then
		self.hallSocket = CS.Networks.HjTcpNetwork()
		-- self.hallSocket = CS.Networks.HjWebSocketNetwork()
		self.hallSocket.ReceivePkgHandle = Bind(self, OnReceivePackage)
	end
	self.readBuff:setPos(1)
	self.readBuff:setLen(0)
	self.globalSeq = 0
	self.hallSocket.OnConnect = on_connect
	self.hallSocket.OnClosed = on_close
	self.hallSocket:SetHostPort(host_ip, host_port)
	self.hallSocket:Connect()
	Logger.Log("Connect to "..host_ip..", port : "..host_port)
	return self.hallSocket
end

local function SendGateMessage(self, module_id, msg_id, msg_obj)
	local real_msg_id = CustomMsgIDMap.CombieMsgId(module_id, msg_id)
	local send_msg = SendMsgDefine.New(real_msg_id, msg_obj)
	local msg_bytes = NetUtil.SerializeMessage(send_msg)
	Logger.Log(tostring(send_msg))
	self.hallSocket:SendMessage(msg_bytes)
end

local function _SendMessage(self, module_id, msg_id, msg_obj, nSendType)
	assert(nSendType)
	local real_msg_id = CustomMsgIDMap.CombieMsgId(module_id, msg_id)
	local send_msg = SendMsgDefine.New(real_msg_id, msg_obj)
	Logger.Log(tostring(send_msg) .. " ********* " .. #(msg_obj:SerializeToString()))

	self.globalSeq = self.globalSeq + 1
	local pbC2GSendData = CustomMsgIDMap.NewC2SProto(CSCommon_pb.Gate, GateProtocol_pb.CmdC2GSendData)
	pbC2GSendData.proto_data = NetUtil.SerializeMessage(send_msg)
	pbC2GSendData.package_index = self.globalSeq
	pbC2GSendData.data_type = nSendType
	local package_key = NetUtil.CalcPackageKey(pbC2GSendData.proto_data, self.globalSeq, self.nRndKey)
	pbC2GSendData.package_key = package_key

	local nC2GSendDataMsgId = CustomMsgIDMap.CombieMsgId(CSCommon_pb.Gate, GateProtocol_pb.CmdC2GSendData)
	local c2gSendDataMsg = SendMsgDefine.New(nC2GSendDataMsgId, pbC2GSendData)
	local c2gMsgBytes = NetUtil.SerializeMessage(c2gSendDataMsg)

	self.hallSocket:SendMessage(c2gMsgBytes)
end

local function SendLogicMessage(self, module_id, msg_id, msg_obj)
	self:_SendMessage(module_id, msg_id, msg_obj, GateProtocol_pb.C2GSendData_ESendDataType_Logic)
end

local function SendMapMessage(self, module_id, msg_id, msg_obj)
	self:_SendMessage(module_id, msg_id, msg_obj, GateProtocol_pb.C2GSendData_ESendDataType_Map)
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
HallConnector.SendGateMessage = SendGateMessage
HallConnector._SendMessage = _SendMessage
HallConnector.SendLogicMessage = SendLogicMessage
HallConnector.SendMapMessage = SendMapMessage
HallConnector.Update = Update
HallConnector.Disconnect = Disconnect
HallConnector.Dispose = Dispose
HallConnector.RegisterMsgHandler = RegisterMsgHandler
HallConnector.UnRegisterMsgHandler = UnRegisterMsgHandler
HallConnector.SetRndKey = SetRndKey

return HallConnector
