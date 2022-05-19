--[[
-- added by HWP @ 2022-05-19
-- 地图管理
--]]

local MapManager = BaseClass("MapManager", Singleton)
local traceback = debug.traceback

local function __init(self)
	self.gameobject_list = {} --地图中对象列表
end

local function __delete(self)
end

local function Update(self)
end

--开启战斗场景
local function OpenBattleScene(self)
end

--关闭战斗场景
local function CloseBattleScene(self)
end

local function Dispose(self)
end

MapManager.__init = __init
MapManager.__delete = __delete
MapManager.Update = Update
MapManager.OpenBattleScene = OpenBattleScene
MapManager.CloseBattleScene = CloseBattleScene
MapManager.Dispose = Dispose

return MapManager