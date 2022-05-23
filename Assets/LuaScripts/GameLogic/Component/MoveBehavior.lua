--[[
-- added by hwp @ 2022-5-20
-- 移动表现组件
--]]
local ComponentBase = require "GameLogic.Component.ComponentBase"

local MoveBehavior = BaseClass("MoveBehavior", ComponentBase)

local prefabPath = "Models/1003/Prisoner.prefab"

local function __init(self)
    -- 角色prefab
    self.chara_inst = nil
    -- 角色控制器
    self.chara_ctrl = nil
    -- 动画控制器
    self.anim_ctrl = nil
    self:OnCreate()
end

local function __delete(self)
	if self.chara_inst then--回收
		GameObjectPool:GetInstance():RecycleGameObject(prefabPath, self.chara_inst)
		self.chara_inst = nil
	end
    self.chara_ctrl = nil
    self.anim_ctrl = nil
end

local function Update(self)
    -- local moveDirection = Vector3.New(8, 8, 8);
    -- self.chara_ctrl:SimpleMove(moveDirection);
end

local function LateUpdate(self)
	if self.chara_ctrl.isGrounded and CS.ETCInput.GetAxis("Vertical") ~= 0 then
		self.anim_ctrl:CrossFade("Running (3)")
	end
	
	if self.chara_ctrl.isGrounded and CS.ETCInput.GetAxis("Vertical") == 0 and CS.ETCInput.GetAxis("Horizontal") == 0 then
		self.anim_ctrl:CrossFade("Idle 1")
	end
	
	if not self.chara_ctrl.isGrounded then
		self.anim_ctrl:CrossFade("Falling")
	end
	
	if self.chara_ctrl.isGrounded and CS.ETCInput.GetAxis("Vertical") == 0 and CS.ETCInput.GetAxis("Horizontal") > 0 then
		self.anim_ctrl:CrossFade("Running (1)")
	end
	
	if self.chara_ctrl.isGrounded and CS.ETCInput.GetAxis("Vertical") == 0 and CS.ETCInput.GetAxis("Horizontal") < 0 then
		self.anim_ctrl:CrossFade("Running (2)")
	end
end

local function OnCreate(self)
    --创建动画
	 GameObjectPool:GetInstance():GetGameObjectAsync(prefabPath, function(inst)
		if IsNull(inst) then
			error("Load chara res err!")
			do return end
		end
		
		local chara_object = CS.UnityEngine.GameObject.Find("CharacterRoot")
		if IsNull(chara_object) then
			error("chara_object null!")
			do return end
		end
		inst.transform:SetParent(chara_object.transform)
		inst.transform.localPosition = self.actor:GetPosition()
        self.chara_inst = inst
        self.chara_ctrl = inst:GetComponentInChildren(typeof(CS.UnityEngine.CharacterController))
        self.anim_ctrl = inst:GetComponentInChildren(typeof(CS.UnityEngine.Animation))

	end)

end

MoveBehavior.__init = __init
MoveBehavior.__delete = __delete
MoveBehavior.Update = Update
MoveBehavior.LateUpdate = LateUpdate
MoveBehavior.OnCreate = OnCreate

return MoveBehavior