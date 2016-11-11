-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- Your code here
local imgsheet ,imgsprite
local sheetdata,spritedata

sheetdata = {
width = 200,
height = 240,
numFrames =4

}
 spritedata = {
 name = "skate",
 start = 1,
 count = 4,
 time = 10,
 loopcount = 0,
 loopDirection = "forward"
}

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

imgsheet = graphics.newImageSheet("boy.png",sheetdata)
imgsprite = display.newSprite(imgsheet,spritedata)

display.setDefault("background",255)

imgsprite.x = display.contentCenterX
imgsprite.y = display.contentCenterY
imgsprite:addEventListener("touch",touchimg)
imgsprite:play()