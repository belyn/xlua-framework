--[[
-- added by marvin @ 2022-05-27
-- 业务逻辑系统基类, 子类必须实现CreatePreDefineSystem 
-- C#层预定义了一些系统, 每个子类要确保不能重复使用这些预定义
--]]

local BaseMapSystem = BaseClass("BaseMapSystem")

local OnSystemUpdate = function(self)
end
local OnSystemCreate = function(self)
end
local OnSystemDestroy = function(self)
end
local OnSystemStartRunning = function(self)
end
local OnSystemStopRunning = function(self)
end

local function __init(self, ecs_world)
	assert(not IsNull(ecs_world))
    self.sysname = nil
	self.ecs_system = self:CreatePreDefineSystem(ecs_world)
	assert(not IsNull(self.ecs_system))
	self.sysname = self.ecs_system:GetType().FullName
    assert(type(self.sysname) == "string")
	self.ecs_system.OnUpdateCall = Bind(self, self.OnSystemUpdate)
	self.ecs_system.OnCreateCall = Bind(self, self.OnSystemCreate)
	self.ecs_system.OnDestroyCall = Bind(self, self.OnSystemDestroy)
	self.ecs_system.OnStartRunningCall = Bind(self, self.OnSystemStartRunning)
	self.ecs_system.OnStopRunningCall = Bind(self, self.OnSystemStopRunning)
	ecs_world:AddSystem(self.ecs_system)
	print(self.sysname.." __init suc")
end

local function CreatePreDefineSystem(self, ecs_world)
    -- 由子类实现
    return nil
end

BaseMapSystem.__init = __init
BaseMapSystem.CreatePreDefineSystem = CreatePreDefineSystem
BaseMapSystem.OnSystemUpdate = OnSystemUpdate
BaseMapSystem.OnSystemCreate = OnSystemCreate
BaseMapSystem.OnSystemDestroy = OnSystemDestroy
BaseMapSystem.OnSystemStartRunning = OnSystemStartRunning
BaseMapSystem.OnSystemStopRunning = OnSystemStopRunning

return BaseMapSystem