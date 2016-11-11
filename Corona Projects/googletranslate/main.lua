
-- Your code here

local JSON = require("json")
local widget = require("widget")
local txtfield,button
local cx,cy
cx = display.contentCenterX
cy = display.contentCenterY

txtfield = native.newTextField(cx,cy-30,150,30)


function btnevent( event )

	if(event.phase == "ended")then
	if not(txtfield.text == "")then
		reqtranslate(txtfield.text,"en")
	end
end
	-- body
end

function reqtranslatelistener( event )
	if(event.phase == "ended")then
	audio.play(audio.loadSound(event.response.filename,system.DocumentsDirectory))
end
	-- body
end

function reqtranslate(text,lang)
	network.download(
		"http://translate.google.com/translate_tts?ie=UTF-8&q="..text.."&tl="..lang.."&client=tw-ob",
		"GET",
		reqtranslatelistener,
		{},
		math.random(150000)..".mp3",
		system.DocumentsDirectory

		)

end
display.setDefault("background",1,1,1)

button = widget.newButton( {
		        x = cx , y = cy+120,
		        onEvent = btnevent,
		        defaultFile = "ok.png",
		       	      width = 120,
            height = 60
		    }
		    )