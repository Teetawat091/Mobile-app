-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- Your code here
local widget = require("widget")
local txtfeild, txtfeild2
local bgimg, logoimg
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

local function okbuttoneventhandler( event )
	local id,passcode
	id = txtfeild.text
	passcode = txtfeild2.text

	if(event.phase=="ended")then
	id = txtfeild.text
	passcode = txtfeild2.text
	if(string.len(id)==string.len(passcode))then
		guifetxt.isVisible = false
		txtfeild.isVisible = false
		txtfeild2.isVisible = false
		okbutton.isVisible = false
		transition.to(logoimg,{time = 600,y=440})
		bgimg.alpha = 1
	else
		guifetxt.text = "Invalid Login"
	end
end
end

local function rotatebutton( event )
	angle = angle+20
	if(angle>360)then
		angle = 0
	else
	okbutton.rotation = angle
end
end

angle = 1

cx = display.contentCenterX
cy = display.contentCenterY

bgimg = display.newImage("background.png",cx,cy)
bgimg.alpha = 0.6

logoimg = display.newImage("panama.png",cx,50)

guifetxt = display.newText("Panama * Club",cx,50,"Arial",20)

txtfeild = native.newTextField(cx,cy - 40,180,30)
txtfeild.align = "center"
txtfeild:addEventListener("userinput", txtfeildlistener)

txtfeild2 = native.newTextField(cx,cy,180,30)
txtfeild2.align = "center"
txtfeild2.inputType = "number"
txtfeild2.isSecure = true
txtfeild2:addEventListener("userinput",txtfeild2listener)

okbutton = display.newImage("ok.png",cx,270)
okbutton:addEventListener("touch",okbuttoneventhandler)
timer.performWithDelay(100,rotatebutton,0)