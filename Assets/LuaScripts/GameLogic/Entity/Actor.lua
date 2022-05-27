--[[
-- added by hwp @ 2022-5-20
-- 地图对象基类
--]]

local Actor = BaseClass("Actor")

local function __init(self)
    self.actor_type = SceneProtocol_pb.None
    self.actor_id = 0
    self.position = Vector3.zero
end

local function __delete(self)
end

local function Update(self)
end

local function GetActorType(self)
    return self.actor_type
end

local function GetActorId(self)
    return self.actor_id
end

local function GetPosition(self)
    return self.position
end

Actor.__init = __init
Actor.__delete = __delete
Actor.Update = Update
Actor.GetActorType = GetActorType
Actor.GetActorId = GetActorId
Actor.GetPosition = GetPosition

return Actor