--[[
-- added by HWP @ 2022-05-19
-- 地图管理
--]]

local MapState = {--管理器状态
	None = 0,
	CreateScene = 1,
	SceneReady = 2,
	MainRoleReady = 3,
	Playing = 4,
}

local Avatar = require "GameLogic.Entity.Avatar"

local MapManager = BaseClass("MapManager", Singleton)
local traceback = debug.traceback

local function __init(self)
	self:ResetData()
end

local function __delete(self)
end

local function Update(self)
	if self.state == MapState.None then
		self:ProcessNone()
	elseif self.state == MapState.CreateScene then
		self:ProcessCreateScene()
	elseif self.state == MapState.SceneReady then
		self:ProcessSceneReady()
	elseif self.state == MapState.MainRoleReady then
		self:ProcessMainRoleReady()
	elseif self.state == MapState.Playing then
		self:ProcessPlaying()
	end
end

local function Dispose(self)
	self:ResetData()
end

local function ResetData(self)
	self.state = MapState.None
	self.main_rold_data = nil --缓存主角进入场景的数据，场景没有准备好时接受到的主角数据缓存在此
	self.scene_event_datas = {} --缓存场景事件数据，场景没有准备好时接受到的场景数据缓存在此
	self.ontology_avatar = nil --本体角色Avatar
	self.actor_list = {} --地图中对象列表
end

--none状态处理逻辑
local function ProcessNone(self)
end

--CreateScene状态处理逻辑
local function ProcessCreateScene(self)
end

--SceneReady状态处理逻辑
local function ProcessSceneReady(self)
end

--MainRoleReady状态处理逻辑
local function ProcessMainRoleReady(self)
	self.state = MapState.Playing
	--创建Avatar
	self.ontology_avatar = self:CreateVatar(self.main_rold_data)
	self.main_rold_data = nil
end

--Playing状态处理逻辑
local function ProcessPlaying(self)
end

--创建战斗场景
local function CreateBattleScene(self)
	assert(self.state == MapState.None, 'OpenBattleScene error state ' .. self.state)
	self.state = MapState.CreateScene
end

--开启战斗场景
local function OpenBattleScene(self)
	assert(self.state == MapState.CreateScene, 'OpenBattleScene error state ' .. self.state)
	self.state = MapState.SceneReady
	if self.main_rold_data then
		self.state = MapState.MainRoleReady
	end
end

--主角进入场景
local function MainRoleEnterScene(self, msg_proto)
	self.main_rold_data = msg_proto
	if self.state == MapState.SceneReady then
		self.state = MapState.MainRoleReady
	end
end

--接收场景事件
local function AcceptSceneEventData(self, msg_proto)
	table.insert(self.scene_event_datas, msg_proto)
end

--关闭战斗场景
local function CloseBattleScene(self)
	self:ResetData()
end

local function CreateVatar(self, msg_proto)
	local avatar = Avatar.New()
	avatar:OnEnterScene(msg_proto)
	self.actor_list[avatar:GetActorId()] = avatar
	return avatar
end

MapManager.__init = __init
MapManager.__delete = __delete
MapManager.Update = Update
MapManager.Dispose = Dispose
MapManager.ResetData = ResetData
MapManager.ProcessNone = ProcessNone
MapManager.ProcessCreateScene = ProcessCreateScene
MapManager.ProcessSceneReady = ProcessSceneReady
MapManager.ProcessMainRoleReady = ProcessMainRoleReady
MapManager.ProcessPlaying = ProcessPlaying
MapManager.CreateBattleScene = CreateBattleScene
MapManager.OpenBattleScene = OpenBattleScene
MapManager.MainRoleEnterScene = MainRoleEnterScene
MapManager.AcceptSceneEventData = AcceptSceneEventData
MapManager.CloseBattleScene = CloseBattleScene
MapManager.CreateVatar = CreateVatar

return MapManager