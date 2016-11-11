-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- Your code here

s = "thai lao singapore"
words = {}

for word in s:gmatch("%w+")do
table.insert(words,word)
end

for i = 1, #words do

print(words[i])
end

alert = native.showAlert(
"Test-split-words",
"ข้อความที่ถูกแบ่ง",
words,
showalertListener
)

function showalertListener (event)

if(event.action == "clicked")then
print(event.index)
print(words[event.index])
end
end

