-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- Your code here
local widget = require("widget") 
local d1,d2,d3,sum
local bg,imgd1,imgd2,imgd3 , imgstatus
local sound
local btn
local cx = display.contentCenterX ; cy = display.contentCenterY

bg = display.newImage("green.png",cx,cy)

imgd1 = display.newImage("1.png",cx,188)
imgd2 = display.newImage("1.png",100,300)
imgd3 = display.newImage("1.png",230,300)

--imgstatus = display.newImage("lo.png",cx-5,50)

sound = audio.loadSound("dice.mp3")

btn = widget.newButton(
{
	x = cx,
	y = 420,
	Width = 64,
	Height = 64,
	defaultFile = "btn.png" ,
	onEvent = btnhandle
	}
	)
local function removeimg(obj)
	-- body
	if(obj)then
		obj:removeSelf()
		obj = nil
	end

end

local function randomdice()
	d1 = math.random(1,6)
	d2 = math.random(1,6)
	d3 = math.random(1,6)

	sum = d1+d2+d3

	removeimg(imgstatus)


	if(d1 == d2 and d2 == d3) then

		imageFile = "triple.png"

		elseif(sum>=11) then

			imageFile = "hi.png"
		else
			imageFile = "lo.png"
	end
	imgstatus = display.newImage(imageFile,cx-5,50)


	removeimg(imgd1)
	removeimg(imgd2)
	removeimg(imgd3)
	

	imgd1 = display.newImage(d1..".png",cx,188)
	imgd2 = display.newImage(d2..".png",100,300)
	imgd3 = display.newImage(d3..".png",230,300)

	print(d1,d2,d3)
	-- body
end

local function btnhandle(event)
	-- body
	if(event.phase == "ended")then
	audio.play(sound)
	randomdice()
end

end
btn:addEventListener("touch",btnhandle)
