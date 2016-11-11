-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- Your code here
local widget = require("widget")
local txtfeild, txtfeild2
local okbutton, guifetxt
local cx,cy

local function txtfeildlistener( ... )
	local len = string.len(event.target.text)
	guifetxt.text = "Club ID" 
	if(len>8)then
		event.target.text = event.oldText
end
end

local function txtfeild2listener( event )
	local len = string.len(event.target.text)
	guifetxt.text = "PassCode" 
	if(len>4)then
		event.target.text = event.oldText

	
end
	
end

display.setDefault("background",0.4,0.6,0.5)
cx = display.contentCenterX
cy = display.contentCenterY

guifetxt = display.newText("Panama * Club",cx,50,"Arial",20)

txtfeild = native.newTextField(cx,cy - 40,180,30)
txtfeild.align = "center"
txtfeild:addEventListener("userinput", txtfeildlistener)

txtfeild2 = native.newTextField(cx,cy,180,30)
txtfeild2.align = "center"
txtfeild2.inputType = "number"
txtfeild2.isSecure = true
txtfeild2:addEventListener("userinput",txtfeild2listener)

okbutton = widget.newButton({
	x=cx,y=240,width = 128,
	heigh = 128,defaultFile = "ok.png"
	})