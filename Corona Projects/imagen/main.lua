-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- Your code here
local myImage 
local cclick 
local function loadImageListener(event)
	-- body

	if(event.isError or event.status ~=200)then

		print("Error loading...",event.status)

	else
		myImage = display.newImage(event.response.filename,
			event.response.baseDirectory,
			display.counterCenterX,
			100)
		end

end

local params = {}


local clickText = display.newText("Click",160,240,"Arial",30)
clickText:setFillColor(1,0,0)

local function Clickt(event)
	-- body

if(cclick == false)then
	x = math.random(1,230)

	clickText.text = x

	display.setDefault("background",1,1,1)
    network.download("http://cs.pkru.ac.th/app/flag/"..x..".png",
	"GET",
	loadImageListener,
	params,
	"flags.png",
	system.TemporaryDirectory
	)
	cclick = true

else cclick = false
end

	
end



clickText:addEventListener("touch",Clickt)