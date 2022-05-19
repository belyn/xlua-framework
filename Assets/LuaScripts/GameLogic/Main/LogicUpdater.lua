--[[
-- added by wsh @ 2017-01-09
-- 游戏逻辑Updater，游戏逻辑模块可能需要严格的驱动顺序
--]]

local LogicUpdater = BaseClass("LogicUpdater", UpdatableSingleton)
local traceback = debug.traceback

local function Update(self)
	local update_start_time = Time.realtimeSinceStartup
	
	local hallConnector = HallConnector:GetInstance()
	local status,err = pcall(hallConnector.Update, hallConnector)
	if not status then
		Logger.LogError("hallConnector update err : "..err.."\n"..traceback())
	end

	local mapManager = MapManager:GetInstance()
	local status,err = pcall(mapManager.Update, mapManager)
	if not status then
		Logger.LogError("mapManager update err : "..err.."\n"..traceback())
	end
	local update_diff_time = Time.realtimeSinceStartup - update_start_time
	if update_diff_time > 0.1 then
		Logger.LogError("LogicUpdater update costTime : " .. update_diff_time)
	end
end

local function LateUpdate(self)
end

local function FixedUpdate(self)
end

local function Dispose(self)
	MapManager():GetInstance().Dispose()
end

LogicUpdater.Update = Update
LogicUpdater.LateUpdate = LateUpdate
LogicUpdater.FixedUpdate = FixedUpdate
LogicUpdater.Dispose = Dispose

return LogicUpdater