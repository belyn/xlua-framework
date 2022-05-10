--[[
-- added by marvin @ 2022-5-9
-- 当前玩家数据
--]]

local UserData = BaseClass("UserData", Singleton)

local function __init(self)
	self.player = nil
end

local function GetPlayer(self)
	assert(self.player ~= nil)
	return self.player
end

local function Dispose(self)
	if self.player ~= nil then
		self.player:OnUninit()
		self.player = nil
	end
end

local function OnBeginLoadData(self, ...)
	assert(self.player == nil)
	self.player = Player.New()
	self.player:OnInit(...)
end

local function OnPlayerModuleData(self, ...)
	assert(self.player ~= nil)
	self.player:OnLoadModuleData(...)
end

local function OnPlayerReady(self)
	assert(self.player ~= nil)
	self.player:OnReady()
end


UserData.__init = __init
UserData.GetPlayer = GetPlayer
UserData.Dispose = Dispose
UserData.OnBeginLoadData = OnBeginLoadData
UserData.OnPlayerModuleData = OnPlayerModuleData
UserData.OnPlayerReady = OnPlayerReady

return UserData