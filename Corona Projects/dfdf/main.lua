-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- Your code here
local JSON = require("json")
local person , encode

person = {
	["fname"] = "Jonathan",
	["lname"] = "Kuanniang",
	["dept"] = "001",
	["salary"] = 15000,
	["bio"] = {"B",75,168,"left"}
}

encode = JSON.encode(person,{indent = true})
print(encode)
