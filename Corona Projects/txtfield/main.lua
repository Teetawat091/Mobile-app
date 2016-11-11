-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- Your code here
local widget = require("widget")
local txtfeild, txtfeild2
local cx,cy

local function txtfeildlistener( ... )
	
	if(event.phase=="ended")then
	print("TextField1 : "..event.target.text)
end
end

local function txtfeild2listener( event )

	if(event.phase=="ended")then
	print("TextField2 : "..event.target.text)
end
	
end

display.setDefault("background",0.5,0.5,0.5)
cx = display.contentCenterX

cy = display.contentCenterY

txtfeild = native.newTextField(cx,cy - 40,180,30)
txtfeild:addEventListener("userinput", txtfeildlistener)

txtfeild2 = native.newTextField(cx,cy,180,30)
txtfeild2:addEventListener("userinput",txtfeild2listener)