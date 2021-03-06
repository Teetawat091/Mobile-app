-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- Your code here
local widget = require("widget")
local mysong
mysong = audio.loadSound("song.wav")


local myimg1,myimg2
local cx,cy
cx = contentCenterX
cy = contentCenterY


local function imageEventHandler( event )

	if(event.phase == "ended")then

	if(myimg1.isVisible)then

		myimg1.isVisible = false

		myimg2.isVisible = true

	else

		myimg1.isVisible = true
		audio.play(mysong,{loop = -1})
		myimg2.isVisible = false
	end
end

end



display.setDefault("background",1,1,1)

myimg1 = display.newImage("pause.png")
myimg2 = display.newImage("play.png")

myimg1:addEventListener("touch",imageEventHandler)
myimg2:addEventListener("touch",imageEventHandler)

myimg1.x = cx
 myimg1.y = cy
myimg2.x = cx
 myimg2.y = cy

myimg1.isVisible = false

