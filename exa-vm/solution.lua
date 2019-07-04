--A parser for .solution files
--[[Based on the following community's documentation:
- https://ramilego4game.github.io/TEC-Redshift-Disk-Specification/
- https://www.reddit.com/r/exapunks/comments/973luq/current_solution_file_format/
]]

local root_module = ...
local class = require(root_module..".middleclass")

local solution = class('exa-vm.Solution')

function solution:initialize()
	self.version = 1007 --The save file version ?

	self.level_id = "PB039" --The internal EXAPUNKS level ID.
	--Defaults to the TEC Homebrew (Sandbox) level.

	self.name = "NEW SOLUTION 1" --The solution name.
	self.competition_wins = 0 --The competition wins count, in battle levels.
	--completely useless for a VM.

	self.win_statistics = {} --The win statistics, empty when not won, or if non-standard.
	--Completely useless for a VM.
	--When the solution is won, this table would have those keys and values:
	--[cycles]: number, the won cycles count.
	--[size]: the size of the solution, it's the sum of functional instructions count of all the starting EXAs.
	--[activity]: the activity count.

	self.starting_exas = {} --The exa instances used when starting the solution execution.
	--Move instances could be created during execution using the REPL instruction.
end

return solution