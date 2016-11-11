-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- Your code here


local JSON = require("json")
local widget = require("widget")
local cx,cy
local button,textfield

local function sentext(event)

	local param = {}
	local header = {}

	if(event.phase == "ended")then

	param.header = header
	param.body = "text="..textfield.text.."&lang=en"

	header["Content-Type"] = "application/x-www-form-urlencoded; charset=UTF-8"
	header["Accept-Language"] = "th-US"
	header["Referer"] = "http://soundoftext.com"

	network.request(
	"http://soundoftext.com/sounds",
	"POST",
	reqspeechlistener,
	param
	)

end
	-- body
end

local function reqmp3Listener( event )
	if(event.isError)then
		print("download fail")
		elseif(event.phase == "ended")then
		print("save"..event.response.filename)
	end
	-- body
end

function reqspeechlistener( event )
	local id

	id = JSON.decode(event.response)["id"]
	print(id)
	network.request(
		"http://soundoftext.com/sounds/"..id,
		"GET",
		requrlDownload,
		{}
		)
	-- body
end

local function playsound(text)
	local sound
	audio.loadSound(text)
	audio.play(sound)
	-- body
end

function requrlDownload( event )
	local resp,path
	local filemp3name
	
	filemp3name = math.random(1,1000)

	if(filemp3name)then
		filemp3name = math.random(1,1000)
	end

	resp = event.response
	print(resp)

	if not(event.isError)then
	path = string.match(resp,"<source src=\"(.-)\"")
	print(path)

	network.download(
		"http://soundoftext.com"..path,
		"GET",
		reqmp3Listener,
		{},
		filemp3name..".mp3",
		system.DocumentsDirectory,
		playsound(filemp3name.."mp3")
		
		)
	
end
	-- body
end

cx = display.contentCenterX
cy = display.contentCenterY

display.setDefault("background", 1, 1, 1)

button = widget.newButton( {
		        x = cx , y = cy+120,
		        onEvent = buttonEvent,
		        defaultFile = "send.jpg",
		       	      width = 120,
            height = 60
		    }
		    )

textfield = native.newTextField(cx, cy, 150, 40 )
textfield.align = "center"

button:addEventListener("touch",sentext)