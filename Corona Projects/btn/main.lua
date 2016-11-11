-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- Your code here

local widget  = require("widget")
local mybtn 

local function handleButtonEvent( event )

	if(event.phase == "began")then
		print("press")
	else
		print("release")
	end
	-- body
end

mybtn = widget.newButton({width = 200,height  =40,
	label = "submit",
	shape = "roundedRect",
	labelColor = {default={1,1,1}, over = {1,1,1}},
	fillColor = {default={5,0,2,0.5}, over = {0,0,0,0.8}},
	strokeColor = {default={1,1,1}, over = {1,1,1}},
	strokeWidth = 3,
	onEvent = handleButtonEvent
	}
	)

display.setDefault("background",1,1,1)
mybtn.x = display.contentCenterX
mybtn.y = display.contentCenterY