--[[
-- added by hwp @ 2022-5-20
-- 玩家对象
--]]

local Actor = require "GameLogic.Entity.Actor"

local Avatar = BaseClass("Avatar", Actor)

local prefabPath = "Models/1003/Prisoner.prefab"

local function __init(self)
    self.actor_type = SceneProtocol_pb.Avatar
    self.ecs_entity = nil
    self.go_entity = nil
end

local function __delete(self)
    assert(not IsNull(self.ecs_entity))
    assert(not IsNull(self.go_entity))
    local ecs_entity_mgr = MapManager:GetInstance():GetEcsEntityMgr()
    ecs_entity_mgr:DestroyEntity(self.ecs_entity)
    self.ecs_entity = nil
    GameObjectPool:GetInstance():RecycleGameObject(prefabPath, self.go_entity)
end

local function OnEnterScene(self, msg_proto)
    local entityBaseData = msg_proto.entityBaseData
    self.actor_id = entityBaseData.actorId
    local curPos = entityBaseData.curPos
    self.position = Vector3.New(curPos.posX, curPos.posY, curPos.posZ)
    print("Avatar.OnEnterScene, ", self.actor_id, tostring(self.position))

    -- 1.创建prefab的GameObject 
	self.go_entity = GameObjectPool:GetInstance():TryGetFromCache(prefabPath)	
    assert(not IsNull(self.go_entity))
    local go_root = CS.UnityEngine.GameObject.Find("CharacterRoot")
    assert(not IsNull(go_root))
    self.go_entity.tag = "Player"
    self.go_entity.transform:SetParent(go_root.transform)
    self.go_entity.transform.localPosition = Vector3.New(8, 1, 0)
    self.go_entity:SetActive(true)

    -- 2.转换成ecs框架中的Entity
    local ecs_entity_mgr = MapManager:GetInstance():GetEcsEntityMgr()
    self.ecs_entity = ecs_entity_mgr:AddGameObjectEntity(self.go_entity)
    assert(not IsNull(self.ecs_entity))

    -- 3.设置Entity的Component，后续ecs系统就是根据这些Component来帅选Entity来实现业务逻辑
    local ecs_actor_base = CS.ECS.Components.ActorBaseInfo()
    ecs_actor_base.actorType = entityBaseData.entityType
    ecs_actor_base.actorId = entityBaseData.actorId
    ecs_actor_base.level = 1
    ecs_entity_mgr:AddActorBaseInfo(self.ecs_entity, ecs_actor_base)

    local ecs_move_info = CS.ECS.Components.ActorMoveInfo()
    ecs_move_info.state = 0
    ecs_move_info.speed = 10
    ecs_move_info.targetPos = self.go_entity.transform.localPosition
    ecs_entity_mgr:AddActorMoveInfo(self.ecs_entity, ecs_move_info)

    local ecs_sync_pos = CS.ECS.Components.SyncActorPosInfo()
    ecs_entity_mgr:AddSyncActorPosInfo(self.ecs_entity, ecs_sync_pos)
end

local function OnSyncPos(self, msg_proto)
    assert(not IsNull(self.ecs_entity))
    local ecs_entity_mgr = MapManager:GetInstance():GetEcsEntityMgr()
    local transform = ecs_entity_mgr:GetTransform(self.ecs_entity)
    local move_info = ecs_entity_mgr:GetActorMoveInfo(self.ecs_entity)
    transform.localPosition = Vector3(msg_proto.curPos.posX / GameConst.RealToLogic, msg_proto.curPos.posY / GameConst.RealToLogic, msg_proto.curPos.posZ / GameConst.RealToLogic)
    move_info.state = msg_proto.moveBehavior.state
    move_info.speed = msg_proto.moveBehavior.speed
    move_info.targetPos.x = msg_proto.moveBehavior.targetPos.posX / GameConst.RealToLogic
    move_info.targetPos.y = msg_proto.moveBehavior.targetPos.posY / GameConst.RealToLogic
    move_info.targetPos.z = msg_proto.moveBehavior.targetPos.posZ / GameConst.RealToLogic
    ecs_entity_mgr:AddActorMoveInfo(self.ecs_entity, move_info)
    -- TODO 改变EasyTouch控制器的移动速度
end

Avatar.__init = __init
Avatar.__delete = __delete
Avatar.OnEnterScene = OnEnterScene
Avatar.OnSyncPos = OnSyncPos

return Avatar