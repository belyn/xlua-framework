--[[
-- 临时Demo：战斗场景角色动画控制脚本
-- added by hwp @ 2022-5-20
-- 控制组件
--]]
local ComponentBase = require "GameLogic.Component.ComponentBase"

local AnimationComponent = BaseClass("AnimationComponent", ComponentBase)

local function __init(self)
    self.state = EActorLookState.Idle

	local ecs_entity_mgr = MapManager:GetInstance():GetEcsEntityMgr()
    self.chara_ctrl =  ecs_entity_mgr:GetCharacterController(self.actor.ecs_entity)
    assert(not IsNull(self.chara_ctrl))
    self.anim_ctrl = ecs_entity_mgr:GetAnimation(self.actor.ecs_entity)
    assert(not IsNull(self.anim_ctrl))
end

local function __delete(self)
    self.anim_ctrl = nil
end

local function LateUpdate(self)
    local state = self.state
    if not self.chara_ctrl.isGrounded and EActorLookState.Climbing ~= state then
        state = EActorLookState.Falling
    end
    local anim_name = self.actor:GetAnimationNameByState(state)
    if not self.anim_ctrl:IsPlaying(anim_name) then
        self.anim_ctrl:Play(anim_name)
    end
end

local function ChangeState(self, state)
    if self.state == state then
        return
    end
    self.state = state
end

local function GetCurState(self)
    return self.state
end

AnimationComponent.__init = __init
AnimationComponent.__delete = __delete
AnimationComponent.LateUpdate = LateUpdate
AnimationComponent.ChangeState = ChangeState
AnimationComponent.GetCurState = GetCurState

return AnimationComponent