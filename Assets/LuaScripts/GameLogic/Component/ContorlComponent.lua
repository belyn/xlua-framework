--[[
-- 临时Demo：战斗场景角色动画控制脚本
-- added by hwp @ 2022-5-20
-- 控制组件
--]]
local ComponentBase = require "GameLogic.Component.ComponentBase"

local ContorlComponent = BaseClass("ContorlComponent", ComponentBase)

local function __init(self)
    assert(self.actor.actor_type == SceneProtocol_pb.Avatar)
	local ecs_entity_mgr = MapManager:GetInstance():GetEcsEntityMgr()
    self.chara_ctrl =  ecs_entity_mgr:GetCharacterController(self.actor.ecs_entity)
	assert(not IsNull(self.chara_ctrl))
	self.transform = ecs_entity_mgr:GetTransform(self.actor.ecs_entity)
	assert(not IsNull(self.transform))
    self.lastMove = Vector3.zero

	CS.ETCInput.SetTurnMoveSpeed("Joystick", GameConst.AvatarSpeed)
	self:RegisterETCEvent()
end

local function __delete(self)
    self.chara_ctrl = nil
	self.transform = nil
	self:RemoveETCEvent()
end

local function LateUpdate(self)
	local input_H = CS.ETCInput.GetAxis("Horizontal")
	local input_V = CS.ETCInput.GetAxis("Vertical")
	if not self.chara_ctrl.isGrounded then
		self.actor:ChangeLookState(EActorLookState.Falling)
	elseif input_V ~= 0 or input_H ~= 0 then
		self.actor:ChangeLookState(EActorLookState.Running)
	else
		self.actor:ChangeLookState(EActorLookState.Idle)
	end
end

--注册ETC事件
local function OnSyncMove(self, lastMove, state)
	self.lastMove = lastMove
	print("lastMove *********** ", Time.time, Time.frameCount, lastMove)
    local ecs_entity_mgr = MapManager:GetInstance():GetEcsEntityMgr()
	local msg = CustomMsgIDMap.NewC2SProto(CSCommon_pb.Scene, SceneProtocol_pb.ReqMove)
	msg.actorId = tostring(self.actor:GetActorId())
	msg.curPos.x = Mathf.Floor(self.transform.localPosition.x * GameConst.RealToLogic)
	msg.curPos.y = Mathf.Floor(self.transform.localPosition.y * GameConst.RealToLogic)
	msg.curPos.z = Mathf.Floor(self.transform.localPosition.z * GameConst.RealToLogic)
	msg.behavior.state = state
	msg.behavior.forward.x = Mathf.Floor(self.transform.forward.x * GameConst.RealToLogic)
	msg.behavior.forward.y = Mathf.Floor(self.transform.forward.y * GameConst.RealToLogic)
	msg.behavior.forward.z = Mathf.Floor(self.transform.forward.z * GameConst.RealToLogic)
	msg.behavior.moveVec.x = Mathf.Floor(lastMove.x * GameConst.RealToLogic)
	msg.behavior.moveVec.y = 0
	msg.behavior.moveVec.z = Mathf.Floor(lastMove.z * GameConst.RealToLogic)
	HallConnector:GetInstance():SendMapMessage(CSCommon_pb.Scene, SceneProtocol_pb.ReqMove, msg)
	print("OnSyncMove ", msg.behavior.moveVec.x, msg.behavior.moveVec.y, msg.behavior.moveVec.z)
end

local function OnMoveEvent(self)
    local lastMove = CS.ETCInput.GetAxisLastMove("Joystick")
	local distance =  Vector3.Distance(self.lastMove, lastMove)
	if distance < GameConst.FixMoveVec then --偏差值过大，进行同步
		return
	end
	self:OnSyncMove(lastMove, EActorLookState.Running)
end

local function OnMoveEndEvent(self)
	self:OnSyncMove(Vector3.zero, EActorLookState.Idle) --结束移动，直接同步
end

local function RegisterETCEvent(self)
	local joystick =  CS.ETCInput.GetControlJoystick("Joystick")
	assert(not IsNull(joystick))
	joystick.onMove:AddListener(Bind(self, OnMoveEvent))
	joystick.onMoveEnd:AddListener(Bind(self, OnMoveEndEvent))
end

local function RemoveETCEvent(self)
	local joystick =  CS.ETCInput.GetControlJoystick("Joystick")
	assert(not IsNull(joystick))
	joystick.onMove:RemoveAllListeners()
	joystick.onMoveEnd:RemoveAllListeners()
end

ContorlComponent.__init = __init
ContorlComponent.__delete = __delete
ContorlComponent.LateUpdate = LateUpdate
ContorlComponent.OnSyncMove = OnSyncMove
ContorlComponent.OnMoveEvent = OnMoveEvent
ContorlComponent.OnMoveEndEvent = OnMoveEndEvent
ContorlComponent.RegisterETCEvent = RegisterETCEvent
ContorlComponent.RemoveETCEvent = RemoveETCEvent

return ContorlComponent