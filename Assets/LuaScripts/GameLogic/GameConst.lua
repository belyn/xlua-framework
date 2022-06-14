--[[
-- added by marvin @ 2022-05-27
-- 常量 
--]]

local GameConst = {
	RealToLogic = 100,
	AvatarSpeed = 10, --avatar速度
	FixPosDistance = 1, --纠正坐标的最短距离
	FixMoveVec = 1, --同步移动向量的最小偏移值
	Gravity = 9.81, --重力值
	Police = "Models/1002/Police.prefab",
	Prisoner = "Models/1003/Prisoner.prefab",
}

return ConstClass("GameConst", GameConst)