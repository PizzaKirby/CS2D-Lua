function ku.getRandomColor()
	local r,g,b = ""..math.random(0,255),""..math.random(0,255),""..math.random(0,255)
	r,g,b = string.rep("0",3-r:len())..r,string.rep("0",3-g:len())..g,string.rep("0",3-b:len())..b
	return r..g..b
end