-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- Your code here
local widget = require("widget")
local imgsheet ,imgsprite
local sheetdata,spritedata
local mbtn,mbtn2

mbtn = widget.newButton({
	x = 60,
	y = 470,
	width = 64,
	height = 64,
	id = "btn1",
	onEvent = btnevent,
	defaultFile = "minus.png",
	})

mbtn2 = widget.newButton({
	x = 260,
	y = 470,
	width = 64,
	height = 64,
	id = "btn2",
	onEvent = btnevent,
	defaultFile = "plus.png",
	})



sheetdata = {
width = 184,
height = 325,
numFrames =8

}
 spritedata = {
 name = "walk",
 start = 1,
 count = 4,
 time = 500,
 loopcount = 0,
 loopDirection = "forward"
}

local function btnevent( event )
	local btnid = event.target.id
	if(event.phase == "ended" ) then
	if(btnid == "btn1")then

		imgsprite.xScale = -1

		else
			 imgsprite.xScale = 1
		end
	end
	-- body
end

local function touchimg( event )
	-- body
	if(event.phase == "moved")then
		if(imgsprite.isPlaying)then

			event.target:pause()
		else
			event.target:play()
		end
	end

end

imgsheet = graphics.newImageSheet("man.png",sheetdata)
imgsprite = display.newSprite(imgsheet,spritedata)

display.setDefault("background",255)

imgsprite.x = display.contentCenterX
imgsprite.y = display.contentCenterY
imgsprite:addEventListener("touch",touchimg)
mbtn:addEventListener("touch",btnevent)
mbtn2:addEventListener("touch",btnevent)
imgsprite:play()