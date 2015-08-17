if not bl then bl = {} end

bl.tbanlist = {}

bl.colors =	{
			orange = '255150000',
		}

--[[
==========================================================
args : 	id     = id of requesting player
       	bType  = type of ban 
			valid : IP , USGN , NAME ( case sensitive )
==========================================================
]]

function bl.banlist(id,bType)
	bl.tbanlist.expected = true
	bl.tbanlist.ctotal = 0
	bl.tbanlist.ctype = 0
	bl.tbanlist.btype = "* "..bType
	bl.tbanlist.list = {}
	msg2(id,"Look at the console for output!")
	parse("banlist")
	print("#?#End of banlist#?#"..id)
end

function bl.loghook(line)
	if(bl.tbanlist.expected) then
		if(line:match(bl.tbanlist.btype)) then
			if(#bl.tbanlist.list >= 20) then 
				table.remove(bl.tbanlist.list,1) 
			end
			table.insert(bl.tbanlist.list,line)
			bl.tbanlist.ctype = bl.tbanlist.ctype + 1
		elseif(line:find("bans total:")) then
			if(bl.tbanlist.ctotal == 0) then
				local d = line:match("bans total: (%d*)") or ""
				if(d ~= "") then
					bl.tbanlist.ctotal = d
				end	
			end
		elseif(line:match("#?#End of banlist#?#")) then
			bl.tbanlist.expected =  nil
			local id = line:match("#?#End of banlist#?#(%d*)")

			--[[
				add your own output here
				#start
			]]

			parse('cmsg "©'..bl.colors.orange..'Total bancount : '..bl.tbanlist.ctotal..'" '..id)
			parse('cmsg "©'..bl.colors.orange..'Amount of '..bl.tbanlist.btype:sub(2)..' bans : '..bl.tbanlist.ctype..'" '..id)
			for _,v in ipairs(bl.tbanlist.list) do
				parse('cmsg "©'..bl.colors.orange..v..'" '..id)
			end

			--[[
				#end
			]]

			bl.tbanlist = {}
		end
	end
end

addhook("log","bl.loghook",99999)
