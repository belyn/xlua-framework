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
    -- 表现栈
    self.look_stack = {}
end

local function __delete(self)
    assert(not IsNull(self.ecs_entity))
    assert(not IsNull(self.go_entity))
    local ecs_entity_mgr = MapManager:GetInstance():GetEcsEntityMgr()
    ecs_entity_mgr:DestroyEntity(self.ecs_entity)
    self.ecs_entity = nil
    GameObjectPool:GetInstance():RecycleGameObject(prefabPath, self.go_entity)
end

local function OnEnterScene(self, msg_proto, b_main_role)
    self.b_main_role = b_main_role
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
    self.go_entity.tag = "Untagged"
    -- 主角控制器标记就是Player
    if b_main_role then
        self.go_entity.tag = "Player"
    end
    self.go_entity.transform:SetParent(go_root.transform)
    self.go_entity.transform.localPosition = self.position
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
    ecs_move_info.speed = GameConst.AvatarSpeed
    ecs_move_info.targetPos = self.go_entity.transform.localPosition
    ecs_entity_mgr:AddActorMoveInfo(self.ecs_entity, ecs_move_info)
    
    local ecs_look_info = CS.ECS.Components.ActorLookInfo()
    ecs_look_info.curState = EAvatarLookState.Idle
    ecs_entity_mgr:AddActorLookInfo(self.ecs_entity, ecs_look_info)

    -- 当前玩家主角才需要同步位置信息给服务端
    if b_main_role then
        local ecs_sync_pos = CS.ECS.Components.SyncActorPosInfo()
        ecs_entity_mgr:AddSyncActorPosInfo(self.ecs_entity, ecs_sync_pos)
        -- 设置EasyTouch控制器的移动速度
        CS.ETCInput.SetTurnMoveSpeed("Joystick", GameConst.AvatarSpeed)
    end
end

local function OnSyncPos(self, msg_proto)
    assert(not IsNull(self.ecs_entity))
    local ecs_entity_mgr = MapManager:GetInstance():GetEcsEntityMgr()
    local move_info = ecs_entity_mgr:GetActorMoveInfo(self.ecs_entity)
    move_info.state = msg_proto.moveBehavior.state
    move_info.speed = msg_proto.moveBehavior.speed
    move_info.targetPos = Vector3.New(msg_proto.curPos.posX / GameConst.RealToLogic, msg_proto.curPos.posY / GameConst.RealToLogic, msg_proto.curPos.posZ / GameConst.RealToLogic)
    ecs_entity_mgr:AddActorMoveInfo(self.ecs_entity, move_info)
end

local function PushLookState(self, curState, startTime, endMode, endTime)
    table.insert(self.look_stack, {curState = curState, startTime = startTime, endMode = endMode, endTime = endTime})
end

local function PopLookState(self)
    local last_state = self.look_stack[#self.look_stack]
    local ecs_entity_mgr = MapManager:GetInstance():GetEcsEntityMgr()
    local look_info = ecs_entity_mgr:GetActorLookInfo(self.ecs_entity)
    if last_state ~= nil then
        self:ChangeLookState(last_state.curState)
    else 
        self:ChangeLookState(EAvatarLookState.Idle)
    end
end

local function CheckStateNeedStack(state)
    return false 
end

local function ChangeLookState(self, new_state)
    assert(new_state > 0)
    local ecs_entity_mgr = MapManager:GetInstance():GetEcsEntityMgr()
    local look_info = ecs_entity_mgr:GetActorLookInfo(self.ecs_entity)
    assert(look_info.curState > 0)
    local last_state = look_info.curState
    local last_start_time = look_info.startTime
    if look_info.curState ~= new_state and CheckStateNeedStack(look_info.curState) then
        self:PushLookState(look_info.curState, look_info.startTime, look_info.endMode, look_info.endTime)
    end
    look_info.curState = new_state
    look_info.startTime = Time.realtimeSinceStartup 
    look_info.endMode = EAvatarLookStateMode.None
    look_info.endTime = 0
    ecs_entity_mgr:AddActorLookInfo(self.ecs_entity, look_info)
    if last_state ~= look_info.curState then
        print("actorId:"..self.actor_id, "last_state", last_state, "new_state", look_info.curState, "last_start_time", last_start_time, "new_start_time", look_info.startTime)
    end
end

local function GetAnimationNameByState(self, state)
    if EAvatarLookState.Idle == state then
        return "Idle 1"
    elseif EAvatarLookState.Running == state then
        return "Running (1)"
    elseif EAvatarLookState.Falling == state then
        return "Falling"
    else
        assert(false, "unkown EAvatarLookState animation name:"..state)
    end
end

local function IsOnGroudState(self, state)
    return EAvatarLookState.Idle == state or EAvatarLookState.Running == state 
end

Avatar.__init = __init
Avatar.__delete = __delete
Avatar.OnEnterScene = OnEnterScene
Avatar.OnSyncPos = OnSyncPos
Avatar.PushLookState = PushLookState 
Avatar.PopLookState = PopLookState 
Avatar.ChangeLookState = ChangeLookState 
Avatar.GetAnimationNameByState = GetAnimationNameByState 
Avatar.IsOnGroudState = IsOnGroudState 

return Avatar