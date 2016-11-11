local widget = require "widget"
local cx = display.contentCenterX
local cy = display.contentCenterY
backgroundImage = display.newImage("6.jpg", cx, cy+200)
backgroundImage.alpha = 10

local Result = display.newText({ text = "BMI", x = cx, y = cy-200, fontSize = 30})
Result:setFillColor(0,0,0)

local guidText = display.newText("Weight(kg.)" , cx , 100 , "Arial",20)
guidText:setFillColor(0,0,0)
local Input1 = native.newTextField(cx,cy-110,display.contentWidth/3,30)

local guidText = display.newText("Height(cm.)" , cx , cy-70 , "Arial",20)
guidText:setFillColor(0,0,0)
local Input2 = native.newTextField(cx,cy-40,display.contentWidth/3,30)

local function handleButtonEvent(event)
    if event.phase == "ended" then
        Result.text = Input1.text / ((Input2.text/100) ^ 2)
    end
end
local function rotateButton(event)
    angle = angle+15
    if(angle>360) then
            angle = 0
    end
    logoImage.rotation = angle
end
angle = 1

local cal = widget.newButton(
    {
         label = "CLICK",fontSize = 30,
        onEvent = handleButtonEvent
       
    }

)
cal.x = cx
cal.y = cy+50