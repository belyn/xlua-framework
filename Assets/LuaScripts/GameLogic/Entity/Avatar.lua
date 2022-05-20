--[[
-- added by hwp @ 2022-5-20
-- 玩家对象
--]]

local Actor = require "GameLogic.Entity.Actor"

local Avatar = BaseClass("Avatar", Actor)

local function __init(self)
    self.actor_type = SceneProtocol_pb.ActorType_Avatar
end

local function __delete(self)
end

local function OnEnterScene(self, msg_proto)
    local entityBaseData = msg_proto.entityBaseData
    self.actor_id = entityBaseData.actorId
    local curPos = entityBaseData.curPos
    self.position = Vector3.New(curPos.posX, curPos.posY, curPos.posZ)
end

Avatar.__init = __init
Avatar.__delete = __delete
Avatar.OnEnterScene = OnEnterScene

return Avatar