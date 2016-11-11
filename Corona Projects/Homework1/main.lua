-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- Your code here

local title,price,tax
local cx,cy
local txtfield, txtfield2
local bgimg, buttonimg
local touch = false
local show


cx = display.contentCenterX
cy = display.contentCenterY

local function txtfeildlistener( event )
	
	local length = string.len(event.target.text)

	if(length >= 10)then
		event.target.text = event.oldText
	end

end

local function txtfeild2listener( event )

	local len = string.len(event.target.text)

	if(len > 2)then
		event.target.text = event.oldtext

	end

end

local function touchicon( event )

local tonum = tonumber(txtfield.text)
local totax = tonumber(txtfield2.text)
local taxx = tonum * (totax/100)
local pass = tostring(taxx)

if(event.phase=="ended")then



	if(touch==false)then

		transition.to(buttonimg,{time = 200,y=470})
		

	show = native.newTextField(cx,cy,80,30)
	show.text = pass
	title.isVisible = false
	price.isVisible = false
	tax.isVisible = false
	txtfield.isVisible = false
	txtfield2.isVisible = false
	touch = true

else
	
	transition.to (buttonimg,{time = 200 , y = 300})
	show.isVisible = false
	title.isVisible = true
	price.isVisible = true
	tax.isVisible = true
	txtfield.isVisible = true
	txtfield2.isVisible = true
	touch = false

end

end
end

local function rotate( event )
	angle = angle+3
	if(angle>360)then
		angle = 0
	else
	buttonimg.rotation = angle
end
end

angle = 1


title = display.newText("โปรแกรมคำนวณภาษี",cx,0,"Arial",30)
title:setFillColor(1,8,0)
price = display.newText("ราคาสินค้า",50,cy-100,"Arial",20)

tax = display.newText("เปอร์เซ็นภาษี",60,cy-60,"Arial",20)
bgimg = display.newImage("bg.jpg")
bgimg.alpha = 0.59

txtfield = native.newTextField(cx+10,cy - 100,150,30)
txtfield.align = "center"
txtfield.inputType = "number"
txtfield:addEventListener("userInput",txtfeildlistener)

txtfield2 = native.newTextField(cx-5,cy-60,70,30)
txtfield2.align = "center"
txtfield2.inputType = "number"
txtfield2:addEventListener("userInput",txtfeild2listener)

buttonimg = display.newImage("arrows.png",cx,cy+50)
buttonimg:addEventListener("touch",touchicon)

timer.performWithDelay(100,rotate,0)
