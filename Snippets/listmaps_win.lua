function ku.getMapsInDir(dir,pat) 
    local i, t, popen = 0, {}, io.popen
    for map in popen('dir "'..dir..'" /B *.map'):lines() do
    	if(map:sub(-4) == ".map" and map:match(pat)) then
       	    i = i + 1
      	    t[i] = map:sub(1,-5)
      	end
    end
    return t
end