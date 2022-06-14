--[[
-- added by hwp @ 2022-5-20
-- 组件
--]]

local ComponentBase = BaseClass("ComponentBase")

local function __init(self, actor)
    self.actor = actor
end

local function __delete(self)
    self.actor = nil
end

local function Update(self)
end

local function LateUpdate(self)
end

ComponentBase.__init = __init
ComponentBase.__delete = __delete
ComponentBase.Update = Update
ComponentBase.LateUpdate = LateUpdate

return ComponentBase