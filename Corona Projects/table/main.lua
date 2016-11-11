-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- Your code here
local widget = require("widget")
local table

table = widget.newTableView{
	left = 0,
	top = 0,
	heigh = display.contentHeight,
	width = display.contentWidth

	}

for i = 1,20 do
	table:insertRow{}
end