--[[
-- added by wsh @ 2017-12-01
-- UILogin模型层
-- 注意：
-- 1、成员变量预先在OnCreate、OnEnable函数声明，提高代码可读性
-- 2、OnCreate内放窗口生命周期内保持的成员变量，窗口销毁时才会清理
-- 3、OnEnable内放窗口打开时才需要的成员变量，窗口关闭后及时清理
-- 4、OnEnable函数每次在窗口打开时调用，可传递参数用来初始化Model
--]]

local UILoginModel = BaseClass("UILoginModel", UIBaseModel)
local base = UIBaseModel

-- 创建
local function OnCreate(self)
	base.OnCreate(self)
	-- 窗口生命周期内保持的成员变量放这
end

-- 打开
local function OnEnable(self)
	base.OnEnable(self)
	-- 窗口关闭时可以清理的成员变量放这
	-- 账号
	self.account = nil
	-- 密码
	self.password = nil
	-- 客户端app版本号
	self.client_app_ver = nil
	-- 客户端资源版本号
	self.client_res_ver = nil
	-- 区域名
	self.area_name = nil
	-- 服务器名
	self.server_name = nil
	
	self:OnRefresh()
end

local function SetServerInfo(self, select_svr_id)
	local server_data = ServerData:GetInstance()
	local select_svr = server_data.servers[select_svr_id]
	if select_svr ~= nil then
		self.area_name = LangUtil.GetServerAreaName(select_svr.area_id)
		self.server_name = LangUtil.GetServerName(select_svr_id)
	end
end

-- 刷新全部数据
local function OnRefresh(self)
	local client_data = ClientData:GetInstance()
	self.account = client_data.account
	self.password = client_data.password
	self.client_app_ver = client_data.app_version
	self.client_res_ver = client_data.res_version
	SetServerInfo(self, client_data.login_server_id)
end

local function OnSelectedSvrChg(self, id)
	SetServerInfo(self, id)
	self:UIBroadcast(UIMessageNames.UILOGIN_ON_SELECTED_SVR_CHG)
end

-- 协议 begin ---------------------------------------------------
local function OnProtoG2CSyncKey(self, real_msg_id, msg_proto)
	print("OnProtoG2CLoginTo", real_msg_id, msg_proto)
	HallConnector:GetInstance():SetRndKey(msg_proto.nRndKey)
end

local function OnProtoG2CLoginTo(self, real_msg_id, msg_proto)
	print("OnProtoG2CLoginTo", real_msg_id, msg_proto)
end

local function OnProtoLoginError(self, real_msg_id, msg_proto)
	print("OnProtoLoginError", real_msg_id, msg_proto)
	if GateProtocol_pb.EGateErrorCode_None ~= msg_proto.errorCode then
		-- TODO 错误提示
		return
	end

	-- 请求角色列表
	local msg = CustomMsgIDMap.NewC2SProto(CSCommon_pb.Login, CSCommon_pb.CmdRequestPlayerList)
	HallConnector:GetInstance():SendMessage(CSCommon_pb.Login, CSCommon_pb.CmdRequestPlayerList, msg)
end

local function OnProtoPlayerListResult(self, real_msg_id, msg_proto)
	print("OnProtoPlayerListResult", real_msg_id, msg_proto)
	local role_info_list = msg_proto.player_list_result.info
	if #role_info_list > 0 then
		-- 请求加载角色, 默认加载第1个角色
		local msg = CustomMsgIDMap.NewC2SProto(CSCommon_pb.Login, CSCommon_pb.CmdRequestLoadPlayer)
		msg.playerId = role_info_list[1].playerId
		HallConnector:GetInstance():SendMessage(CSCommon_pb.Login, CSCommon_pb.CmdRequestLoadPlayer, msg)
		return
	end
	-- 请求创建角色
	local msg = CustomMsgIDMap.NewC2SProto(CSCommon_pb.Login, CSCommon_pb.CmdRequestCreatePlayer)
	msg.sCharName = self.account --角色名
	msg.nRoleId = 1 -- 角色头像
	HallConnector:GetInstance():SendMessage(CSCommon_pb.Login, CSCommon_pb.CmdRequestCreatePlayer, msg)
end

local function OnProtoCreatePlayerError(self, real_msg_id, msg_proto)
	print("OnProtoCreatePlayerError", real_msg_id, msg_proto)
	-- TODO 创建角色错误提示
end
-- 协议 end ---------------------------------------------------

local function OnAddListener(self)
	print("UILoginModule.OnAddListener")
	base.OnAddListener(self)
	-- 监听选服变动
	self:AddDataListener(DataMessageNames.ON_LOGIN_SERVER_ID_CHG, OnSelectedSvrChg)
	-- 协议
	HallConnector:GetInstance():RegisterMsgHandler(CSCommon_pb.Gate, GateProtocol_pb.CmdG2CSyncKey, Bind(self, OnProtoG2CSyncKey))
	HallConnector:GetInstance():RegisterMsgHandler(CSCommon_pb.Gate, GateProtocol_pb.CmdG2CLoginTo, Bind(self, OnProtoG2CLoginTo))
	HallConnector:GetInstance():RegisterMsgHandler(CSCommon_pb.Login, CSCommon_pb.CmdLoginError, Bind(self, OnProtoLoginError))
	HallConnector:GetInstance():RegisterMsgHandler(CSCommon_pb.Login, CSCommon_pb.CmdPlayerListResult, Bind(self, OnProtoPlayerListResult))
	HallConnector:GetInstance():RegisterMsgHandler(CSCommon_pb.Login, CSCommon_pb.CmdCreatePlayerError, Bind(self, OnProtoCreatePlayerError))
end

local function OnRemoveListener(self)
	print("UILoginModule.OnRemoveListener")
	base.OnRemoveListener(self)
	self:RemoveDataListener(DataMessageNames.ON_LOGIN_SERVER_ID_CHG, OnSelectedSvrChg)
	HallConnector:GetInstance():UnRegisterMsgHandler(CSCommon_pb.Gate, GateProtocol_pb.CmdG2CSyncKey)
	HallConnector:GetInstance():UnRegisterMsgHandler(CSCommon_pb.Gate, GateProtocol_pb.CmdG2CLoginTo)
	HallConnector:GetInstance():UnRegisterMsgHandler(CSCommon_pb.Login, CSCommon_pb.CmdLoginError)
	HallConnector:GetInstance():UnRegisterMsgHandler(CSCommon_pb.Login, CSCommon_pb.CmdPlayerListResult)
	HallConnector:GetInstance():UnRegisterMsgHandler(CSCommon_pb.Login, CSCommon_pb.CmdCreatePlayerError)
end

-- 关闭
local function OnDisable(self)
	base.OnDisable(self)
	-- 清理成员变量
	self.account = nil
	self.password = nil
	self.client_app_ver = nil
	self.client_res_ver = nil
	self.area_name = nil
	self.server_name = nil
end

-- 销毁
local function OnDistroy(self)
	base.OnDistroy(self)
	-- 清理成员变量
end

UILoginModel.OnCreate = OnCreate
UILoginModel.OnEnable = OnEnable
UILoginModel.OnRefresh = OnRefresh
UILoginModel.OnAddListener = OnAddListener
UILoginModel.OnRemoveListener = OnRemoveListener
UILoginModel.OnDisable = OnDisable
UILoginModel.OnDistroy = OnDistroy

return UILoginModel