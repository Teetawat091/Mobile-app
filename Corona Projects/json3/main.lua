
local JSON = require("json")
local translate, encoded, key


local function loadJSON2Table(filename)
	local path, file,contents
	path = system.pathForFile(filename,system.DocumentsDirectory)
	file = io.open(path, "r")
	if(file) then
		contents = file:read("*a")
		io.close(file)
		return contents
	end
	return nil
end

local function networkListener(event)
	if(event.isError) then

		print("Download failed...")
		elseif (event.phase == "ended") then
		print("Saved" .. event.response.filename)
		translate = JSON.decode(loadJSON2Table("translate.json"))
		print(translate["text"][1])
	end
end
network.download(
	"https://translate.yandex.net/api/v1.5/tr.json/translate?key=trnsl.1.1.20160927T113243Z.2070f1d64ef6bfc1.6faa34dfcae61d5fcb95d7fadd816ccac86aad24&text=hello&lang=en-th",
	"GET",
	networkListener,
	{},
	"translate.json",
	system.DocumentsDirectory
	)local JSON = require("json")
local translate, encoded, key


local function loadJSON2Table(filename)
	local path, file,contents
	path = system.pathForFile(filename,system.DocumentsDirectory)
	file = io.open(path, "r")
	if(file) then
		contents = file:read("*a")
		io.close(file)
		return contents
	end
	return nil
end

local function networkListener(event)
	if(event.isError) then

		print("Download failed...")
		elseif (event.phase == "ended") then
		print("Saved" .. event.response.filename)
		translate = JSON.decode(loadJSON2Table("translate.json"))
		print(translate["text"][1])
	end
end
network.download(
	"https://translate.yandex.net/api/v1.5/tr.json/translate?key=trnsl.1.1.20160927T113243Z.2070f1d64ef6bfc1.6faa34dfcae61d5fcb95d7fadd816ccac86aad24&text=hello&lang=en-th",
	"GET",
	networkListener,
	{},
	"translate.json",
	system.DocumentsDirectory
	)