--[[
-- added by marvin @ 2022-05-27
-- 常量 
--]]

local GameConst = {
	RealToLogic = 100,
	AvatarSpeed = 10, --avatar速度
	FixPosDistance = 1, --纠正坐标的最短距离
	FixMoveVec = 1, --同步移动向量的最小偏移值
	FixMoveVecTime = 3, --持续移动时，固定时长进行强制同步，防止起始时微小的偏移量变化，在长时间后累积为巨大的偏移量
	SyncPosTime = 1,--持续移动时，因为服务端不进行位置计算，需要客户端定时上报位置
	Gravity = 9.81, --重力值
	ClimbSpeed = 1, --爬墙速度
	ClimbUpWallSpeed = 5, --爬到顶向上跳跃速度
	ClimbUpWallTime = 0.2, --爬到顶向上跳跃时间
	ClimbEnterDistance = 0.6,
	ClimbExitDistance = 0.6,
	Police = "Models/1002/Police.prefab",
	Prisoner = "Models/1003/Prisoner.prefab",
}

return ConstClass("GameConst", GameConst)