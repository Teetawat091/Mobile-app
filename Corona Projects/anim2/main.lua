-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- Your code here
local adsimg,preimg
local cx,cy,pos
local function chanads( event )

	pos = pos+1
	if(pos>8)then
		pos = 1
	end

	if(preimg)then
		preimg:removeSelf()
		preimg = nil
		--adsimg = display.newImage(pos .. ".png",cx,cy)
	end
	if(adsimg)then
		preimg = adsimg
		transition.to(adsimg,{time = 500,x = -120})
		adsimg = display.newImage(pos .. ".png",400,cy)
		transition.to(adsimg,{time = 300,x=cx})
	end
	
end

display.setDefault("background", 12/255,11/255,11/255)
cx = display.contentCenterX
cy = display.contentCenterY
pos = 1
adsimg = display.newImage(pos .. ".png",cx,cy)

timer.performWithDelay(1500, chanads, 0)