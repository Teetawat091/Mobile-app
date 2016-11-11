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
	local leng = string.len(event.target.text)
	if(leng>8)then
		event.target.text = event.oldText
end
end

local function txtfeild2listener( event )
	local leng = string.len(event.target.text)
	if(leng>4)then
		event.target.text = event.oldText

	
end
	
end

display.setDefault("background",0.5,0.5,0.5)
cx = display.contentCenterX
cy = display.contentCenterY

txtfeild = native.newTextField(cx,cy - 40,180,30)
txtfeild.align = "center"
txtfeild:addEventListener("userinput", txtfeildlistener)

txtfeild2 = native.newTextField(cx,cy,180,30)
txtfeild2.align = "center"
txtfeild2.inputType = "number"
txtfeild2:addEventListener("userinput",txtfeild2listener)