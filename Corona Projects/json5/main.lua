-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- Your code here
local JSON = require("json")
local cx,cy
local temp , name , main, desc
local resp
local icon,imgicon
local dynamicbg
local descc
local back,forward



local function goforward( event )
	if(event.phase == "ended")then
	id = (id% #privinceID)+1
	loadweather()
end

end

local function gobackward( event )
	if(event.phase == "ended")then
	id = (id% #privinceID)+1
	id = id-2
	if(id == 0)then
		id = 5
	end
	loadweather()
end

end

 function loadweather()

	local cid = privinceID[id]
	local req = "http://api.openweathermap.org/data/2.5/weather?id="..cid.."&appid=ead8030f186ab26794d455eb5fef5f68&units=metric"
	
	network.request(
	req,
	"GET",
	handlerequest
	)
	-- body
end

 function handlerequest( event )


	-- body
	if not(event.isError)then
		resp = JSON.decode(event.response)
		name.text = resp["name"]
		temp.text = resp["main"]["temp"].."°C"
		main.text = resp["weather"][1]["main"]
		desc.text = resp["weather"][1]["description"]
		icon = resp["weather"][1]["icon"]

	end
		if(imgicon)then
			imgicon:removeSelf()
			imgicon = nil
		end
			imgicon = display.newImage("image/"..icon..".png",cx,380)
			imgicon:scale(2,2)

end

display.setDefault("background",0.3,0.3,0.3)
dynamicbg = display.newImage("dynamicbg/sunny.jpg",0,0)

cx = display.contentCenterX
cy = display.contentCenterY

back = display.newImage("back.png",cx-110,30)
forward = display.newImage("forward.png",cx+110,30)

privinceID = {"6540662","7291924","1790413","2410048","3428577"}
id = 1

name = display.newText("",cx,30,"ANGEL___",75)
name:setFillColor(0,0,0)
temp = display.newText("",cx,130,"Arial",75)
temp:setFillColor(0,0,0)
main = display.newText("",cx,260,"Arial",40)
main:setFillColor(0,0,0)
desc = display.newText("",cx,300,"Arial",25)
desc:setFillColor(0,0,0)

back:addEventListener("touch",gobackward)
forward:addEventListener("touch",goforward)
loadweather()