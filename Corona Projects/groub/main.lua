-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- Your code here
local widget = require("widget")
local rect1,rect2,img1,img2
local groub1, groub2
local cx = display.contentCenterX ; cy = display.contentCenterY

rect1 = display.newRect(cx,50,100,100)
rect1:setFillColor(1,0,0)

rect1 = display.newRect(cx,320,100,100)
rect1:setFillColor(0,1,0)

img1 = display.newImage("wrong.png",cx,180)
img2 = display.newImage("right.png",cx,440)

groub1 = display.newGroup()
groub1:insert(rect1)
groub1:insert(img1)

groub2 = display.newGroup()
groub2:insert(rect2)
groub2:insert(img2)

