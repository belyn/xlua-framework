--[[
-- added by marvin @ 2022-5-10
-- 聊天数据
--]]

local ChatModule = BaseClass("ChatModule")

local function __init(self)
	print("ChatModule.__init")
	self.data = nil -- 模块数据
end

local function OnLoadData(self, module_data)
	assert(self.data == nil)
	self.data = PlayerSaveProtocol_pb.ChatModuleData()
	self.data:ParseFromString(module_data)
	print("ChatModule.OnLoadData", self.data)
end

local function OnProtoRetTalkMsg(self, real_msg_id, msg_proto)
	print("OnProtoRetTalkMsg", real_msg_id, msg_proto)
end
local function OnProtoRetTalkHistory(self, real_msg_id, msg_proto)
	print("OnProtoRetTalkHistory", real_msg_id, msg_proto)
end
local function OnProtoNewTalkMsg(self, real_msg_id, msg_proto)
	print("OnProtoNewTalkMsg", real_msg_id, msg_proto)
end

local function AddListener(self)
	print("ChatModule.AddListener")
	HallConnector:GetInstance():RegisterMsgHandler(CSCommon_pb.Player, CSCommon_pb.CmdRetTalkMsg, Bind(self, OnProtoRetTalkMsg))
	HallConnector:GetInstance():RegisterMsgHandler(CSCommon_pb.Player, CSCommon_pb.CmdRetTalkHistory, Bind(self, OnProtoRetTalkHistory))
	HallConnector:GetInstance():RegisterMsgHandler(CSCommon_pb.Player, CSCommon_pb.CmdNewTalkMsg, Bind(self, OnProtoNewTalkMsg))
end

local function RemoveListener(self)
	print("ChatModule.RemoveListener")
	HallConnector:GetInstance():UnRegisterMsgHandler(CSCommon_pb.Player, CSCommon_pb.CmdRetTalkMsg)
	HallConnector:GetInstance():UnRegisterMsgHandler(CSCommon_pb.Player, CSCommon_pb.CmdRetTalkHistory)
	HallConnector:GetInstance():UnRegisterMsgHandler(CSCommon_pb.Player, CSCommon_pb.CmdNewTalkMsg)
end

ChatModule.__init = __init
ChatModule.OnLoadData = OnLoadData
ChatModule.AddListener = AddListener
ChatModule.RemoveListener = RemoveListener

return ChatModule