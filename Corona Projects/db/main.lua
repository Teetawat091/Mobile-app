-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- Your code here
local sqlite = require("sqlite3")
local path,db,staff
local sql,i

path = system.pathForFile("data.db",system.DocumentsDirectory)

db = sqlite.open(path)



db:exec([[CREATE TABLE personal (
	id INTEGER PRIMARY KEY AUTOINCREMENT,
	fname TEXT,
	lname TEXT,
	gender TEXT,
	pos TEXT,
	salary NUMERIC,
	tel TEXT
	);
]]
)
staff = {
	{
	fname = "cc",
	lname = "pp",
	gender = "man",
	pos = "gamer",
	salary = 10000,
	tel = "0101000111"
},
{
	fname = "yy",
	lname = "mm",
	gender = "woman",
	pos = "manager",
	salary = 20000,
	tel = "0111000111"
}

}
for i = 1 , #staff do

	local fname , lname,gender,pos,salary,tel

	fname = staff[i].fname
	lname = staff[i].lname
	gender = staff[i].gender
	pos = staff[i].pos
	salary = staff[i].salary
	tel = staff[i].tel

sql =	"INSERT INTO personal VALUES(".."NULL,'"..fname.."','"..lname.."','"..gender.."','"..pos.."',"..salary..",'"..tel.."');"

db:exec(sql)
	end
print(string.rep("-",60))
for row in db:nrows("SELECT * FROM personal;")do
	print(row.id.."-"..row.fname.."-"..row.lname.."-"..row.gender.."-"..row.pos.."-"..row.salary.."-",row.tel)
end
print(string.rep("-",60))
