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
    local ecs_entity_mgr = MapManager:GetInstance():GetEcsEntityMgr()
    if ecs_entity_arr.Length > 0 then
        for i = 0, ecs_entity_arr.Length - 1, 1 do
            local ecs_entity = ecs_entity_arr[i]
            local chara_ctrl = ecs_entity_mgr:GetCharacterController(ecs_entity)
            local anim_ctrl = ecs_entity_mgr:GetAnimation(ecs_entity)

            -- 计算移动目标位置
            local transform = ecs_entity_mgr:GetTransform(ecs_entity)
            local move_info = ecs_entity_mgr:GetActorMoveInfo(ecs_entity)
            local input_dir = Vector2(CS.ETCInput.GetAxis("Horizontal"), CS.ETCInput.GetAxis("Vertical"))
            local speed = move_info.speed
            local curPos = transform.localPosition
            if input_dir.sqrMagnitude > 0 and speed > 0 then
                local main_camera = CS.UnityEngine.GameObject.Find("Main Camera")
                assert(not IsNull(main_camera))
                local forward = main_camera.transform:TransformDirection(Vector3.forward)
                forward.y = 0
                local right = main_camera.transform:TransformDirection(Vector3.right)
                local targetDirection = Vector3.Add(Vector3.Mul(right, input_dir.x), Vector3.Mul(forward, input_dir.y))
                targetDirection.y = 0
                targetDirection = Vector3.Normalize(targetDirection)
                -- 延着方向前进0.10秒为目标坐标
                move_info.targetPos = Vector3.Add(curPos, Vector3.Mul(targetDirection, speed * 0.1))
            else 
                move_info.targetPos = curPos
            end
            -- print("move_info.targetPos, ", tostring(move_info.targetPos))
            ecs_entity_mgr:AddActorMoveInfo(ecs_entity, move_info)

            -- 动作
            if chara_ctrl.isGrounded and CS.ETCInput.GetAxis("Vertical") ~= 0 then
                anim_ctrl:CrossFade("Running (3)")
            end
            
            if chara_ctrl.isGrounded and CS.ETCInput.GetAxis("Vertical") == 0 and CS.ETCInput.GetAxis("Horizontal") == 0 then
                anim_ctrl:CrossFade("Idle 1")
            end
            
            if not chara_ctrl.isGrounded then
                anim_ctrl:CrossFade("Falling")
            end
            
            if chara_ctrl.isGrounded and CS.ETCInput.GetAxis("Vertical") == 0 and CS.ETCInput.GetAxis("Horizontal") > 0 then
                anim_ctrl:CrossFade("Running (1)")
            end
            
            if chara_ctrl.isGrounded and CS.ETCInput.GetAxis("Vertical") == 0 and CS.ETCInput.GetAxis("Horizontal") < 0 then
                anim_ctrl:CrossFade("Running (2)")
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