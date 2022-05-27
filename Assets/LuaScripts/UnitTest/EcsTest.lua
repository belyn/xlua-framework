--[[
-- added by marvin @ 2022-05-21
-- Ecs单元测试
--]]

local OnSystemUpdate = function(self)
	local n = self.n
	if self.n % 1000 == 0 then
		print("+++++++++++++++MoveSystem++++++++++++++:" .. n)
	end
	self.n = self.n + 1
end
local OnSystemCreate = function(self)
	local n = self.n
	print("MoveSystem.OnSystemCreate" .. n)
end
local OnSystemDestroy = function(self)
	local n = self.n
	print("MoveSystem.OnSystemDestroy" .. n)
end
local OnSystemStartRunning = function(self)
	local n = self.n
	print("MoveSystem.OnSystemStartRunning" .. n)
end
local OnSystemStopRunning = function(self)
	local n = self.n
	print("MoveSystem.OnSystemStopRunning" .. n)
end

local MoveSystem = BaseClass("MoveSystem")
MoveSystem.__init = function(self, ecs_world)
	self.n = 1
	self.ecs_system = CS.ECS.Systems.PreDefineSys9991()
	assert(not IsNull(self.ecs_system))
	self.ecs_system.OnUpdateCall = Bind(self, OnSystemUpdate)
	self.ecs_system.OnCreateCall = Bind(self, OnSystemCreate)
	self.ecs_system.OnDestroyCall = Bind(self, OnSystemDestroy)
	self.ecs_system.OnStartRunningCall = Bind(self, OnSystemStartRunning)
	self.ecs_system.OnStopRunningCall = Bind(self, OnSystemStopRunning)
	ecs_world:AddSystem(self.ecs_system)
	print("MoveSystem __init suc")
end


local OnSystemUpdate2 = function(self)
	local n = self.n
	if self.n % 1000 == 0 then
		print("+++++++++++++++MoveSystem2++++++++++++++:" .. n)
	end
	self.n = self.n + 1
end
local OnSystemCreate2 = function(self)
	local n = self.n
	print("MoveSystem2.OnSystemCreate" .. n)
end
local OnSystemDestroy2 = function(self)
	local n = self.n
	print("MoveSystem2.OnSystemDestroy" .. n)
end
local OnSystemStartRunning2 = function(self)
	local n = self.n
	print("MoveSystem2.OnSystemStartRunning" .. n)
end
local OnSystemStopRunning2 = function(self)
	local n = self.n
	print("MoveSystem2.OnSystemStopRunning" .. n)
end

local MoveSystem2 = BaseClass("MoveSystem2")
MoveSystem2.__init = function(self, ecs_world)
	self.n = 1
	self.ecs_system = CS.ECS.Systems.PreDefineSys9992()
	assert(not IsNull(self.ecs_system))
	self.ecs_system.OnUpdateCall = Bind(self, OnSystemUpdate2)
	self.ecs_system.OnCreateCall = Bind(self, OnSystemCreate2)
	self.ecs_system.OnDestroyCall = Bind(self, OnSystemDestroy2)
	self.ecs_system.OnStartRunningCall = Bind(self, OnSystemStartRunning2)
	self.ecs_system.OnStopRunningCall = Bind(self, OnSystemStopRunning2)
	ecs_world:AddSystem(self.ecs_system)
	print("MoveSystem2 __init suc")
end

local self = {}
local function Run()
	-- print("init ecs world begin ---------------------------------")
	-- self.ecs_world = CS.Unity.Entities.World.DefaultGameObjectInjectionWorld
	-- -- self.ecs_world = CS.Unity.Entities.World("marvin world")
	-- assert(not IsNull(self.ecs_world))
	-- self.ecs_entity_mgr = self.ecs_world.EntityManager
	-- assert(not IsNull(self.ecs_entity_mgr))
	-- assert(self.ecs_world.IsCreated)
	-- assert(type(self.ecs_entity_mgr.CreateEntity) == "function")
	-- self.ecs_entity_1 = self.ecs_entity_mgr:CreateEntity()
	-- assert(not IsNull(self.ecs_entity_1))

	-- local move_data = CS.ECS.Components.PreDefineComponent1001()
	-- local ret = self.ecs_entity_mgr:AddPreDefineComponent1001(self.ecs_entity_1, move_data)
	-- assert(ret)
	-- local tag1 = CS.ECS.EntityTags.PreDefineTag1001()
	-- assert(self.ecs_entity_mgr:AddPreDefineTag1001(self.ecs_entity_1, tag1))

	-- self.ecs_entity_2 = self.ecs_entity_mgr:CreateEntity()
	-- assert(not IsNull(self.ecs_entity_2))
	-- assert(self.ecs_entity_mgr:AddPreDefineTag1001(self.ecs_entity_2, tag1))

	-- local move_system = MoveSystem.New(self.ecs_world)
	-- assert(not IsNull(move_system))
	-- local move_system2 = MoveSystem2.New(self.ecs_world)
	-- assert(not IsNull(move_system2))
end

return {
	Run = Run,
	ddddd= self,
}