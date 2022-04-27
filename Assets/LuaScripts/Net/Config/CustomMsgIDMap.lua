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
	[CombieMsgId(CSCommon_pb.Gate, GateProtocol_pb.CmdC2GLoginTo)] = GateProtocol_pb.C2GLoginTo,
}

-- 服务端=>客户端
local s2c_config = {
	[CombieMsgId(CSCommon_pb.Gate, GateProtocol_pb.CmdG2CLoginTo)] = GateProtocol_pb.G2CLoginTo,
	[CombieMsgId(CSCommon_pb.Gate, GateProtocol_pb.CmdG2CSyncKey)] = GateProtocol_pb.G2CSyncKey,
	[CombieMsgId(CSCommon_pb.Login, CSCommon_pb.CmdLoginError)] = LoginProtocol_pb.LoginError,
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
	C2S = c2s_config,
	NewC2SProto = NewC2SProto,
	S2C = s2c_config,
	NewS2CProto = NewS2CProto,
}
