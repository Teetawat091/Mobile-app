
local adsimg
local cx,cy,pos
local function chanads( event )

	pos = pos+1
	if(pos>8)then
		pos = 1
	end

	if(adsimg)then
		adsimg:removeSelf()
		adsimg = nil
		adsimg = display.newImage(pos .. ".png",cx,cy)
	end
	
end

display.setDefault("background", 12/255,11/255,11/255)
cx = display.contentCenterX
cy = display.contentCenterY
pos = 1
adsimg = display.newImage(pos .. ".png",cx,cy)

timer.performWithDelay(1500, chanads, 0)