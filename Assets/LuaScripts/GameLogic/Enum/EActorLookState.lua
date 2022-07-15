--[[
-- added by marvin @ 2022-06-01
-- 角色表现状态枚举 
--]]

local EActorLookState = {
	Idle = 101,
	Running = 102,
	Falling = 103,
	Climbing = 104,
	ClimbingUpWall = 105,
}

return ConstClass("EActorLookState", EActorLookState)