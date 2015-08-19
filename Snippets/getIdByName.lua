--[[
	@param	String  : pattern to search for
	@ret 	Integer : single id or nil
	@ret 	String  : error message or nil		
]]

function ku.get_idByName(name)
	name = name:lower()
	local ret = {}
	local ptable = player(0,"table")
	for id,_ in ipairs(ptable) do
		if(string.match(player(id,"name"):lower(),name)) then
			table.insert(ret,id)
		end
	end
	if(not ret[1]) then
		return nil,"No match!"
	end
	if (#ret > 1) then
		return nil,"Multiple matches!"
	end
	return ret[1],nil
end