-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- Your code here
local widget = require("widget")
local rect1,rect2,img1,img2
local group1 , group2
local cx = display.contentCenterX ; cy = display.contentCenterY

rect1 = display.newRect(cx,50,100,100)
rect1:setFillColor(1,0,0)

rect1 = display.newRect(cx,320,100,100)
rect1:setFillColor(0,1,0)

img1 = display.newImage("wrong.png",cx,180)
img2 = display.newImage("right.png",cx,440)

group1 = display.newGroup()
group1:insert(rect1)
group1:insert(img1)

group1.isVisible = false

group2 = display.newGroup()
group2.insert(rect2)
group2:insert(img2)

group2.isVisible = false

timer.performWithDelay(500,swapDisplay,0)

local function swapDisplay()
	groub1.isVisible = not(groub1.isVisible)
	groub2.isVisible = not(groub2.isVisible)

	-- body
end