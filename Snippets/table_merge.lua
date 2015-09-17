--[[
	@param	Table 	: table to append to
	@param	Table 	: table to append
]]

function table_merge(t1,t2)
	table.foreach(t2,function(k,v) table.insert(t1,v) end)
end