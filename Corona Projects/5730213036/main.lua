local widget = require("widget")
local backgroundImage
local textField1, textField2
local guideText, okButton
local cx, cy
local Result

local function textField1Listener(event)
	local len = string.len(event.target.text)
	guideText.text = "Height (CM.)"
	if(len > 8) then
		event.target.text = event.oldText
	end
end

local function textField2Listener(event)
	local len = string.len(event.target.text)
	guideText.text = "Weight (Kg.)"
	if(len > 8) then
		event.target.text = event.oldText
	end
end

local function okButtonEventHandler(event)
    if event.phase == "ended" then
        
       local h = tonumber(textField1.text)
       local w = tonumber(textField2.text)

       Result = w/(h*0.01*h*0.01)

       local showtxt = display.newText(tostring(Result),cx,cy,"Arial",20)
       guideText.isVisible = false
       textField1.isVisible = false
       textField2.isVisible = false
       okButton.isVisible = false
       transition.to(logoImage,{time = 450, y = 300})
       

    end
end

local function rotateButton(event)
	angle = angle + 20
	if (angle > 720) then
		angle = 0
	end
	okButton.rotation = angle
end

angle = 1
cx = display.contentCenterX
cy = display.contentCenterY

backgroundImage = display.newImage("background.png", cx, cy)
backgroundImage.alpha = 1.0

logoImage = display.newImage("BMI.png",cx, 70)

guideText = display.newText ("Body Mass Index (BMI)", cx, 130, "arial", 15)

textField1 = native.newTextField(cx, cy - 50, 120, 35)
textField1.align = "center"
textField1.inputType = "number"
textField1:addEventListener("userInput", textField1Listener)

textField2 = native.newTextField(cx, cy - 10, 120, 35)
textField2.align = "center"
textField2.inputType = "number"
textField2:addEventListener("userInput", textField2Listener)


okButton = display.newImage("okk.png", cx, 338)
okButton:addEventListener("touch", okButtonEventHandler)
timer.performWithDelay(100, rotateButton, 0)

