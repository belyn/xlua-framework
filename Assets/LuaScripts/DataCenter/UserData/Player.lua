--[[
-- added by marvin @ 2022-5-10
-- 玩家数据
--]]

local Player = BaseClass("Player")

local function __init(self)
	print("Player.__init")
	self.modules = {}
	self.modules[PlayerSaveProtocol_pb.PlayerBase] = self
	self.modules[PlayerSaveProtocol_pb.ChatModule] = ChatModule.New()
	self.baseData = nil -- PlayerSaveProtocol_pb.PlayerBase 的模块数据
	self.heartBeatTimer = nil
end

local function OnInit(self)
	print("Player.OnInit")
	for k, module in pairs(self.modules) do
		module:AddListener()
	end
end

local function OnUninit(self)
	print("Player.OnUninit")
	if self.heartBeatTimer then
		self.heartBeatTimer:Stop()
		self.heartBeatTimer = nil
	end
	for k, module in pairs(self.modules) do
		module:RemoveListener()
	end
end

local function OnLoadModuleData(self, msg_proto)
	local module = self:GetModule(msg_proto.player_module_data.moduleId)
	module:OnLoadData(msg_proto.player_module_data.ModuleData)
end

local function OnHeartBeatAction(self)
	print("OnHeartBeatAction")

	local msg = CustomMsgIDMap.NewC2SProto(CSCommon_pb.Gate, GateProtocol_pb.CmdC2GPing)
	msg.tick = Time.realtimeSinceStartup
	HallConnector:GetInstance():SendGateMessage(CSCommon_pb.Gate, GateProtocol_pb.CmdC2GPing, msg)
end

local function OnReady(self)
	print("Player.OnReady")
	for k, module in pairs(self.modules) do
		if type(module.OnLine) == "function" then
			module:OnLine()
		end
	end

	-- 加载玩家数据后开始发心跳包
	assert(self.heartBeatTimer == nil)
	self.heartBeatTimer = TimerManager:GetInstance():GetTimer(15, OnHeartBeatAction, self)
	self.heartBeatTimer:Start()
end

local function GetModule(self, module_id)
	assert(self.modules[module_id] ~= nil)
	return self.modules[module_id]
end

local function OnLoadData(self, module_data)
	self.baseData = PlayerSaveProtocol_pb.PlayerBaseData()
	self.baseData:ParseFromString(module_data)
	print("Player.OnLoadData", self.baseData)
end

local function GetPlayerId(self)
	return self.baseData.playerId
end

local function GetName(self)
	return self.baseData.name
end

local function GetAccount(self)
	return self.baseData.account
end

local function GetCreateTime(self)
	return self.baseData.createTime
end

local function OnProtoG2CPing(self, real_msg_id, msg_proto)
	print("OnProtoG2CPing", real_msg_id, msg_proto)
end
local function OnProtoSyncServerTime(self, real_msg_id, msg_proto)
	print("OnProtoSyncServerTime", real_msg_id, msg_proto)
end
local function OnProtoSyncNotice(self, real_msg_id, msg_proto)
	print("OnProtoSyncNotice", real_msg_id, msg_proto)
end
local function OnProtoErrorCode(self, real_msg_id, msg_proto)
	print("OnProtoErrorCode", real_msg_id, msg_proto)
end
local function OnProtoSyncPlayerBaseData(self, real_msg_id, msg_proto)
	print("OnProtoSyncPlayerBaseData", real_msg_id, msg_proto)
end
local function OnProtoRetViewPlayerInfo(self, real_msg_id, msg_proto)
	print("OnProtoRetViewPlayerInfo", real_msg_id, msg_proto)
end
local function OnProtoSyncLoginToken(self, real_msg_id, msg_proto)
	print("OnProtoSyncLoginToken", real_msg_id, msg_proto)
end

local function AddListener(self)
	print("Player.AddListener")
	HallConnector:GetInstance():RegisterMsgHandler(CSCommon_pb.Gate, GateProtocol_pb.CmdG2CPing, Bind(self, OnProtoG2CPing))
	HallConnector:GetInstance():RegisterMsgHandler(CSCommon_pb.Player, CSCommon_pb.CmdSyncServerTime, Bind(self, OnProtoSyncServerTime))
	HallConnector:GetInstance():RegisterMsgHandler(CSCommon_pb.Player, CSCommon_pb.CmdSyncNotice, Bind(self, OnProtoSyncNotice))
	HallConnector:GetInstance():RegisterMsgHandler(CSCommon_pb.Player, CSCommon_pb.CmdErrorCode, Bind(self, OnProtoErrorCode))
	HallConnector:GetInstance():RegisterMsgHandler(CSCommon_pb.Player, CSCommon_pb.CmdSyncPlayerBaseData, Bind(self, OnProtoSyncPlayerBaseData))
	HallConnector:GetInstance():RegisterMsgHandler(CSCommon_pb.Player, CSCommon_pb.CmdRetViewPlayerInfo, Bind(self, OnProtoRetViewPlayerInfo))
	HallConnector:GetInstance():RegisterMsgHandler(CSCommon_pb.Player, CSCommon_pb.CmdSyncLoginToken, Bind(self, OnProtoSyncLoginToken))
end

local function RemoveListener(self)
	print("Player.RemoveListener")
	HallConnector:GetInstance():UnRegisterMsgHandler(CSCommon_pb.Gate, GateProtocol_pb.CmdG2CPing)
	HallConnector:GetInstance():UnRegisterMsgHandler(CSCommon_pb.Player, CSCommon_pb.CmdSyncServerTime)
	HallConnector:GetInstance():UnRegisterMsgHandler(CSCommon_pb.Player, CSCommon_pb.CmdSyncNotice)
	HallConnector:GetInstance():UnRegisterMsgHandler(CSCommon_pb.Player, CSCommon_pb.CmdErrorCode)
	HallConnector:GetInstance():UnRegisterMsgHandler(CSCommon_pb.Player, CSCommon_pb.CmdSyncPlayerBaseData)
	HallConnector:GetInstance():UnRegisterMsgHandler(CSCommon_pb.Player, CSCommon_pb.CmdRetViewPlayerInfo)
	HallConnector:GetInstance():UnRegisterMsgHandler(CSCommon_pb.Player, CSCommon_pb.CmdSyncLoginToken)
end

Player.__init = __init
Player.OnInit = OnInit
Player.OnUninit = OnUninit
Player.OnLoadModuleData = OnLoadModuleData
Player.OnReady = OnReady
Player.GetModule = GetModule

Player.OnLoadData = OnLoadData
Player.AddListener = AddListener
Player.RemoveListener = RemoveListener
Player.GetPlayerId = GetPlayerId
Player.GetName = GetName
Player.GetAccount = GetAccount
Player.GetCreateTime = GetCreateTime

return Player