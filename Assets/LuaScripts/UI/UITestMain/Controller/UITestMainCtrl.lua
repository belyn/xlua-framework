--[[
-- added by wsh @ 2018-02-26
-- UITestMain控制层
--]]

local UITestMainCtrl = BaseClass("UITestMainCtrl", UIBaseCtrl)

local function StartFighting(self)
	--发送协议进行战斗匹配
	local msg_match_map = CustomMsgIDMap.NewC2SProto(CSCommon_pb.Gate, GateProtocol_pb.CmdC2GMatchMap)
	msg_match_map.nMapId = 0
	HallConnector:GetInstance():SendGateMessage(CSCommon_pb.Gate, GateProtocol_pb.CmdC2GMatchMap, msg_match_map)
end

local function Logout(self)
	SceneManager:GetInstance():SwitchScene(SceneConfig.LoginScene)
end

UITestMainCtrl.StartFighting = StartFighting
UITestMainCtrl.Logout = Logout

return UITestMainCtrl