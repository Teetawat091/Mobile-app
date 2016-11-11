local widget = require("widget")
local img1,img2
local group1 , group2 ,activegroup
local textq , texta ,btnok
local x,y,z,op,theanswer,answer
local cx,cy
local txttrue,txtfalse,countt,countf
local backgroundimg, soundcorrect , soundwrong , bgsound
local imgsheet ,imgsprite
local sheetdata,spritedata
local score = 0
local scoretxt

sheetdata = {
width = 127,
height = 222,
numFrames = 5

}
 spritedata = {
 name = "walk1",
 start = 1,
 count = 5,
 time = 500,
 loopcount = 0,
 loopDirection = "forward"
}

display.setStatusBar(display.HiddenStatusBar)

screenw = 570
screenh = 320
imgw = 800
imgh = 600
speed = 3

background1 = display.newImageRect("bg1.png",imgw,imgh)
background1.x = screenw / 2
background1.y = screenh / 2
background2 = display.newImageRect("bg1.png",imgw,imgh)
background2.x = 1080
background2.y = screenh / 2

cx = display.contentCenterX 
cy = display.contentCenterY 

soundwrong = audio.loadSound("wrong.mp3") 
soundcorrect = audio.loadSound("correct.mp3")
bgsound = audio.loadSound("bgsound.mp3")

local function hidetoast()
	activegrb.isVisible = false

	group3.isVisible = true
	texta.isVisible = true

	-- body
end
local function showtoast()
	activegrb.isVisible = true

	group3.isVisible = false
	texta.isVisible = false
	-- body
end

local function toast( obj )
	activegrb = obj
	showtoast()
	timer.performWithDelay(500,hidetoast,1);

end

local function loadimg()
	img1 = display.newImage("wrong.png",cx,180)
	img2 = display.newImage("right.png",cx,180)

	group1 = display.newGroup()
	group2 = display.newGroup()
	group3 = display.newGroup()

	group1:insert(img1)
	group2:insert(img2)

	group3:insert(textq)
	group3:insert(btnok)

	group1.isVisible = false
	group2.isVisible = false
	group3.isVisible = true
end

local function scrollbg2( event )
	background1.x = background1.x + speed
	background2.x = background2.x + speed
	if(background1.x)> 480 then
		background1.x = 300
	end
	if(background2.x)> 500 then
		background2.x = 1060
	end
	-- body
end

local function randomq(  )

	x = math.random(1,9)
	y = math.random(1,9)
	op = math.random(1,3)

	if(op == 1)then

		question = x.."+"..y
		theanswer = x+y

		elseif(op == 2 ) then

			question = x.."-"..y
			theanswer = x-y

		else

			question = x.."x"..y
			theanswer = x*y

		end
	
	textq.text = question

end


 local function btnevent( event )

	if(event.phase == "ended")then

	answer = tonumber(texta.text)


	if(answer == theanswer)then

		toast(group2)

		imgsprite.xScale = 1

		score = score+1
		imgsprite.x = imgsprite.x+5
		Runtime:addEventListener("enterFrame",scrollbg)


		--scoretxt = display.newText("Score :"..score,cx+130,50,"KBAStitchInTime",30)

		audio.play(soundcorrect)
		

		

	else

		toast(group1)

		imgsprite.xScale = -1

		imgsprite.x = imgsprite.x-5

		Runtime:addEventListener("enterFrame",scrollbg2)


		--scoretxt = display.newText("Score :"..score,cx+130,50,"KBAStitchInTime",30)

		audio.play(soundwrong)
	end


	randomq()

end
	
end

local function scrollbg( event )
	background1.x = background1.x - speed
	background2.x = background2.x - speed
	if(background1.x)< -530 then
		background1.x = 1060	
	end
	if(background2.x)< -530 then
		background2.x = 1060
	end
	-- body
end


textq = display.newText("9+9",cx,130,"KBAStitchInTime",50)
textq:setFillColor(5,0,2)

texta = native.newTextField(cx,200,120,40)
texta.align = "center"

imgsheet = graphics.newImageSheet("bob.png",sheetdata)
imgsprite = display.newSprite(imgsheet,spritedata)

imgsprite.x = 50
imgsprite.y = 200

imgsprite:play()

btnok = widget.newButton({
	x = cx , y = 270,
	onEvent = btnevent,
	defaultFile = "ok.png"

	})

audio.play(bgsound)
Runtime:addEventListener("enterFrame",scrollbg)
loadimg()

--randomq()

