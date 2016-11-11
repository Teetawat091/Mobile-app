-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- Your code here
local widget = require("widget")
local img1,img2
local group1 , group2
local button1 , button2
local cx = display.contentCenterX 
local cy = display.contentCenterY

--img1 = display.newImage("wrong.png",cx,180)
--img2 = display.newImage("right.png",cx,440)

 button1 = widget.newButton({
	width = 100,
	height = 40,
	id = "btn1",
	onEvent = buttonEvent,
	shape = "roundedRect",
	cornerRadius = 5,
	lablecolor = {default = {1,1,1},over = {1,1,1}},
	fillcolor = {default = {0,0,0,0.5},over = {0,0,0,0.7}}
	})

 button2 = widget.newButton({
	width = 100,
	height = 40,
	id = "btn2",
	onEvent = buttonEvent,
	shape = "roundedRect",
	cornerRadius = 5,
	lablecolor = {default = {1,1,1},over = {1,1,1}},
	fillcolor = {default = {0,0,0,0.5},over = {0,0,0,0.7}}
	})


local function buttonEvent( event )

	if(event.phase == "ended")then
	if(event.target.id == "btn1") then
		toast(group1)
	else
		toast(group2)
	end
end
	
end

local function hidetoast()
	activegrb.isVisible = false
	-- body
end
local function showtoast()
	activegrb.isVisible = true
	-- body
end

local function toast( obj )
	activegrb = obj
	showtoast()

	timer.performWithDelay(500,hidetoast,1);

end



display.setDefault("background",1,1,1)

button1.x = cx
button1.y = 300
button1:setLable("wrong")

button2.x = cx
button2.y = 350
button2:setLable("right")






