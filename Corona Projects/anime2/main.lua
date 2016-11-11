-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- Your code here
local imgsheet ,imgsprite
local sheetdata,spritedata

sheetdata = {
frames = {
{x=0,y=0,width = 182,height =168},
 {x=182,y=0,width =182 ,height =168},
 {x=364,y=0,width =182 ,height =168},
 {x=546,y=0,width =182 ,height =168},
 {x=727,y=0,width =182 ,height =168},
 {x=0,y=169,width =182 ,height =168},
 {x=182,y=169,width =182 ,height =168},
 {x=182,y=169,width =182 ,height =168},
 {x=364,y=169,width =182 ,height =168},
 {x=546,y=169,width =182 ,height =168},
 {x=727,y=169,width =182 ,height =168},
 {x=0,y=182,width =182 ,height =168},
 {x=182,y=182,width =182 ,height =168},
 {x=364,y=182,width =182 ,height =168},
 {x=546,y=182,width =182 ,height =168}
}

}
 spritedata = {
 name = "bird",
 start = 1,
 count = 14,
 time = 1500,
 loopcount = 0,
 loopDirection = "forward"
}

local function touchimg( event )
	-- body
	if(event.phase == "moved")then
		imgsprite.x = event.x 
		imgsprite.y = event.y
	end

end

imgsheet = graphics.newImageSheet("bird.png",sheetdata)
imgsprite = display.newSprite(imgsheet,spritedata)

display.setDefault("background",255)

imgsprite.x = display.contentCenterX
imgsprite.y = display.contentCenterY
imgsprite:addEventListener("touch",touchimg)
imgsprite:play()