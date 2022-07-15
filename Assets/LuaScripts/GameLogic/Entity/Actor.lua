--[[
-- added by hwp @ 2022-5-20
-- 地图对象基类
--]]

local AnimationComponent = require "GameLogic.Component.AnimationComponent"
local MoveComponent = require "GameLogic.Component.MoveComponent"

local Actor = BaseClass("Actor")

local function __init(self, msg_proto)
    self.actor_type = SceneProtocol_pb.None

    local entityBaseData = msg_proto.entityBaseData
    self.actor_id = entityBaseData.actorId
    local position = Vector3.New(entityBaseData.curPos.x, entityBaseData.curPos.y, entityBaseData.curPos.z)
    position = position / GameConst.RealToLogic
    print("Actor.__init, ", self.actor_id, tostring(position))
    -- 1.创建prefab的GameObject 
    self.go_entity = GameObjectPool:GetInstance():TryGetFromCache(GameConst.Prisoner)	
    assert(not IsNull(self.go_entity))
    local go_root = CS.UnityEngine.GameObject.Find("CharacterRoot")
    assert(not IsNull(go_root))
    self.go_entity.transform:SetParent(go_root.transform)
    self.go_entity.transform.localPosition = position
    self.go_entity:SetActive(true)
    -- 2.转换成ecs框架中的Entity
    local ecs_entity_mgr = MapManager:GetInstance():GetEcsEntityMgr()
    self.ecs_entity = ecs_entity_mgr:AddGameObjectEntity(self.go_entity)
    -- 3.设置Entity的Component，后续ecs系统就是根据这些Component来帅选Entity来实现业务逻辑
    local ecs_actor_base = CS.ECS.Components.ActorBaseInfo()
    ecs_actor_base.actorType = entityBaseData.entityType
    ecs_actor_base.actorId = entityBaseData.actorId
    ecs_entity_mgr:AddActorBaseInfo(self.ecs_entity, ecs_actor_base)
    --组件
    self.animationComponent = nil
    self.moveComponent = nil
end

local function __delete(self)
    --实体删除
    assert(not IsNull(self.ecs_entity))
    assert(not IsNull(self.go_entity))
    local ecs_entity_mgr = MapManager:GetInstance():GetEcsEntityMgr()
    ecs_entity_mgr:DestroyEntity(self.ecs_entity)
    self.ecs_entity = nil
    GameObjectPool:GetInstance():RecycleGameObject(GameConst.Prisoner, self.go_entity)

    self.animationComponent = nil
    self.moveComponent = nil
end

local function EnterScene(self, ...)
    self:OnEnterScene(...)
    assert(not IsNull(self.ecs_entity))
    self.animationComponent = AnimationComponent.New(self)
    self.moveComponent = MoveComponent.New(self)
end

local function OnEnterScene(self, ...)
end

local function Update(self)
    self:OnUpdate()
    self.moveComponent:Update()
end

local function OnUpdate(self)
end

local function LateUpdate(self)
    self:OnLateUpdate()
    self.animationComponent:LateUpdate()
end

local function OnLateUpdate(self)
end

local function GetActorType(self)
    return self.actor_type
end

local function GetActorId(self)
    return self.actor_id
end

local function ChangeLookState(self, state)
    self.animationComponent:ChangeState(state)
end

local function GetCurLookState(self)
    return self.animationComponent:GetCurState()
end

local function GetAnimationNameByState(self, state)
    return self:OnGetAnimationNameByState(state)
end
local function OnGetAnimationNameByState(self, state)
    assert(false, "unkown EActorLookState animation name:"..state)
end

local function OnSyncMove(self, msg_proto)
    self.moveComponent:OnMove(msg_proto)
end

Actor.__init = __init
Actor.__delete = __delete
Actor.EnterScene = EnterScene
Actor.OnEnterScene = OnEnterScene
Actor.Update = Update
Actor.OnUpdate = OnUpdate
Actor.LateUpdate = LateUpdate
Actor.OnLateUpdate = OnLateUpdate
Actor.GetActorType = GetActorType
Actor.GetActorId = GetActorId
Actor.ChangeLookState = ChangeLookState
Actor.GetCurLookState = GetCurLookState 
Actor.GetAnimationNameByState = GetAnimationNameByState
Actor.OnGetAnimationNameByState = OnGetAnimationNameByState
Actor.OnSyncMove = OnSyncMove

return Actor