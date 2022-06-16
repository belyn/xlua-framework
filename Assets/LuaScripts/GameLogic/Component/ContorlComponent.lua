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
	--消息
	self.reqMoveMsg = CustomMsgIDMap.NewC2SProto(CSCommon_pb.Scene, SceneProtocol_pb.ReqMove)
	self.reqMoveMsg.actorId = tostring(self.actor:GetActorId())

	self.syncPosMsg = CustomMsgIDMap.NewC2SProto(CSCommon_pb.Scene, SceneProtocol_pb.SyncPos)
	self.syncPosMsg.actorId = tostring(self.actor:GetActorId())
    --属性值
	self.lastMove = Vector3.zero
	self.lastMoveSyncTime = 0
	self.lastSyncPosTime = 0
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
	--移动中，定时同步/、广播移动向量
	if self.lastMoveSyncTime ~= 0 and self.lastMoveSyncTime + GameConst.FixMoveVecTime < Time.time then
		local lastMove = CS.ETCInput.GetAxisLastMove("Joystick")
		local distance =  Vector3.Distance(self.lastMove, lastMove)
		if distance > 0 then --向量有偏差
			self:OnSyncMove(lastMove, EActorLookState.Running)
		end
		self.lastMoveSyncTime = Time.time
	end
	--移动中，定时同步移位置
	if self.lastSyncPosTime ~= 0 and self.lastSyncPosTime + GameConst.SyncPosTime < Time.time then
		self:OnSyncPos()
		self.lastSyncPosTime = Time.time
	end
end

--注册ETC事件
local function OnSyncMove(self, lastMove, state)
	self.lastMove = lastMove
	self.lastMoveSyncTime = Time.time
	self.lastSyncPosTime  = Time.time
	print("lastMove *********** ", Time.time, Time.frameCount, lastMove)
	self.reqMoveMsg.curPos.x = Mathf.Floor(self.transform.localPosition.x * GameConst.RealToLogic)
	self.reqMoveMsg.curPos.y = Mathf.Floor(self.transform.localPosition.y * GameConst.RealToLogic)
	self.reqMoveMsg.curPos.z = Mathf.Floor(self.transform.localPosition.z * GameConst.RealToLogic)
	self.reqMoveMsg.behavior.state = state
	self.reqMoveMsg.behavior.forward.x = Mathf.Floor(self.transform.forward.x * GameConst.RealToLogic)
	self.reqMoveMsg.behavior.forward.y = Mathf.Floor(self.transform.forward.y * GameConst.RealToLogic)
	self.reqMoveMsg.behavior.forward.z = Mathf.Floor(self.transform.forward.z * GameConst.RealToLogic)
	self.reqMoveMsg.behavior.moveVec.x = Mathf.Floor(lastMove.x * GameConst.RealToLogic)
	self.reqMoveMsg.behavior.moveVec.y = 0
	self.reqMoveMsg.behavior.moveVec.z = Mathf.Floor(lastMove.z * GameConst.RealToLogic)
	HallConnector:GetInstance():SendMapMessage(CSCommon_pb.Scene, SceneProtocol_pb.ReqMove, self.reqMoveMsg)
	print("OnSyncMove ", self.reqMoveMsg.behavior.moveVec.x, self.reqMoveMsg.behavior.moveVec.y, self.reqMoveMsg.behavior.moveVec.z)
end

local function OnSyncPos(self)
	print("OnSyncPos *********** ", Time.time)
	self.syncPosMsg.curPos.x = Mathf.Floor(self.transform.localPosition.x * GameConst.RealToLogic)
	self.syncPosMsg.curPos.y = Mathf.Floor(self.transform.localPosition.y * GameConst.RealToLogic)
	self.syncPosMsg.curPos.z = Mathf.Floor(self.transform.localPosition.z * GameConst.RealToLogic)
	HallConnector:GetInstance():SendMapMessage(CSCommon_pb.Scene, SceneProtocol_pb.SyncPos, self.syncPosMsg)
	print("OnSyncPos ", self.syncPosMsg.curPos.x, self.syncPosMsg.curPos.y, self.syncPosMsg.curPos.z)
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
	self.lastMoveSyncTime = 0
	self.lastSyncPosTime = 0
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
ContorlComponent.OnSyncPos = OnSyncPos
ContorlComponent.OnMoveEvent = OnMoveEvent
ContorlComponent.OnMoveEndEvent = OnMoveEndEvent
ContorlComponent.RegisterETCEvent = RegisterETCEvent
ContorlComponent.RemoveETCEvent = RemoveETCEvent

return ContorlComponent