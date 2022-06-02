--[[
-- added by marvin @ 2022-06-01
-- 角色表现状态枚举 
--]]

local EAvatarLookStateMode = {
	None = 0,
	PlayAnimationOnce = 1,
	ByEndTime = 2,
}

return ConstClass("EAvatarLookStateMode", EAvatarLookStateMode)