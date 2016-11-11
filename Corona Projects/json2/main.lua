-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- Your code here
local JSON = require("json")
local person, encode, key

local path, file , content

path = system.pathForFile("person.json",system.ResourceDirectory)
file = io.open(path, "r")

if(file)then
	content = file:read("*a")
	io.close(file)
end 

print(content)
person = JSON.decode(content)
print(person)