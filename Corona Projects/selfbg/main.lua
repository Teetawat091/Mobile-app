-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- Your code here
local widget = require("widget")
local screenw,screenh
local imgw,imgh
local speed
local imgsheet ,imgsprite
local sheetdata,spritedata
local mbtn,mbtn2




display.setStatusBar(display.HiddenStatusBar)

screenw = 570
screenh = 320
imgw = 800
imgh = 600
speed = 3

background1 = display.newImageRect("bg1.png",imgw,imgh)
background1.x = screenw / 2
background1.y = screenh / 2
background2 = display.newImageRect("bg1.png",imgw,imgh)
background2.x = 1080
background2.y = screenh / 2

mbtn = widget.newButton({
	x = 60,
	y = 70,
	width = 64,
	height = 64,
	id = "btn1",
	onEvent = btnevent,
	defaultFile = "previous.png",
	})

mbtn2 = widget.newButton({
	x = 460,
	y = 70,
	width = 64,
	height = 64,
	id = "btn2",
	onEvent = btnevent,
	defaultFile = "skip.png",
	})

sheetdata = {
width = 103,
height = 100,
numFrames = 3

}

 spritedata = {
 name = "guitar",
 start = 1,
 count = 3,
 time = 500,
 loopcount = 0,
 loopDirection = "forward"
}

local function scrollbg( event )
	background1.x = background1.x - speed
	background2.x = background2.x - speed
	if(background1.x)< -530 then
		background1.x = 1060	
	end
	if(background2.x)< -530 then
		background2.x = 1060
	end
	-- body
end

local function scrollbg2( event )
	background1.x = background1.x + speed
	background2.x = background2.x + speed
	if(background1.x)> 480 then
		background1.x = 300
	end
	if(background2.x)> 500 then
		background2.x = 1060
	end
	-- body
end

local function touchimg( event )
	-- body
	if(event.phase == "moved")then
		if(imgsprite.isPlaying)then
			event.target:pause()
			
			if(imgsprite.x == display.contentCenterX)then

				transition.to(imgsprite,{time = 1000,x = 20})
			else
				transition.to(imgsprite,{time = 1000,x = display.contentCenterX})

			end
			
			if(imgsprite.x>300)then
				imgsprite.x = 50

				
			end
		else
			event.target:play()

		end
	end

end

local function btnevent( event )
	local btnid = event.target.id
	if(event.phase == "ended" ) then
	if(btnid == "btn1")then

		imgsprite.xScale = -1


		Runtime:addEventListener("enterFrame",scrollbg2)


		else
			 imgsprite.xScale = 1

			 Runtime:addEventListener("enterFrame",scrollbg)

		end
	end
	-- body
end

imgsheet = graphics.newImageSheet("gui.png",sheetdata)
imgsprite = display.newSprite(imgsheet,spritedata)

display.setDefault("background",255)

imgsprite.x = display.contentCenterX
imgsprite.y = 250

imgsprite:addEventListener("touch",touchimg)

mbtn:addEventListener("touch",btnevent)
mbtn2:addEventListener("touch",btnevent)

imgsprite:play()

--Runtime:addEventListener("enterFrame",scrollbg)