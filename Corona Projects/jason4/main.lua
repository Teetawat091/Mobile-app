
local widget = require("widget")
local JSON = require("json")
local cx, cy, txtTranslate, txfWord, button
local translate



local tosign = {"-"}
local to = {"en","th","ja","fr","zh"}

-- Configure the picker wheel columns
local columnData = 
{
    -- Months
    { 
        align = "left",
        width = 100,
        startIndex = 1,
        labels = { "th","en" }
    },
    -- Days
    {
        align = "left",
        width = 60,
        startIndex = 1,
        labels = tosign
    },
    -- Years
    {
        align = "right",
        width = 100,
        startIndex = 1,
        labels = to
    }
}

-- Create the widget
local pickerWheel = widget.newPickerWheel(
    {
        top = display.contentHeight - 122,
        columns = columnData
    }
)



function showlang()
local values = pickerWheel:getValues()

-- Get the value for each column in the wheel (by column index)
local from = values[1].value
local sign = values[2].value
local to = values[3].value

local fst  = from..sign..to

print( from,sign,to)
    -- body
end

showlang()
-- Get the table of current values for all columns
-- This can be performed on a button tap, timer execution, or other event



local function JSONFile2Table(filename)
    local path, file, contents
    path = system.pathForFile(filename, system.DocumentsDirectory)
    file = io.open(path, "r")
    if (file) then
        contents = file:read("*a")        
        io.close(file)
        return contents
    end
    return nil
end

local function loadJSONListener(event)
    if (event.isError) then
        print("Download failed...")
    elseif (event.phase == "ended") then
        print("Saved " .. event.response.filename)
        translate = JSON.decode(JSONFile2Table("translate.json"))
        txtTranslate.text = translate["text"][1]
    end
end

local function doTranslate(word)

    local values = pickerWheel:getValues()

-- Get the value for each column in the wheel (by column index)
local from = values[1].value
local sign = values[2].value
local to = values[3].value

local fst  = from..sign..to

print(fst)


    local link = "https://translate.yandex.net/api/v1.5/tr.json/translate?key=trnsl.1.1.20160927T025338Z.68dd354dfe623f89.15aa3c6fd8f24a9360a250e3d898bc5ccbfe2951&text=" .. word .. "&lang="..fst
    network.download(
        link,
        "GET",
        loadJSONListener,
        {},
        "translate.json",
        system.DocumentsDirectory
    )
    print(link)

end

local function buttonEvent(event)
    if (event.phase == "ended") then

    --showlang()


    --local values = pickerWheel:getValues()
   
     doTranslate(txfWord.text)
    end
end

display.setDefault("background", 1, 1, 1)

cx = display.contentCenterX
cy = display.contentCenterY
txtTranslate = display.newText("Enter word", cx, 130,"Wicked Mouse Demo", 30)
txtTranslate:setFillColor(0)
txfWord = native.newTextField(cx, 200, 200, 40)
txfWord.align = "center"

button = widget.newButton(
    {
        x = cx, y = 280,
        onEvent = buttonEvent,
        defaultFile = "check.png",        
    }
)