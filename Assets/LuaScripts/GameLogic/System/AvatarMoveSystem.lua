--[[
-- added by marvin @ 2022-05-27
-- 地图对象移动业务逻辑
--]]

local AvatarMoveSystem = BaseClass("AvatarMoveSystem", BaseMapSystem)
local base = BaseMapSystem

local function __init(self)
end

local function CreatePreDefineSystem(self)
    -- C#层预定义了很多，lua层使用时不能重复
    return CS.ECS.Systems.PreDefineSys112()
end

local OnSystemCreate = function(self)
    local ecs_entity_builder = self.ecs_system:GetQueryBuilder():WithAllActorMoveInfo():WithNoneSyncActorPosInfo()
    self.ecs_group = ecs_entity_builder:ToEntityQuery()
end

-- 通过射线检测主角是否落在地面或者物体上
local function IsGrounded(pos) 
    return CS.UnityEngine.Physics.Raycast(pos, Vector3.New(0, -1.0, 0), 3.0)
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
            local transform = ecs_entity_mgr:GetTransform(ecs_entity)
            local move_info = ecs_entity_mgr:GetActorMoveInfo(ecs_entity)
            local look_info = ecs_entity_mgr:GetActorLookInfo(ecs_entity)
            local avatar = map_mgr:FindVatar(tostring(base_info.actorId))
            assert(not IsNull(avatar))

            if move_info.speed > 0 then
                local start_pos = transform.localPosition
                local move_dir = Vector3.Sub(move_info.targetPos, start_pos)
                local group_dir = Vector3.Clone(move_dir)
                local move_distance = Vector3.Magnitude(group_dir)
                local bNeedMove = move_distance > 0.01 and true or false

                local new_look_state = EAvatarLookState.Idle
                local bIsOnGroud = avatar:IsOnGroudState(look_info.curState)
                if bIsOnGroud and bNeedMove then
                    new_look_state = EAvatarLookState.Running
                end
                
                if bNeedMove then
                    group_dir = Vector3.Normalize(group_dir)
                    local dt = Time.deltaTime
                    local new_pos = Vector3.Clone(move_info.targetPos)
                    if move_distance >= move_info.speed * dt then
                        new_pos = Vector3.Add(start_pos, Vector3.Mul(group_dir, move_info.speed * dt))
                    end
                    -- 设置坐标
                    local chara_ctrl_pos = chara_ctrl.transform.position
                    if Vector3.Distance(chara_ctrl_pos, start_pos) > 0.01 then
                        chara_ctrl_pos = Vector3.Clone(start_pos)
                        chara_ctrl.transform.position = chara_ctrl_pos
                    end
                    local delta_pos = Vector3.Sub(new_pos, chara_ctrl_pos)
                    chara_ctrl:Move(delta_pos)

                    -- 改变朝向
                    local target_dir = Vector3.Clone(group_dir)
                    local look_dir = target_dir.normalized
                    local free_rotation = CS.UnityEngine.Quaternion.LookRotation(look_dir, transform.up)
                    local diff_rotation = free_rotation.eulerAngles.y - transform.eulerAngles.y
                    local eulerY = transform.eulerAngles.y
                    if diff_rotation < 0 or diff_rotation > 0 then
                        eulerY = free_rotation.eulerAngles.y
                    end
                    local euler = Vector3.New(0, eulerY, 0)
                    transform.rotation = CS.UnityEngine.Quaternion.Slerp(transform.rotation, CS.UnityEngine.Quaternion.Euler(euler.x, euler.y, euler.z), dt * 50)
                end

                if not IsGrounded(transform.localPosition) then
                    new_look_state = EAvatarLookState.Falling
                end
                if new_look_state ~= look_info.curState then
                    avatar:ChangeLookState(new_look_state)            
                end
            end
        end
    end
    ecs_entity_arr:Dispose()
end

AvatarMoveSystem.__init = __init
AvatarMoveSystem.CreatePreDefineSystem = CreatePreDefineSystem 
AvatarMoveSystem.OnSystemCreate = OnSystemCreate
AvatarMoveSystem.OnSystemUpdate = OnSystemUpdate

return AvatarMoveSystem