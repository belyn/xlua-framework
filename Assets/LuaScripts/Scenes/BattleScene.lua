--[[
-- added by wsh @ 2017-11-19
-- 战斗场景
-- TODO：这里只是做一个战斗场景展示Demo，大部分代码以后需要挪除
--]]

local BattleScene = BaseClass("BattleScene", BaseScene)
local base = BaseScene

--角色资源路径
local police_res_path = "Models/1002/Police.prefab"
local prisoner_res_path = "Models/1003/Prisoner.prefab"

-- 创建：准备预加载资源
local function OnCreate(self)
	base.OnCreate(self)
	-- 预加载资源
	self:AddPreloadResource(police_res_path, typeof(CS.UnityEngine.GameObject), 5)
	self:AddPreloadResource(prisoner_res_path, typeof(CS.UnityEngine.GameObject), 10)
	self:AddPreloadResource(UIConfig[UIWindowNames.UIBattleMain].PrefabPath, typeof(CS.UnityEngine.GameObject), 1)
end

-- 准备工作
local function OnComplete(self)
	base.OnComplete(self)
	UIManager:GetInstance():OpenWindow(UIWindowNames.UIBattleMain)
	MapManager:GetInstance():OpenBattleScene()
end

-- 离开场景
local function OnLeave(self)
	UIManager:GetInstance():CloseWindow(UIWindowNames.UIBattleMain)
	MapManager:GetInstance():CloseBattleScene()
	base.OnLeave(self)
end

BattleScene.OnCreate = OnCreate
BattleScene.OnComplete = OnComplete
BattleScene.OnLeave = OnLeave

return BattleScene;