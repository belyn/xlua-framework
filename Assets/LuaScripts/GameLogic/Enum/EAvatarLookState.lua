--[[
-- added by marvin @ 2022-06-01
-- 角色表现状态枚举 
--]]

local EAvatarLookState = {
	Idle = 101,
	Running = 102,
	Falling = 103,
}

return ConstClass("EAvatarLookState", EAvatarLookState)