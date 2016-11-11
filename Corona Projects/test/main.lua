-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- Your code here

local  myText, myText2,myText3

  

local function text1Listener( event )
	
		myText.text = "5,962,284"
end

local function text2Listener( event )
	-- body
	myText2.text = "4,851,173"
end

local function text3Listener( event )
	-- body
	myText3.text = "3,740,062"
end

myText = display.newText("Bangkok",160,240,"Arial",30)
myText2 = display.newText("Ching-mai",160,300,"Arial",30)
myText3 = display.newText("Phuket",160, 200,"Arial",30)

myText:setFillColor(1,0,0)
myText2:setFillColor(5,0,2)

myText.x = display.contentCenterX; myText.y = 120
myText2.x = display.contentCenterX; myText2.y = 160
myText3.x = display.contentCenterX; myText3.y = 200

myText:addEventListener("touch",text1Listener)
myText2:addEventListener("touch",text2Listener)
myText3:addEventListener("touch",text3Listener)


