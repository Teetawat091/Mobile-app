-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- Your code here
local widget = require("widget")
local cx,cy
local btn,txtfield
local imgqr

local function btnevent(event)
	 if(event.phase == "ended")then
	if(imgqr)then
		imgqr:removeSelf()
		imgqr = nil
		end
		imgqr = display.newImage(event.response.filename,system.DocumentsDirectory)
		imgqr:translate(cx,cy)
		txtfield.text = ""
	-- body
end
end

cx = display.contentCenterX
cy = display.contentCenterY

display.setDefault("background",1,1,1)

function load (text)
text = txtfield.text
print(text)
network.download(
	"http://chart.googleapis.com/chart?cht=qr&chs=800x100&chld=H|2&chl="..text,
	"GET",
	btnevent,
	{},
	math.random(150000)..".png",
	system.DocumentsDirectory
	)
end

btn = widget.newButton({
	x = cx , y = cy+200,
	onEvent = btnevent,
	defaultFile = "ok.png"

	})

txtfield = native.newTextField(cx,cy+120,170,50)
txtfield.align = "center"

btn:addEventListener("touch",touchbtn)