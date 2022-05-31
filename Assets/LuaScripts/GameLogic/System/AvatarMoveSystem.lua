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
    local ecs_entity_builder = self.ecs_system:GetQueryBuilder():WithAllActorMoveInfo()
    self.ecs_group = ecs_entity_builder:ToEntityQuery()
end

local OnSystemUpdate = function(self)
    
    local ecs_entity_arr = self.ecs_group:ToEntityArray(CS.Unity.Collections.Allocator.TempJob)
    local ecs_entity_mgr = MapManager:GetInstance():GetEcsEntityMgr()
    if ecs_entity_arr.Length > 0 then
        for i = 0, ecs_entity_arr.Length - 1, 1 do
            local ecs_entity = ecs_entity_arr[i]
            local chara_ctrl = ecs_entity_mgr:GetCharacterController(ecs_entity)
            local anim_ctrl = ecs_entity_mgr:GetAnimation(ecs_entity)
            local transform = ecs_entity_mgr:GetTransform(ecs_entity)
            local move_info = ecs_entity_mgr:GetActorMoveInfo(ecs_entity)

            if move_info.speed > 0 then
                local start_pos = transform.localPosition
                local move_dir = Vector3.Sub(move_info.targetPos, start_pos)
                local group_dir = Vector3.Clone(move_dir)
                local move_distance = Vector3.Magnitude(group_dir)
                local bNeedMove = move_distance > 0.01 and true or false
                
                if bNeedMove then
                    group_dir = Vector3.Normalize(group_dir)
                    -- TODO计算动作
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