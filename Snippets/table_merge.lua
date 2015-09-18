--[[
	@param	Table 	: table to append to
	@param	Table 	: table to append
]]

--pre 5.2
function table_merge(t1,t2)
	table.foreach(t2,function(k,v) table.insert(t1,v) end)
end

--5.2
function table_merge2(t1,t2)
	for k,v in ipairs(t2) do
		table.insert(t1,v)
	end
end