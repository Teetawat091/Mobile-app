-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- Your code here
local widget = require("widget")
local mybtn

mybtn = widget.newButton({width = 128, heigh = 128,
	onEvent = handleButtonEvent,
	defaultFile = "red.png",
	overFile = "green.png"
}
	)
display.setDefault("background",1,1,1)
mybtn.x = contentCenterX
mybtn.y = contentCenterY

