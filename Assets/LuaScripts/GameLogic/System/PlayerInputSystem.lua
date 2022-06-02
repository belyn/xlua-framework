--[[
-- added by marvin @ 2022-05-27
-- 主角行为操作逻辑
--]]

local PlayerInputSystem = BaseClass("PlayerInputSystem", BaseMapSystem)
local base = BaseMapSystem

local function __init(self)
end

local function CreatePreDefineSystem(self)
    -- C#层预定义了很多，lua层使用时不能重复
    return CS.ECS.Systems.PreDefineSys111()
end

local OnSystemCreate = function(self)
    local ecs_entity_builder = self.ecs_system:GetQueryBuilder():WithAllSyncActorPosInfo():WithAllActorMoveInfo()
    self.ecs_group = ecs_entity_builder:ToEntityQuery()
end

local OnSystemUpdate = function(self)
    local ecs_entity_arr = self.ecs_group:ToEntityArray(CS.Unity.Collections.Allocator.TempJob)
    local map_mgr = MapManager:GetInstance()
    local ecs_entity_mgr = map_mgr:GetEcsEntityMgr()
    if ecs_entity_arr.Length > 0 then
        for i = 0, ecs_entity_arr.Length - 1, 1 do
            local ecs_entity = ecs_entity_arr[i]
            local base_info = ecs_entity_mgr:GetActorBaseInfo(ecs_entity)
            local chara_ctrl = ecs_entity_mgr:GetCharacterController(ecs_entity)
            local anim_ctrl = ecs_entity_mgr:GetAnimation(ecs_entity)
            local avatar = map_mgr:FindVatar(tostring(base_info.actorId))
            assert(not IsNull(avatar))

            -- 计算移动目标位置
            local transform = ecs_entity_mgr:GetTransform(ecs_entity)
            local move_info = ecs_entity_mgr:GetActorMoveInfo(ecs_entity)
            local input_dir = Vector2(CS.ETCInput.GetAxis("Horizontal"), CS.ETCInput.GetAxis("Vertical"))
            local speed = move_info.speed
            local curPos = transform.localPosition
            move_info.targetPos = curPos
            ecs_entity_mgr:AddActorMoveInfo(ecs_entity, move_info)

            -- 动作
            if chara_ctrl.isGrounded and CS.ETCInput.GetAxis("Vertical") ~= 0 then
                avatar:ChangeLookState(EAvatarLookState.Running)
            elseif chara_ctrl.isGrounded and CS.ETCInput.GetAxis("Horizontal") ~= 0 then
                avatar:ChangeLookState(EAvatarLookState.Running)
            elseif chara_ctrl.isGrounded and CS.ETCInput.GetAxis("Vertical") == 0 and CS.ETCInput.GetAxis("Horizontal") == 0 then
                avatar:ChangeLookState(EAvatarLookState.Idle)
            elseif not chara_ctrl.isGrounded then
                avatar:ChangeLookState(EAvatarLookState.Falling)
            end
        end
    end
    ecs_entity_arr:Dispose()
end

PlayerInputSystem.__init = __init
PlayerInputSystem.CreatePreDefineSystem = CreatePreDefineSystem 
PlayerInputSystem.OnSystemCreate = OnSystemCreate
PlayerInputSystem.OnSystemUpdate = OnSystemUpdate

return PlayerInputSystem