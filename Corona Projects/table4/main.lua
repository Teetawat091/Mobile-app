-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- Your code here
local widget = require("widget")
local table
local i, cat,rheigh,rcolor,lcolor

local function rowrender( event )

	local row,rowheight,rowwidth,rowtitle
	row = event.row
	print("Render".. row.index)
	rowHeight = row.contentHeight 
	rowWidth = row.contentWidth
	rowtitle = display.newText(row,"Row#"..row.index,0,0)
	rowtitle:setFillColor(0)
	rowtitle.x = display.contentCenterX
	rowtitle.y = row.contentHeight *0.5


end

local function rowtouch( event )
	-- body
	local row
	row = event.row
	if(event.phase == "swipLeft" or event.phase == "swipRight") then
		print("swift")
		elseif(event.phase == "released")then
			print("Touch"..row.index)
		end
end

table = widget.newTableView{
	top = 0,left = 0,
	height = display.contentHeight,
	width = display.contentWidth,
	onRowRender = rowrender,
	onRowTouch = rowtouch,

}

for i =1,200 do
	cat = false
	rheigh = 40
	rcolor = {default = {1,1,1}, over = {1,0.7,0.5}}
	lcolor = {0.5,0.5,0.5}

	if(i == 1) then
		cat = true
		rheigh = 20
		rcolor = {default = {1,0,0}, over = {1,0.7,0.5}}
		end

		table:insertRow({isCategory = cat,
			rowHeight = rheigh,
			rowColor = rcolor,
			lineColor = lcolor
			}
			)
		end
