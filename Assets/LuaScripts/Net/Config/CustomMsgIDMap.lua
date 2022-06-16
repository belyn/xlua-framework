--[[
-- 2022.4.26 added by marvin
-- 协议Id映射配置及实例化
--]]

local function CombieMsgId(module_id, msg_id)
	return (msg_id << 8) + module_id
end

local function TranslateMsgId(real_msg_id)
	return real_msg_id & 0xff, real_msg_id >> 8
end

-- 客户端=>服务端
local c2s_config = {
	-- 网关
	[CombieMsgId(CSCommon_pb.Gate, GateProtocol_pb.CmdC2GLoginTo)] = GateProtocol_pb.C2GLoginTo,
	[CombieMsgId(CSCommon_pb.Gate, GateProtocol_pb.CmdC2GSendData)] = GateProtocol_pb.C2GSendData,
	[CombieMsgId(CSCommon_pb.Gate, GateProtocol_pb.CmdC2GPing)] = GateProtocol_pb.C2GPing,
	[CombieMsgId(CSCommon_pb.Gate, GateProtocol_pb.CmdC2GPingServerNet)] = GateProtocol_pb.C2GPingServerNet,
	[CombieMsgId(CSCommon_pb.Gate, GateProtocol_pb.CmdC2GMatchMap)] = GateProtocol_pb.C2GMatchMap,
	[CombieMsgId(CSCommon_pb.Gate, GateProtocol_pb.CmdC2GLeaveMap)] = GateProtocol_pb.C2GLeaveMap,

	-- 登录
	[CombieMsgId(CSCommon_pb.Login, CSCommon_pb.CmdRequestPlayerList)] = LoginProtocol_pb.RequestPlayerList,
	[CombieMsgId(CSCommon_pb.Login, CSCommon_pb.CmdRequestLoadPlayer)] = LoginProtocol_pb.RequestLoadPlayer,
	[CombieMsgId(CSCommon_pb.Login, CSCommon_pb.CmdRequestCreatePlayer)] = LoginProtocol_pb.RequestCreatePlayer,

	-- 游服
	[CombieMsgId(CSCommon_pb.Player, CSCommon_pb.CmdHeartBeat)] = PlayerProtocol_pb.HeartBeat,
	[CombieMsgId(CSCommon_pb.Player, CSCommon_pb.CmdTalkMsg)] = PlayerProtocol_pb.ReqTalkMsg,
	[CombieMsgId(CSCommon_pb.Player, CSCommon_pb.CmdChangeName)] = PlayerProtocol_pb.ChangeName,
	[CombieMsgId(CSCommon_pb.Player, CSCommon_pb.CmdChangeHead)] = PlayerProtocol_pb.ChangeHead,
	[CombieMsgId(CSCommon_pb.Player, CSCommon_pb.CmdReqViewPlayerInfo)] = PlayerProtocol_pb.ReqViewPlayerInfo,
	[CombieMsgId(CSCommon_pb.Player, CSCommon_pb.CmdReqServerTime)] = PlayerProtocol_pb.ReqServerTime,
	[CombieMsgId(CSCommon_pb.Player, CSCommon_pb.CmdReqLoginToken)] = PlayerProtocol_pb.ReqLoginToken,

	--地图服
	[CombieMsgId(CSCommon_pb.Scene, SceneProtocol_pb.ReqMove)] = SceneProtocol_pb.MoveData,
	[CombieMsgId(CSCommon_pb.Scene, SceneProtocol_pb.SyncPos)] = SceneProtocol_pb.SyncPosData,
}

