--[[
-- added by hwp @ 2022-5-20
-- 玩家对象
--]]



local Actor = require "GameLogic.Entity.Actor"

local ContorlComponent = require "GameLogic.Component.ContorlComponent"

local Avatar = BaseClass("Avatar", Actor)


local function __init(self)
    self.actor_type = SceneProtocol_pb.Avatar
    --属性字段
    self.b_main_role = false
    --组件
    self.contorlComponent = nil
end

local function __delete(self)
    --组件删除
    self.contorlComponent = nil
end

local function OnEnterScene(self, b_main_role)
    self.b_main_role = b_main_role
    self.go_entity.tag = (b_main_role and "Player") or "Untagged" -- 主角控制器标记就是Player
    --设置控制器
    if b_main_role then
        self.contorlComponent = ContorlComponent.New(self)
    end
end

local function OnLateUpdate(self)
    if self.contorlComponent then
        self.contorlComponent:LateUpdate()
    end
end

local function OnGetAnimationNameByState(self, state)
    if EActorLookState.Idle == state then
        return "Idle 1"
    elseif EActorLookState.Running == state then
        return "Running (1)"
    elseif EActorLookState.Falling == state then
        return "Falling"
    elseif EActorLookState.Climbing == state then
        return "Climbing"
    elseif EActorLookState.ClimbingUpWall == state then
        return "ClimbingUpWall"
    end
end


Avatar.__init = __init
Avatar.__delete = __delete
Avatar.OnEnterScene = OnEnterScene
Avatar.OnLateUpdate = OnLateUpdate
Avatar.OnGetAnimationNameByState = OnGetAnimationNameByState

return Avatar