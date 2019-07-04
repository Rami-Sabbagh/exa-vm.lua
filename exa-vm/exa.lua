local root_module = string.sub(...,1,-1-string.len("exa"))

--Require some libraries
local class = require(root_module..".middleclass")
local utils = require(root_module..".utilities")

local exa = class('exa-vm.Exa')

function exa:initialize()
	self.name = "XA" --EXA name
	self.source = "" --EXA raw code

	self.editor_view_mode = 0 --EXA editor windows view mode.
	--[0]: Maximized, all code and registers are visible (Default).
	--[1]: Minimized, no visible code or registers.
	--[2]: Follow current instruction.
	--Not much use for a VM, but good for custom editors.

	self.m_register_mode = 0 --EXA M register mode.
	--[0]: Global (Default).
	--[1]: Local.

	self.sprite = {} --EXA Sprite data, an array of 100 booleans, from top-left into bottom-right, row by row.
	--Initialize the sprite array with empty data.
	for i=1, 100 do self.sprite[i] = false end
end

--Decode the EXA data from an EXAPUNKS .solution save file.
--The file should be seeked into the EXA "lead-in".
--file (io file instance): The save file object open in rb mode !
function exa:decode(file)
	file:read(1) --Skip the "lead-in"
	self.name = utils.readString(file)
	self.source = utils.readString(file)
	self.editor_view_mode = utils.readInt32(file)
	self.m_register_mode = utils.readInt32(file)
	for i=1,100 do
		self.sprite[i] = utils.readBool(file)
	end
end

--Eecode the EXA data into an EXAPUNKS .solution save file.
--The file should be seeked into the EXA "lead-in".
--file (io file instance): The save file object open in wb mode !
function exa:encode(file)
	file:write("\x0A") --Write the "lead-in"
	utils.writeString(file,self.name)
	utils.writeString(file,self.source)
	utils.writeInt32(file,self.editor_view_mode)
	utils.writeInt32(file,self.m_register_mode)
	for i=1,100 do
		utils.writeBool(file,self.sprite[i])
	end
end

return exa