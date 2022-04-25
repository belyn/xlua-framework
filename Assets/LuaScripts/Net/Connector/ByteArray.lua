--[[
Serialzation bytes stream like ActionScript flash.utils.ByteArray.
It depends on lpack.
A sample: https://github.com/zrong/lua#ByteArray

@see http://underpop.free.fr/l/lua/lpack/
@see http://help.adobe.com/en_US/FlashPlatform/reference/actionscript/3/flash/utils/ByteArray.html
@author zrong(zengrong.net)

Creation 2013-11-14
Last Modification 2014-07-09

2022.4.24 modified by marvin(360078063@qq.com)
]]

local ByteArray = BaseClass("ByteArray")
local ENDIAN_LITTLE = 1
local ENDIAN_BIG = 2

----------------------------------------
-- private
----------------------------------------
local function _checkAvailable(self)
	assert(self._buflen >= self._pos, string.format("End of file was encountered. pos: %d, len: %d.", self._pos, self._buflen))
end

--- Get Letter Code
local function _getLC(self, __fmt)
	__fmt = __fmt or ""
	if self._endian == ENDIAN_LITTLE then
		return "<"..__fmt
	elseif self._endian == ENDIAN_BIG then
		return ">"..__fmt
	end
	return "="..__fmt
end

local function __init(self, __endian)
	self._endian = __endian
	self._buf = ""
	self._pos = 1
	self._buflen = 0
end

local function __delete(self)
	self._buf = ""
	self._pos = 1
	self._buflen = 0
end

local function getLen(self)
	return self._buflen
end

local function getAvailable(self)
	return self._buflen - self._pos + 1
end

local function getPos(self)
	return self._pos
end

local function setPos(self, __pos)
	assert(__pos >= 1)
	self._pos = __pos
	return self
end

local function setLen(self, __len)
	assert(__len >= 0)
	self._buflen = __len
	self._buf = string.sub(self._buf, self._pos, self:getAvailable())
end

--- Get all byte array as a lua string.
-- Do not update position.
local function getBytes(self, __offset, __length)
	__offset = __offset or 1
	__length = __length or self._buflen
	return string.sub(self._buf, __offset, __length)
end

local function readInt(self)
	local val, idx = string.unpack(_getLC(self, "i4"), self._buf, self._pos)
	self._pos = idx
	return val
end

local function writeInt(self, __int)
	local __s = string.pack(_getLC(self, "i4"),  __int)
	self:writeBuf(__s)
	return self
end

local function readUInt(self)
	local val, idx = string.unpack(_getLC(self, "I4"), self._buf, self._pos)
	self._pos = idx
	return val
end

local function writeUInt(self, __uint)
	local __s = string.pack(_getLC(self, "I4"), __uint)
	self:writeBuf(__s)
	return self
end

local function readShort(self)
	local val, idx = string.unpack(_getLC(self, "i2"), self._buf, self._pos)
	self._pos = idx
	return val
end

local function writeShort(self, __short)
	local __s = string.pack(_getLC(self, "i2"),  __short)
	self:writeBuf(__s)
	return self
end

local function readUShort(self)
	local val, idx = string.unpack(_getLC(self, "I2"), self._buf, self._pos)
	self._pos = idx
	return val
end

local function writeUShort(self, __ushort)
	local __s = string.pack(_getLC(self, "I2"),  __ushort)
	self:writeBuf(__s)
	return self
end

local function readLong(self)
	local val, idx = string.unpack(_getLC(self, "i8"), self._buf, self._pos)
	self._pos = idx
	return val
end

local function writeLong(self, __long)
	local __s = string.pack(_getLC(self, "i8"),  __long)
	self:writeBuf(__s)
	return self
end

local function readULong(self)
	local val, idx = string.unpack(_getLC(self, "I8"), self._buf, self._pos)
	self._pos = idx
	return val
end

local function writeULong(self, __ulong)
	local __s = string.pack(_getLC(self, "I8"), __ulong)
	self:writeBuf(__s)
	return self
end

local function readByte(self)
	local val, idx = string.unpack(_getLC(self, "b"), self._buf, self._pos)
	self._pos = idx
	return val
end

local function writeByte(self, __byte)
	local __s = string.pack("b", __byte)
	self:writeBuf(__s)
	return self
end

local function readUByte(self)
	local val, idx = string.unpack(_getLC(self, "B"), self._buf, self._pos)
	self._pos = idx
	return val
end

local function writeUByte(self, __ubyte)
	local __s = string.pack("B", __ubyte)
	self:writeBuf(__s)
	return self
end

local function readString(self, __len)
	assert(__len, "Need a length of the string!")
	if __len == 0 then return "" end
	_checkAvailable(self)
	return self:readBuf(__len)
end

local function writeString(self, __string)
	self:writeBuf(__string)
	return self
end

--- Read a byte array as string from current position, then update the position.
local function readBuf(self, __len)
	local __ba = self:getBytes(self._pos, self._pos + __len - 1)
	-- print(string.format("readBuf,len:%u, pos:%u", __len, self._pos), string.byte(__ba, 1, string.len(__ba)))
	self._pos = self._pos + __len
	return __ba
end

--- Write a encoded char array into buf
local function writeBuf(self, __s)
	if self._pos < self._buflen then
		self._buf = string.sub(self._buf, 1, self._pos - 1)
		self._buflen = string.len(self._buf)
	end
	local nCharLen = #__s
	for i = 1, nCharLen do
		self._buf = self._buf..string.char(string.byte(__s, i))
	end
	self._pos = self._pos + nCharLen
	self._buflen = self._buflen + nCharLen
	return self
end


ByteArray.__init = __init
ByteArray.__delete = __delete
ByteArray.getLen = getLen
ByteArray.setLen = setLen
ByteArray.getAvailable = getAvailable
ByteArray.getPos = getPos
ByteArray.setPos = setPos
ByteArray.getBytes = getBytes
ByteArray.readInt = readInt
ByteArray.writeInt = writeInt
ByteArray.readUInt = readUInt
ByteArray.writeUInt = writeUInt
ByteArray.readShort = readShort
ByteArray.writeShort = writeShort
ByteArray.readUShort = readUShort
ByteArray.writeUShort = writeUShort
ByteArray.readLong = readLong
ByteArray.writeLong = writeLong
ByteArray.readULong = readULong
ByteArray.writeULong = writeULong
ByteArray.readUByte = readUByte
ByteArray.writeUByte = writeUByte
ByteArray.readString = readString
ByteArray.writeString = writeString
ByteArray.readByte = readByte
ByteArray.writeByte = writeByte
ByteArray.readBuf = readBuf
ByteArray.writeBuf = writeBuf
ByteArray.ENDIAN_LITTLE = ENDIAN_LITTLE
ByteArray.ENDIAN_BIG = ENDIAN_BIG
return ByteArray
