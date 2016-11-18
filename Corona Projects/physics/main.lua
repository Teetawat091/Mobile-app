-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- Your code here
local physics = require("physics")

local function ballevent(event)

if(event.phase == "began") then
event.target:removeSelf()
end
end

local function ballenterframe(self)
	local x = self.x
	local y = self.y
	if(x==nil or y == nil)then
	return
	end
	if(x<-20 or x>500 or y<- 50 or y>350)then
	print("remove(out of screen)..."..tostring(self)
	Runtime:removeEventListener("enterframe",self)
	self:removeSelf()
	end
end

local function loadBall()

local x = math.random(30,450)
local ball

local r = math.random(1,255)/255
local g = math.random(1,255)/255
local b = math.random(1,255)/255

local readius = math.random(10,30)
ball = display.newCircle(x,350,readius)
ball:setFillColor(r,g,b)
ball:addEventListener("touch",ballevent)

physics.setGravity(0,-3)
physics.addBody(ball,"dynamic")

Runtime:addEventListener("enterframe",ballenterframe)

end



physics.start()
timer.performWithDelay(300,loadBall,0)
