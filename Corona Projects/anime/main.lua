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
{x=0,y=0,width = 300,height =300},
 {x=300,y=0,width =300 ,height =300},
 {x=600,y=0,width =300 ,height =300},
}
}
 spritedata = {
 name = "logo",
 start = 1,
 count = 3,
 time = 1500,
 loopcount = 0,
 loopDirection = "forward"
}

imgsheet = graphics.newImageSheet("logo.png",sheetdata)
imgsprite = display.newSprite(imgsheet,spritedata)

display.setDefault("background",255)

imgsprite.x = display.contentCenterX
imgsprite.y = display.contentCenterY
imgsprite:play()