--[[
-- added by hwp @ 2022-5-20
-- 移动表现组件
--]]

local ComponentBase = BaseClass("ComponentBase", Updatable)

local function __init(self, actor)
    self.actor = actor --地图对象
end

local function __delete(self)
    self.charaAnim = nil
end

ComponentBase.__init = __init
ComponentBase.__delete = __delete

return ComponentBase