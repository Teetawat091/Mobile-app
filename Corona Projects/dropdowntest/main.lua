local widget = require( "widget" )


-- Create two tables to hold data for days and years      
local days = {}
local years = {}

-- Populate the "days" table
for d = 1, 31 do
    days[d] = d
end

-- Populate the "years" table
for y = 1, 48 do
    years[y] = 1969 + y
end

-- Configure the picker wheel columns
local columnData = 
{
    -- Months
    { 
        align = "right",
        width = 140,
        startIndex = 5,
        labels = { "January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December" }
    },
    -- Days
    {
        align = "center",
        width = 60,
        startIndex = 18,
        labels = days
    },
    -- Years
    {
        align = "center",
        width = 80,
        startIndex = 10,
        labels = years
    }
}

-- Create the widget
local pickerWheel = widget.newPickerWheel(
    {
        top = display.contentHeight - 222,
        columns = columnData
    }
)
function showlang()

    local values = pickerWheel:getValues()

-- Get the value for each column in the wheel (by column index)
local from = values[1].value
local sign = values[2].value
local to = values[3].value

print( from, sign, to )
    -- body
end

showlang()
-- Get the table of current values for all columns
-- This can be performed on a button tap, timer execution, or other event
