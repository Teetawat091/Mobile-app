local widget = require("widget")
local sound_a, sound_b, sound_c
local myimg

local function handleButtonEvent( event )
	local button_id = event.target.id
	if(event.phase == "ended")then
	myimg:removeSelf()
	myimg = nil
	if(button_id == "button_a")then
		audio.play(sound_a)
		myimg = display.newImage("assets/a.png")
		elseif(button_id == "button_b")then
			audio.play(sound_b)
			myimg = display.newImage("assets/b.png")
			elseif(button_id == "button_c")then
				audio.play(sound_c)
				myimg = display.newImage("assets/c.png")
			end
			myimg:translate(display.contentCenterX,100)
		end
end

local button = widget.newButton{left = 60, top = 210, 
	width = 60, height = 40,
	id = "button_a",
	lable = "A",
	onEvent = handleButtonEvent,
	shape = "Rect",
	lableColor = {default = {1,1,1} ,over = {0,0,0,0.5}},
	fillColor = {default = {0.4,.04,.04} ,over = {0.8,0.8,0.8}}
	}
	
local button = widget.newButton{left = 130, top = 210, 
	width = 60, height = 40,
	id = "button_b",
	lable = "B",
	onEvent = handleButtonEvent,
	shape = "Rect",
	lableColor = {default = {1,1,1} ,over = {0,0,0,0.5}},
	fillColor = {default = {0.4,.04,.04}, over = {0.8,0.8,0.8}}
	}
	
local button = widget.newButton{left = 300, top = 210, 
	width = 62, height = 40,
	id = "button_c",
	lable = "C",
	onEvent = handleButtonEvent,
	shape = "Rect",
	lableColor = {default = {1,1,1} ,over = {0,0,0,0.5}},
	fillColor = {default = {0.4,.04,.04}, over = {0.8,0.8,0.8}}
	}
	
display.setDefault("background",1,1,1)
sound_a = audio.loadSound("assets/a.wav")
sound_b = audio.loadSound("assets/b.wav")
sound_c = audio.loadSound("assets/c.wav")

myimg:translate(display.contentCenterX,100)