-- 服务端=>客户端
local s2c_config = {
	-- 网关
	[CombieMsgId(CSCommon_pb.Gate, GateProtocol_pb.CmdG2CLoginTo)] = GateProtocol_pb.G2CLoginTo,
	[CombieMsgId(CSCommon_pb.Gate, GateProtocol_pb.CmdG2CSyncKey)] = GateProtocol_pb.G2CSyncKey,
	[CombieMsgId(CSCommon_pb.Gate, GateProtocol_pb.CmdG2CPing)] = GateProtocol_pb.G2CPing,
	[CombieMsgId(CSCommon_pb.Gate, GateProtocol_pb.CmdG2CKickout)] = GateProtocol_pb.G2CKickout,
	[CombieMsgId(CSCommon_pb.Gate, GateProtocol_pb.CmdG2CMatchMap)] = GateProtocol_pb.G2CMatchMap,
	[CombieMsgId(CSCommon_pb.Gate, GateProtocol_pb.CmdG2CMapKickout)] = GateProtocol_pb.G2CMapKickout,
	[CombieMsgId(CSCommon_pb.Gate, GateProtocol_pb.CmdG2CPingServerNet)] = GateProtocol_pb.G2CPingServerNet,

	-- 登录
	[CombieMsgId(CSCommon_pb.Login, CSCommon_pb.CmdLoginError)] = LoginProtocol_pb.LoginError,
	[CombieMsgId(CSCommon_pb.Login, CSCommon_pb.CmdPlayerListResult)] = LoginProtocol_pb.PlayerListResult,
	[CombieMsgId(CSCommon_pb.Login, CSCommon_pb.CmdCreatePlayerError)] = LoginProtocol_pb.CreatePlayerError,
	[CombieMsgId(CSCommon_pb.Login, CSCommon_pb.CmdBeginLoadData)] = LoginProtocol_pb.BeginLoadData,
	[CombieMsgId(CSCommon_pb.Login, CSCommon_pb.CmdPlayerModuleData)] = LoginProtocol_pb.PlayerModuleData,
	[CombieMsgId(CSCommon_pb.Login, CSCommon_pb.CmdPlayerReady)] = LoginProtocol_pb.PlayerReady,

	-- 游服
	[CombieMsgId(CSCommon_pb.Player, CSCommon_pb.CmdRetTalkMsg)] = PlayerProtocol_pb.RetTalkMsg,
	[CombieMsgId(CSCommon_pb.Player, CSCommon_pb.CmdSyncServerTime)] = PlayerProtocol_pb.SyncServerTime,
	[CombieMsgId(CSCommon_pb.Player, CSCommon_pb.CmdSyncNotice)] = PlayerProtocol_pb.SyncNotice,
	[CombieMsgId(CSCommon_pb.Player, CSCommon_pb.CmdErrorCode)] = PlayerProtocol_pb.ErrorCode,
	[CombieMsgId(CSCommon_pb.Player, CSCommon_pb.CmdRetTalkHistory)] = PlayerProtocol_pb.ChatData,
	[CombieMsgId(CSCommon_pb.Player, CSCommon_pb.CmdNewTalkMsg)] = PlayerProtocol_pb.SyncTalkMsg,
	[CombieMsgId(CSCommon_pb.Player, CSCommon_pb.CmdSyncPlayerBaseData)] = PlayerProtocol_pb.SyncPlayerBaseData,
	[CombieMsgId(CSCommon_pb.Player, CSCommon_pb.CmdRetViewPlayerInfo)] = PlayerProtocol_pb.RetViewPlayerInfo,
	[CombieMsgId(CSCommon_pb.Player, CSCommon_pb.CmdSyncLoginToken)] = PlayerProtocol_pb.SyncLoginToken,

	--地图服
	[CombieMsgId(CSCommon_pb.Scene, SceneProtocol_pb.CmdSyncEnterScene)] = SceneProtocol_pb.SceneEntityInfo,
	[CombieMsgId(CSCommon_pb.Scene, SceneProtocol_pb.CmdSyncSceneEventData)] = SceneProtocol_pb.SceneEventData,
}

local function NewC2SProto(module_id, msg_id)
	local real_msg_id = CombieMsgId(module_id, msg_id)
	local proto_config = c2s_config[real_msg_id]
	assert(proto_config ~= nil, string.format("NewC2SProto error, module_id=%d, msg_id=%d", module_id, msg_id))
	return proto_config()
end

local function NewS2CProto(real_msg_id)
	local proto_config = s2c_config[real_msg_id]
	if proto_config ~= nil then
		return proto_config()
	end
end

return {
	TranslateMsgId = TranslateMsgId,
	CombieMsgId = CombieMsgId,
	NewC2SProto = NewC2SProto,
	NewS2CProto = NewS2CProto,
}
