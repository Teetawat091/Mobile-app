-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- Your code here
local widget = require("widget")
local table
local i,cat,rheigh,rcolor,lcolor

table = widget.newTableView{
	left = 0,top = 0,
	heigh = display.contentHeight,
	width = display.contentWidth

}

for i = 1,20 do
	cat = false
	rheigh = 40
	rcolor = {default = {1,1,1}, over = {1,0.7,0.5}}
	lcolor = {0.5,0.5,0.5}

	if(i == 1) then
		cat = true
		rheigh = 80 
		rcolor = {default = {1,1,1}, over = {1,0.7,0.5}}
	end

	table:insertRow({isCategory = cat,
		rowHeight = rheigh,
		rowColor = rcolor,
		lineColor = lcolor}
		)
end