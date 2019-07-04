local root_module = ...
local class = require(root_module..".middleclass")

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

return exa