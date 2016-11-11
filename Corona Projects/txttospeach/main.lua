
-- Your code here
local widget = require("widget")
require("google-translate")

local buttonparam = {}
local buttonimg = {}
local imgGo,imgbackground,imgcheck,imgspeaker
local txtinputnumber,tmrsplash,sndpop
local cx,cy,number,i,b,x,y
buttonparam  = {
	{"0",-60,180},
	{"1",-60,120},
	{"2",0,120},
	{"3",60,120},
	{"4",-60,60},
	{"5",0,60},
	{"6",60,60},
	{"7",-60,0},
	{"8",0,0},
	{"9",60,0},
	{"b",60,180},
	{"c",0,180}

}

local function randomnumber(  )
	number = math.random(1,9999)
	reqSpeech(number,"en")
	txtinputnumber.text = ""

end

local function buttonlistener( event )
	local btnID = event.target.id
	local number = txtinputnumber.text
	local len = string.len(number)
	if(event.phase == "began")then
		event.target.alpha = 0.3
		elseif(event.phase == "moved")then
			event.target.alpha = 1
			elseif(event.target == "ended")then
			event.target.alpha = 1
			if(btnID =="c")then
				txtinputnumber.text = ""
				elseif(btnID == "b")then
					txtinputnumber.text = number:sub(1,len-1)
				else
					if(len<4)then
						txtinputnumber.text = number..btnID
					end
				end
			end
end

local function imgSpeakListener( event )
	if(event.phase == "began")then
		event.target.alpha = 0.3
		elseif(event.phase == "moved")then
			event.target.alpha = 1
			elseif(event.target == "ended")then
			event.target.alpha = 1
			reqSpeech(number,"en")
		end
end

local function imgcheckListener( event )
	if(event.phase == "began")then
		event.target.alpha = 0.3
		elseif(event.phase == "moved")then
			event.target.alpha = 1
			elseif(event.target == "ended")then
			event.target.alpha = 1
			if(txtinputnumber.text == "") then
				reqSpeech("Please enter a number ","en")
				return
			end
			if(tonumber(txtinputnumber.text) == number)then
				txtinputnumber.text = ""
				randomnumber()
			else
				reqSpeech("Wrong",en)
				txtinputnumber.text = ""
				end
			end
end

local function loadmainScreen(  )
	imgbackground = display.newImage("res/wallpaper.png",cx,cy)
	imgbackground.alpha = 0.5
	txtinputnumber = display.newText("",cx,80,"Arial",80)
	imgspeaker = display.newImage("res/speaker.png",cx-50,420)
	imgcheck = display.newImage("res/check.png",cx+50,420)
	sndpop = audio.loadSound("res/pop.wav")
	imgspeaker:addEventListener("touch",imgSpeakListener)
	imgcheck:addEventListener("touch",imgcheckListener)
	for i = 1,#buttonparam do
		b = buttonparam [i][1]
		x = buttonparam [i][2]
		y = buttonparam [i][3]
		buttonimg [i] = display.newImage("res/"..b.."png",cx+x,cy+y)
		buttonimg [i].id = b
		buttonimg [i]:addEventListener("touch",buttonlistener)
	end
	randomnumber()

end

local function imggolistener(  )
	timer.cancel(tmrsplash)
	imgbackground:removeSelf()
	imgbackground = nil
	imgGo:removeSelf()
	imgGo = nil
	loadmainScreen()
	
end

display.setDefault("background",255/255,195/255,20/255)
cx = display.contentCenterX
cy = display.contentCenterY
imgbackground = display.newImage("res/intro.png",cx,cy)
imgGo = display.newImage("res/go.png",cx,cy+100)
imgGo:addEventListener("touch",imggolistener)
tmrsplash = timer.performWithDelay(10000,imggolistener,1)
