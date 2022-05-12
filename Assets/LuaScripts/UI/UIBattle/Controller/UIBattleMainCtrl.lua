--[[
-- added by wsh @ 2018-02-26
-- UIBattleMain控制层
--]]

local UIBattleMainCtrl = BaseClass("UIBattleMainCtrl", UIBaseCtrl)

local function Back(self)
	--退出地图
	local msg_leave_map = CustomMsgIDMap.NewC2SProto(CSCommon_pb.Gate, GateProtocol_pb.CmdC2GLeaveMap)
	HallConnector:GetInstance():SendGateMessage(CSCommon_pb.Gate, GateProtocol_pb.CmdC2GLeaveMap, msg_leave_map)
	
	--切换场景
	SceneManager:GetInstance():SwitchScene(SceneConfig.HomeScene)
end

UIBattleMainCtrl.Back = Back

return UIBattleMainCtrl