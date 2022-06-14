--[[
-- 临时Demo：战斗场景角色动画控制脚本
-- added by hwp @ 2022-5-20
-- 控制组件
--]]
local ComponentBase = require "GameLogic.Component.ComponentBase"

local MoveComponent = BaseClass("MoveComponent", ComponentBase)

local function __init(self)
    assert(self.actor.actor_type == SceneProtocol_pb.Avatar)
	local ecs_entity_mgr = MapManager:GetInstance():GetEcsEntityMgr()
    self.chara_ctrl =  ecs_entity_mgr:GetCharacterController(self.actor.ecs_entity)
	assert(not IsNull(self.chara_ctrl))
	self.transform = ecs_entity_mgr:GetTransform(self.actor.ecs_entity)
	assert(not IsNull(self.transform))

    self.moveVec = Vector3.zero
end

local function __delete(self)
    self.chara_ctrl = nil
	self.transform = nil
end

local function Update(self)
    self.chara_ctrl:Move(self.moveVec * Time.deltaTime)
end

local function OnMove(self, msg_proto)
    local localPosition = Vector3.New(msg_proto.curPos.x / GameConst.RealToLogic, msg_proto.curPos.y / GameConst.RealToLogic, msg_proto.curPos.z / GameConst.RealToLogic)
    self.transform.forward =  Vector3.New(msg_proto.behavior.forward.x / GameConst.RealToLogic, msg_proto.behavior.forward.y / GameConst.RealToLogic, msg_proto.behavior.forward.z / GameConst.RealToLogic)
    self.actor:ChangeLookState(msg_proto.behavior.state)
    local distance =  Vector3.Distance(self.transform.localPosition, localPosition)
    local moveVec = Vector3.New(msg_proto.behavior.moveVec.x / GameConst.RealToLogic, 0, msg_proto.behavior.moveVec.z / GameConst.RealToLogic)
    if moveVec == Vector3.zero and distance > GameConst.FixPosDistance then --移动结束时，进行位置判断处理
        self.transform.localPosition = localPosition
        print("OnSyncPos localPosition", self.transform.localPosition, " sync LocalPosition ", localPosition, "distance ", distance)
    end
    self.moveVec = moveVec
    self.moveVec.y = -GameConst.Gravity --施加重力
end

MoveComponent.__init = __init
MoveComponent.__delete = __delete
MoveComponent.Update = Update
MoveComponent.OnMove = OnMove

return MoveComponent