--[[
-- 临时Demo：战斗场景角色动画控制脚本
-- added by hwp @ 2022-5-20
-- 控制组件
--]]
local ComponentBase = require "GameLogic.Component.ComponentBase"

local MoveComponent = BaseClass("MoveComponent", ComponentBase)

local function __init(self)
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
    local localPosition = Vector3.New(msg_proto.curPos.x, msg_proto.curPos.y, msg_proto.curPos.z)
    localPosition = localPosition / GameConst.RealToLogic
    local forward = Vector3.New(msg_proto.behavior.forward.x, msg_proto.behavior.forward.y, msg_proto.behavior.forward.z)
    self.transform.forward =  forward / GameConst.RealToLogic
    self.actor:ChangeLookState(msg_proto.behavior.state)
    local distance =  Vector3.Distance(self.transform.localPosition, localPosition)
    local moveVec = Vector3.New(msg_proto.behavior.moveVec.x, 0, msg_proto.behavior.moveVec.z)
    moveVec = moveVec / GameConst.RealToLogic
    if moveVec == Vector3.zero and distance > GameConst.FixPosDistance then --移动结束时，进行位置判断处理
        self.transform.localPosition = localPosition
        print("OnSyncPos localPosition", self.transform.localPosition, " sync LocalPosition ", localPosition, "distance ", distance)
    end
    self.moveVec = moveVec
    self.moveVec.y = -GameConst.Gravity --施加重力

    local dir = Vector3.Clone(self.moveVec)
    dir.y = 0
    dir:Normalize()
    -- 爬墙检测
    local raycastHit = CS.PhysicsUtils.Raycast(self.transform.localPosition, dir, Mathf.Infinity, 1 << 8)
    if not IsNull(raycastHit.collider) then
       print("hit wall") 
    else
       print("no hit wall") 
    end

end

MoveComponent.__init = __init
MoveComponent.__delete = __delete
MoveComponent.Update = Update
MoveComponent.OnMove = OnMove

return MoveComponent