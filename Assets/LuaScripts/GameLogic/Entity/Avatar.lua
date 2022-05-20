--[[
-- added by hwp @ 2022-5-20
-- 玩家对象
--]]

local CharacterAnimation = require "GameLogic.Battle.CharacterAnimation"
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
    --创建主角
	local chara = GameObjectPool:GetInstance():GetGameObjectAsync("Models/1003/Prisoner.prefab", function(inst)
		if IsNull(inst) then
			error("Load chara res err!")
			do return end
		end
		
		local chara_root = CS.UnityEngine.GameObject.Find("CharacterRoot")
		if IsNull(chara_root) then
			error("chara_root null!")
			do return end
		end
		inst.transform:SetParent(chara_root.transform)
		inst.transform.localPosition = Vector3.New(-7.86, 50, 5.85)
		-- 启动角色控制
		self.charaAnim = CharacterAnimation.New()
		self.charaAnim:Start(inst)
	end)
end

Avatar.__init = __init
Avatar.__delete = __delete
Avatar.OnEnterScene = OnEnterScene

return Avatar