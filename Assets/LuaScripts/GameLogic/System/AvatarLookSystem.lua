--[[
-- added by marvin @ 2022-05-27
-- 地图对象表现逻辑
--]]

local AvatarLookSystem = BaseClass("AvatarLookSystem", BaseMapSystem)
local base = BaseMapSystem

local function __init(self)
end

local function CreatePreDefineSystem(self)
    -- C#层预定义了很多，lua层使用时不能重复
    return CS.ECS.Systems.PreDefineSys114()
end

local OnSystemCreate = function(self)
    local ecs_entity_builder = self.ecs_system:GetQueryBuilder():WithAllActorLookInfo()
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
            local look_info = ecs_entity_mgr:GetActorLookInfo(ecs_entity)
            local anim_ctrl = ecs_entity_mgr:GetAnimation(ecs_entity)
            local avatar = map_mgr:FindVatar(tostring(base_info.actorId))
            assert(not IsNull(avatar))

            -- 切换动画
            local anim_name = avatar:GetAnimationNameByState(look_info.curState)
            if EAvatarLookStateMode.None ~= look_info.endMode then
                if EAvatarLookStateMode.PlayAnimationOnce == look_info.endMode then
                    local anim_state = anim_ctrl[anim_name]
                    if look_info.endTime == 0 then
                        look_info.endTime = 1
                        ecs_entity_mgr:AddActorLookInfo(look_info)
                    elseif anim_state ~= nil and anim_state.normalizedTime >= 1.0 then
                        avatar:PopLookState()
                    end
                elseif EAvatarLookStateMode.ByEndTime == look_info.endMode then
                    if Time.realtimeSinceStartup > look_info.endTime then
                        avatar:PopLookState()
                    end
                end
            end

            -- 播放动画
            look_info = ecs_entity_mgr:GetActorLookInfo(ecs_entity)
            anim_name = avatar:GetAnimationNameByState(look_info.curState)
            if not anim_ctrl:IsPlaying(anim_name) then
                anim_ctrl:Play(anim_name)
            end
        end
    end
    ecs_entity_arr:Dispose()
end

AvatarLookSystem.__init = __init
AvatarLookSystem.CreatePreDefineSystem = CreatePreDefineSystem 
AvatarLookSystem.OnSystemCreate = OnSystemCreate
AvatarLookSystem.OnSystemUpdate = OnSystemUpdate

return AvatarLookSystem