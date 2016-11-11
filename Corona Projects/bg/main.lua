-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- Your code here
local bg1
local bg2
local runtime = 0
local scrollSpeed = 0.2

local function  addscrollablebg()
	local bgimg = {type = "image",filename = "background-2.png"}

	bg1 = display.newRect(0,0,display.contentWidth,display.actualContentHeight)
	bg1.fill = bgimg
	bg1.x = display.contentCenterX
	bg1.y = display.contentCenterY

	bg2 = display.newRect(0,0,display.contentWidth,display.actualContentHeight)
	bg2.fill = bgimg
	bg2.x = display.contentCenterX
	bg2.y = display.contentCenterY
	-- body
end

local function movebg(dt)

	bg1.y = bg1.y + scrollSpeed * dt
	bg2.y = bg2.y + scrollSpeed * dt

	if(bg1.y - display.contentHeight/2) > display.actualContentHeight then
		bg1:translate(0,-bg1.contentHeight*2)
		end
		if(bg2.y - display.contentHeight/2 ) > display.actualContentHeight then
			bg2:translate(0,-bg2.contentHeight*2)
		end
end

local function getdeltatime()
	local temp = system.getTimer()
	local dt = (temp - runtime)/(1000/60)
	runtime = temp
	return dt
	
end

local function enterframe()
	local dt = getdeltatime()
	movebg(dt)

end
function init()
	-- body
	addscrollablebg()
	Runtime:addEventListener("enterFrame",enterframe)
end
init()