if not pl then pl = {} end

pl.colors = {

			default = '255255255',
			standard = '255220000',

			err = '255000050',
			succ = '000255050',
			std = '255255255',
			help = '111255111',
			chatspy = '050200100',
			info = '050100150',

			red = '255000000',
			green = '000255000',
			blue = '000000255',
			orange = '255150000',
			white = '255255255',
			black = '000000000',

			teams = {
						[0] = '255220000',
						[1] = '255025000',
						[2] = '050150255',
						[3] = '050150255' 
					}

			}


function pl.table_count(t, item)
	local ret = {}
  	for i,v in pairs(t) do
  		if item == v then table.insert(ret,i) end
    end
    return ret
end

function pl.playerlist(id)

	msg2(id,"See console for output!")

	local plt = player(0,"table")
	local ipt = {}
	local ips = {}

	for _,p in ipairs(plt) do
		local ip = player(p,"ip")
		ipt[p] = ip
	end

	for ind,i in ipairs(ipt) do
		local matches = pl.table_count(ipt,i)
		if(#matches >= 2) then 
			for _,id in ipairs(matches) do
				ips[id] = '©'..pl.colors.red..i..'©'..pl.colors.white
				ipt[id] = nil
			end
		else
			ips[ind] = i
		end
	end

	for _,p in ipairs(plt) do
		local str = 'cmsg "©255255255#'..p..' -> Name : '..player(p,"name")
		str = str..string.format("%45s","IP : "..ips[p])
		str = str..string.format("%30s","USGN : "..player(p,'usgn')..'" '..id)
		parse(str)
	end
end