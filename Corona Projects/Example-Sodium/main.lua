local widget = require("widget")
local sqlite = require("sqlite3")
local path, db, tableView
local id, name, amt, sodium
local view,words

local function showalertlistener(event)
if(event.action == "clicked") then
createtableview(words[event.index])
end
end

local function createtableview(event)
	local sqlcommand,sqlfilter,namenowb
	
	tableView:deleteAllRows()
	
	id = {0}
	name  = {""}
	amt = {""}
	sodium = {0}
	
	tableView:insertRow(
 		{
 			isCategory = false, rowHeight = 40,
 			rowColor = {default = {1,1,1},over = {1,0.7,0.5}},
 		}
 	)
	sqlfilter = ""
	if not (filter == nil)then
	sqlfilter = "WHERE name LIKE \"%"..filter.."%\""
	end
	
	
	if(view == 1) then
	sqlcommand = "SELECT * FROM sodium ORDER BY name"
	elseif(view == 2)then
	sqlcommand = "SELECT * FROM sodium ORDER BY sodium"
	else 
	sqlcommand = "SELECT * FROM sodium ORDER BY sodium DESC"
	end
	
	c = 0
	for row in db:nrows(sqlcommand) do
	c = c+1
	table.insert(id,c)
 	table.insert(name,row.name)
 	table.insert(amt, row.amt)
 	table.insert(sodium, row.sodium)
 	tableView:insertRow(
 		{
 			isCategory = false, rowHeight = 40,
 			rowColor = {default = {1,1,1},over = {1,0.7,0.5}},
 		}
 	)
 end
	
	end

local function categorylistener(event)
print(event.x)
	if(event.phase == "began")then
		view = view%3 + 1
		createtableview()
		print(view)
		end

end

local function rowTouch(event)
	local row = event.row
	local word 
	
	if (event.phase == "ralease") then
		words = {"ยกเลิก"}
		for word in namewb[row]:gmatch("%s+")do 
			table.insert(words,word)
			end
			alert = native.showAlert("กรองการค้นหาด้วยคำ","เลือกคำ",words,showalertlistener)

	end
end

local function rowRender(event)
	local row, rowHeight, rowWidth, rowTitle1, rowTitle2, fontSize
	local rowString1, rowString2

	row = event.row
	fontSize = 20
	rowHeight =row.contentHeight
	rowWidth = row.contentWidth

	if (row.index == 1) then
		rowTitle1 = display.newText(row, "ตารางโซเดียม(mg)",0, 0, "Arial", fontSize+ 15)
		rowTitle1:setFillColor(0)
		rowTitle1.x = display.contentCenterX
		rowTitle1.y = rowHeight * 0.5
		rowTitle1:addEventListener("touch",categorylistener)
	return
end

rowString1 = string.format("%3d.", id[row.index])  .. " "..name[row.index] .."("..amt[row.index]..")"
rowString2 = string.format("%3d" , sodium[row.index])

rowTitle1 = display.newText(row , rowString1,0,0,"Arial", fontSize)
rowTitle1:setFillColor(0)
rowTitle1.anchorX = 0
rowTitle1.x = 10
rowTitle1.y = rowHeight * 0.5

myRectangle = display.newRect(row, rowWidth-85, rowHeight* 0.47, 84, 39)
myRectangle.strokeWidth = 1
myRectangle:setFillColor(0.1, 0.1, 0.1)
myRectangle:setStrokeColor(0.5,0.5,0.5)
myRectangle.alpha = 1
myRectangle.anchorX = 0

rowTitle2 = display.newText(row,rowString2, 0 ,0, "Arial", fontSize +10)
rowTitle2:setFillColor(1,0.5,0)
rowTitle2.anchorX = 1
rowTitle2.x = rowWidth-5
rowTitle2.y = rowHeight *0.55
end

local function onSystemEvent(event)
	if(event.type== "applicationExit") then
			db:close()
		end
end

path = system.pathForFile("sodium.db",system.ResourceDirectory)
db = sqlite.open(path)

display.setDefault("background",0.5,0.5,0.5)
display.setStatusBar(display.HiddenStatusBar)

tableView = widget.newTableView{
	left = 0, top = 0,
	height = display.contentHeight,
	width = display.contentWidth,
	onRowRender = rowRender,
	onRowTouch = rowTouch
}

id = {""}
name = {""}
amt = {""}
sodium = {""}
tableView:insertRow(
	{
		isCategory = true, rowHeight = 60,
		rowColor = {default = {0.5,0.5,0.5,0.95}}
	}
)
 
 view = 1
 createtableview()