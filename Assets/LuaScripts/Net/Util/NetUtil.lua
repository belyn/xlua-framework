--[[
-- added by wsh @ 2017-01-10
-- 网络模块工具类
--]]

local NetUtil = {}
local ReceiveSinglePackage = require "Net.Config.ReceiveSinglePackage"
local ReceiveMsgDefine = require "Net.Config.ReceiveMsgDefine"


local function CalcPackageKey(tBufferData, nPackageIndex, nRndKey)
	local tKeyArray = {0xB8, 0x8A}
	tKeyArray[2] = tKeyArray[2] ~ nRndKey
	local nBuffSize = #tBufferData
	for i=1, nBuffSize do
		tKeyArray[1] = tKeyArray[1] ~ string.byte(tBufferData, i)
		tKeyArray[2] = tKeyArray[2] ~ tKeyArray[1]
	end

	local ret = tKeyArray[1] + (tKeyArray[2] << 8 & 0xff00)
	ret = ret ~ (~nPackageIndex) & 0xffffffff
	ret = ret ~ (~nBuffSize) & 0xffffffff
	return ret
end

local function SerializeMessage(msg_obj)
	local output = ""
	local send_msg = msg_obj.MsgProto:SerializeToString()
	
	output = output..string.pack("=I2", msg_obj.MsgID)
	output = output..string.pack("=I2", string.len(send_msg))
	output = output..send_msg
	return output
end

local PackageHeaderLen = 4
local function DeserializeMessage(byteArray, start, length)
	local packages = {}
	while byteArray:getAvailable() >= PackageHeaderLen do
		local real_msg_id = byteArray:readUShort()
		local pkg_length = byteArray:readUShort()
		if byteArray:getAvailable() < pkg_length then
			local pos = byteArray:getPos() - PackageHeaderLen
			byteArray:setPos(pos)
			break
		end

		local pb_data = byteArray:readBuf(pkg_length)
		-- print(string.format("real_msg_id[%d](module_id:%d, msg_id:%d)", real_msg_id, CustomMsgIDMap.TranslateMsgId(real_msg_id)), ", pkg_length:", pkg_length, ", pb_data:", string.byte(pb_data, 1, string.len(pb_data)))

		local msg_obj = CustomMsgIDMap.NewS2CProto(real_msg_id) 
		if msg_obj then
			msg_obj:ParseFromString(pb_data)
			local one_package = ReceiveSinglePackage.New(real_msg_id, msg_obj)
			table.insert(packages, one_package)
		else
			Logger.LogError(string.format("No proto config real_msg_id[%d](module_id:%d, msg_id:%d)", real_msg_id, CustomMsgIDMap.TranslateMsgId(real_msg_id)))
		end
	end
	return packages
end

NetUtil.CalcPackageKey = CalcPackageKey
NetUtil.SerializeMessage = SerializeMessage
NetUtil.DeserializeMessage = DeserializeMessage

return ConstClass("NetUtil", NetUtil)