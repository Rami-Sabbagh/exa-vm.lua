-- A collection of utility functions, used by the rest of the library

--Load the bitop library
local bit = require("bit")
local band, bor, lshift, rshift = bit.band, bit.bor, bit.lshift, bit.rshift

--Localize some of the Lua std function for optimization reasons.
local byte, char = string.byte, string.char

local utils = {}

---------------------
---Binary decoders---
---------------------

--Read a boolean value from an io file.
function utils.readBool(file)
	return (file:read(1) ~= "\x00")
end

--Read a byte value from an io file.
function utils.readByte(file)
	return byte(file:read(1))
end

--Read an int32 value from an io file.
function utils.readInt32(file)
	local int32 = 0
	for i=0, 3 do int32 = int32 + lshift(byte(file:read(1)),8*i) end
	return int32
end

--Read a string value from an io file.
function utils.readString(file)
	return file:read(utils.readInt32(file))
end

---------------------
---Binary encoders---
---------------------

--Write a boolean value into an io file.
function utils.writeBool(file,bool)
	file:write(char(bool and 1 or 0))
end

--Write a byte value into an io file.
function utils.writeByte(file,b)
	file:write(char(b))
end

--Write an int32 value into an io file.
function utils.writeInt32(file,int32)
	for i=1, 4 do
		file:write(char(band(int32,255)))
		int32 = rshift(int32)
	end
end

--Write a string value into an io file.
function utils.writeString(file,str)
	utils.writeInt32(#str)
	file:write(str)
end

return utils