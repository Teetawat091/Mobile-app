-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- Your code here
local imgsheet ,imgsprite
local sheetdata,spritedata

sheetdata = {
width = 100,
height = 100,
numFrames =5

}
 spritedata = {
 name = "fly",
 start = 1,
 count = 4,
 time = 500,
 loopcount = 0,
 loopDirection = "forward"
}

local function touchimg( event )
	-- body
	if(event.phase == "moved")then
		if(imgsprite.isPlaying)then
			event.target:pause()
			imgsprite.x = event.x+50
			

			if(imgsprite.y<400)then

				transition.to(imgsprite,{time = 1000,y = 0})

			end
			
			if(imgsprite.x>300)then
				imgsprite.x = 50

				
			end
		else
			event.target:play()

		end
	end

end

imgsheet = graphics.newImageSheet("dragon.png",sheetdata)
imgsprite = display.newSprite(imgsheet,spritedata)

display.setDefault("background",255)

imgsprite.x = display.contentCenterX
imgsprite.y = display.contentCenterY
imgsprite:addEventListener("touch",touchimg)
imgsprite:play()