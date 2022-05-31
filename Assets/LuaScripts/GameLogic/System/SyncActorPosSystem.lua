--[[
-- added by marvin @ 2022-05-27
-- 同步坐标位置服务器逻辑
--]]

local SyncActorPosSystem = BaseClass("SyncActorPosSystem", BaseMapSystem)
local base = BaseMapSystem

local function __init(self)
end

local function CreatePreDefineSystem(self)
    -- C#层预定义了很多，lua层使用时不能重复
    return CS.ECS.Systems.PreDefineSys113()
end

local OnSystemCreate = function(self)
    assert(not IsNull(self.ecs_system))
    local ecs_entity_builder = self.ecs_system:GetQueryBuilder():WithAllSyncActorPosInfo()
    self.ecs_group = ecs_entity_builder:ToEntityQuery()
    self.last_sync_time = 0
end

local OnSystemUpdate = function(self)
    if Time.realtimeSinceStartup - self.last_sync_time < 0.05 then
        return
    end 
    local ecs_entity_arr = self.ecs_group:ToEntityArray(CS.Unity.Collections.Allocator.TempJob)
    local ecs_entity_mgr = MapManager:GetInstance():GetEcsEntityMgr()
    if ecs_entity_arr.Length > 0 then
        for i = 0, ecs_entity_arr.Length - 1, 1 do
            local ecs_entity = ecs_entity_arr[i]
            -- 同步坐标给服务器, targetPos是由PlayerInputSystem计算
            local transform = ecs_entity_mgr:GetTransform(ecs_entity)
            local move_info = ecs_entity_mgr:GetActorMoveInfo(ecs_entity)
            local sync_pos_info = ecs_entity_mgr:GetSyncActorPosInfo(ecs_entity)

            local curPos = transform.localPosition
            local distance = Vector3.Distance(move_info.targetPos, transform.localPosition)
            local distance_with_last = Vector3.Distance(sync_pos_info.lastSyncPos, transform.localPosition)
            if distance > GameConst.SyncPosDistance or distance_with_last > GameConst.SyncPosDistance then
                print("curPos:", tostring(curPos), "targetPos:", tostring(move_info.targetPos), "lastSyncPos:", tostring(sync_pos_info.lastSyncPos))
                sync_pos_info.lastSyncPos = transform.localPosition
                ecs_entity_mgr:AddSyncActorPosInfo(ecs_entity, sync_pos_info)
                self.last_sync_time = Time.realtimeSinceStartup

                local base_info = ecs_entity_mgr:GetActorBaseInfo(ecs_entity)
                local msg = CustomMsgIDMap.NewC2SProto(CSCommon_pb.Scene, SceneProtocol_pb.ReqMove)
                msg.actorId = tostring(base_info.actorId)
                msg.curPos.posX = transform.localPosition.x * GameConst.RealToLogic
                msg.curPos.posY = transform.localPosition.y * GameConst.RealToLogic
                msg.curPos.posZ = transform.localPosition.z * GameConst.RealToLogic
                msg.moveBehavior.state = move_info.state
                msg.moveBehavior.speed = move_info.speed
                msg.moveBehavior.targetPos.posX = move_info.targetPos.x * GameConst.RealToLogic
                msg.moveBehavior.targetPos.posY = move_info.targetPos.y * GameConst.RealToLogic
                msg.moveBehavior.targetPos.posZ = move_info.targetPos.z * GameConst.RealToLogic
                HallConnector:GetInstance():SendMapMessage(CSCommon_pb.Scene, SceneProtocol_pb.ReqMove, msg)
            end
        end
    end
    ecs_entity_arr:Dispose()
end

SyncActorPosSystem.__init = __init
SyncActorPosSystem.CreatePreDefineSystem = CreatePreDefineSystem 
SyncActorPosSystem.OnSystemCreate = OnSystemCreate
SyncActorPosSystem.OnSystemUpdate = OnSystemUpdate

return SyncActorPosSystem