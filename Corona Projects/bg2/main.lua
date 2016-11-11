-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- Your code here
local screenw,screenh
local imgw,imgh
local speed

display.setStatusBar(display.HiddenStatusBar)

screenw = 480
screenh = 320
imgw = 800
imgh = 600
speed = 5

background1 = display.newImageRect("background1.png",imgw,imgh)
background1.x = screenw / 2
background1.y = screenh / 2
background2 = display.newImageRect("background2.png",imgw,imgh)
background2.x = 1040
background2.y = screenh / 2

local function scrollbg( event )
	background1.x = background1.x - speed
	background2.x = background2.x - speed
	if(background1.x)< -600 then
		background1.x = 1040
	end
	if(background2.x)< -600 then
		background2.x = 1040
	end
	-- body
end
Runtime:addEventListener("enterFrame",scrollbg)