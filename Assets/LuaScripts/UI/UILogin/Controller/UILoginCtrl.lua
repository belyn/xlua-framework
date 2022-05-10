--[[
-- added by wsh @ 2017-12-01
-- UILogin控制层
--]]

local UILoginCtrl = BaseClass("UILoginCtrl", UIBaseCtrl)

local function OnConnect(self, sender, result, msg)
	if result < 0 then
		Logger.LogError("Connect err : "..msg)
		return
	end
	
	-- TODO：
	print("self.model.account", self.model.account)
    local msg = CustomMsgIDMap.NewC2SProto(CSCommon_pb.Gate, GateProtocol_pb.CmdC2GLoginTo)
	-- msg.server_id = 255
	msg.login_info.name = self.model.account.."&X-XY-H"
	msg.login_info.password = ""
	msg.login_info.device = "win"
	msg.login_info.system = ""
	msg.login_info.language = "zh-CN"
	msg.login_info.game_version = 68551688
	msg.login_info.packet_name = "zlslg"
	HallConnector:GetInstance():SendGateMessage(CSCommon_pb.Gate, GateProtocol_pb.CmdC2GLoginTo, msg)
end

local function OnClose(self, sender, result, msg)
	if result < 0 then
		Logger.LogError("Close err : "..msg)
		return
	end
end

local function ConnectServer(self)
	HallConnector:GetInstance():Dispose()
	HallConnector:GetInstance():Connect("127.0.0.1", 9588, Bind(self, OnConnect), Bind(self, OnClose))
	-- HallConnector:GetInstance():Connect("192.168.8.2", 9588, Bind(self, OnConnect), Bind(self, OnClose))
end

local function LoginServer(self, name, password)
	-- 合法性检验
	if string.len(name) > 20 or string.len(name) < 1 then
		-- TODO：错误弹窗
		Logger.LogError("name length err!")
	    return;
	end
	if string.len(password) > 20 or string.len(password) < 1 then
		-- TODO：错误弹窗
		Logger.LogError("password length err!")
	    return;
	end
	-- 检测是否有汉字
	for i=1, string.len(name) do
		local curByte = string.byte(name, i)
	    if curByte > 127 then
			-- TODO：错误弹窗
			Logger.LogError("name err : only ascii can be used!")
	        return;
	    end;
	end
	
	ClientData:GetInstance():SetAccountInfo(name, password)
	
	-- 发起网络连接，连接成功后就请求登录
	UserData:GetInstance():Dispose()
	ConnectServer(self)
end

local function ChooseServer(self)
	UIManager:GetInstance():OpenWindow(UIWindowNames.UILoginServer)
end

UILoginCtrl.LoginServer = LoginServer
UILoginCtrl.ChooseServer = ChooseServer

return UILoginCtrl