--[[
-- added by wsh @ 2017-01-10
-- 网络模块工具类
--]]

local NetUtil = {}
local MsgIDMap = require "Net.Config.CustomMsgIDMap"
local ReceiveSinglePackage = require "Net.Config.ReceiveSinglePackage"
local ReceiveMsgDefine = require "Net.Config.ReceiveMsgDefine"

local function XOR(seq, msgid, data, start, length)
	assert(data ~= nil and type(data) == "string")
	assert(seq ~= nil and type(seq) == "number")
	assert(msgid ~= nil and type(msgid) == "number")
	if string.len(data) == 0 then
		return data
	end
	
	start = start or 1
	length = length or string.len(data)
	seq = seq + msgid
	
	local output = ""
	local cur_index = start
	while cur_index < start + length do
		local left_length = start + length - cur_index
		if left_length >= 4 then
			local tmp = string.unpack("=I4", data, cur_index)
			tmp = ((tmp ~ seq) & 0xffffffff)
			output = output..string.pack("=I4", tmp)
			cur_index = cur_index + 4
		elseif left_length >= 2 then
			local tmp = string.unpack("=I2", data, cur_index)
			tmp = ((tmp ~ seq) & 0xffff)
			output = output..string.pack("=I2", tmp)
			cur_index = cur_index + 2
		elseif left_length >= 1 then
			local tmp = string.unpack("=I1", data, cur_index)
			tmp = ((tmp ~ seq) & 0xff)
			output = output..string.pack("=I1", tmp)
			cur_index = cur_index + 1
		end
	end
	
	return output
end

local function SerializeMessage(msg_obj, global_seq)
	local output = ""
	local send_msg = msg_obj.MsgProto:SerializeToString()
	
	output = output..string.pack("=I2", msg_obj.MsgID)
	output = output..string.pack("=I2", string.len(send_msg))
	output = output..send_msg
	-- output = output..string.pack("=I4", global_seq)
	-- output = output..string.pack("=I4", msg_obj.RequestSeq)
	-- output = output..XOR(global_seq, msg_obj.MsgID, send_msg)
	-- output = string.pack("=I4", string.len(output))..output
	
	--print("send bytes:", string.byte(output, 1, #output))
	return output
end

local PackageHeaderLen = 4
local function DeserializeMessage(byteArray, start, length)
	local packages = {}
	while byteArray:getAvailable() >= PackageHeaderLen do
		local msg_id = byteArray:readUShort()
		local pkg_length = byteArray:readUShort()
		if byteArray:getAvailable() < pkg_length then
			local pos = byteArray:getPos() - PackageHeaderLen
			byteArray:setPos(pos)
			break
		end

		local pb_data = byteArray:readBuf(pkg_length)
		print("msg_id:", msg_id, ", pkg_length:", pkg_length, ", pb_data:", string.byte(pb_data, 1, string.len(pb_data)))

		local msgProtoConfig = (MsgIDMap.S2C[msg_id])
		local msg_obj = nil 
		if msgProtoConfig then
			msg_obj = msgProtoConfig()
		end
		if msg_obj then
			msg_obj:ParseFromString(pb_data)
			local one_package = ReceiveSinglePackage.New(msg_id, msg_obj)
			table.insert(packages, one_package)
		else
			Logger.LogError("No proto type match msg id : "..msg_id)
		end
	end
	return packages
end

NetUtil.XOR = XOR
NetUtil.SerializeMessage = SerializeMessage
NetUtil.DeserializeMessage = DeserializeMessage

return ConstClass("NetUtil", NetUtil)