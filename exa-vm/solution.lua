--A parser for .solution files
--[[Based on the following community's documentation:
- https://ramilego4game.github.io/TEC-Redshift-Disk-Specification/
- https://www.reddit.com/r/exapunks/comments/973luq/current_solution_file_format/
]]

local root_module = ...
local class = require(root_module..".middleclass")

local solution = class('exa-vm.Solution')

function solution:initialize()
	
end

return solution