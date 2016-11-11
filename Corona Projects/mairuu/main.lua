-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- Your code

local widget = require("widget")
local sqlite = require("sqlite3")
local path,db,tableview
local id,name,amt,Sodium

local function rowtouch (event)
local row = event.row
if(event.phase == "release")then
print(row.index)
end
end

local function rowrender(event)
local row,rowheigh,rowwidth,rowtitle,rowtitle2,fontsize
local rowstring1,rowstring2

row = event.row
fontsize = 20
rowheigh = row.contentHeight
rowwidth = row.contentWidth

if(row.index == 1)then
rowtitle = dispaly.newText(row,"ตารางโซเดียม(mg)",0,0,"Quark-Bold.otf",fontsize+15)
rowtitle:setFillColor(0)
rowtitle.x = dispaly.contentCenterX
rowtitle.y = rowheigh * 0.5
return
end

rowstring1 = string.format("%3d",id[row.index]).." "..name[row.index].." ("..amt[row.index]..")"
rowstring2 = string.format("%3d",na[row.index])

rowtitle = dispaly.newText(row,rowstring1,0,0,"Quark-Bold.otf",fontsize)
rowtitle:setFillColor(0)
rowtitle.anchorX = 0
rowtitle.x = 10
rowtitle.y = rowheigh * 0.5

myrect = dispaly.newRect(row,rowwidth - 85,rowheigh * 0.47,84,39)
myrect.strokeWidth = 1
myrect:setFillColor(0.1,0.1,0.1)
myrect:setStrokeColor(0.5,0.5,0.5)
myrect.alpha = 1
myrect.anchorX = 0

rowtitle2 = dispaly.newText(row,rowstring2,0,0,"Quark-Bold.otf",fontsize+10)
rowtitle2:setFillColor(1,0.5,0)
rowtitle2.anchorX = 1
rowtitle2.x = rowwidth -5
rowtitle2.y = rowheigh * 0.55
end

local function onsystemevent(event)
if(event.type == "applicationExit")then
db:close()
end
end

path = system.pathForFile("food.db",system.ResourceDirectory)
db = sqlite.open(path)

dispaly.setDefault("background",0.5,0.5,0.5)
dispaly.setStatusBar(dispaly.HiddenStatusBar)

tableview = widget.newTableView{
left = 0, top = 0,
height = dispaly.contentHeight,
width = dispaly.contentWidth,
onRowrender = rowrender,
onRowTouch = rowtouch
}

id = {""}
name = {""}
amt = {""}
Sodium = {""}

tableview:insertRow(
{
isCategory = true,rowheigh = 60,
rowColor = {default = {0.5,0.5,0.5,0.95}}
}
)

c = 0

for row in db:nrows("SELECT * FROM Sodium(1);")do
c = c+1
table.insert(id,c)
table.insert(name,row.name)
table.insert(Sodium,row.Sodium)

tableview :insertRow({
isCategory = false,rowheigh = 40,
rowColor = {default = {1,1,1},over = {1,0.7,0.5}}
}
)
end