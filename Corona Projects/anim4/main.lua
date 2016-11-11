-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- Your code here
local adsimg,adsfile
local cx,cy,pos
local adstimer
local function chanads( event )

	transition.to(adsimg[pos],{time = 500,x = 440})
	pos = pos%8+1
	transition.to(adsimg[pos],{time = 300,x = cx})
		
	end

local function adseventhandeler(event)
	-- body
	if(event.phase=="began")then
		if(adstimer)then
			timer.cancle(adstimer)
			adstimer = nil
		else
			chanads()
			adstimer = timer.performWithDelay(1500,chanads,0)
		end
	end
end

display.setDefault("background", 12/255,11/255,11/255)
cx = display.contentCenterX
cy = display.contentCenterY

adsfile = {"1.png","2.png","3.png","4.png","5.png","6.png","7.png","8.png"}
adsimg = {}
for i = 1, #adsfile do
	table.insert(adsimg, display.newImage(adsfile[i],440,cy))
	adsimg[i]:addEventListener("touch",adseventhandeler)
end

pos = 1
transition.to(adsimg[pos], {time = 300 ,x=cx})
timer.performWithDelay(1500, chanads, 0)