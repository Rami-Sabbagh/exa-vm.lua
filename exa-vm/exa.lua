local root_module = ...
local class = require(root_module..".middleclass")

local exa = class('exa-vm.Exa')

function exa:initialize()
	self.name = "XA" --EXA name
	self.code = "" --EXA code

	self.code_view_mode = 0 --EXA Code windows view mode.
	--[0]: Maximized, all code and registers are visible (Default).
	--[1]: Minimized, no visible code or registers.
	--[2]: Follow current instruction.

	self.m_register_mode = 0 --EXA M register mode.
	--[0]: Global (Default).
	--[1]: Local.

	self.sprite = {} --EXA Sprite data, an array of 100 booleans, from top-left into bottom-right, row by row.
	for i=1, 100 do
		self.sprite[i] = false --Initialize the sprite array with empty data.
	end
end

return exa