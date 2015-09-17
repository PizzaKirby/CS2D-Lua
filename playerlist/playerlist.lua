if not pl then pl = {} end

pl.colors = {

			white = '255255255',
			pl = 	{
						[1] = '222019019',
						[2] = '037059220',
						[3] = '017017128',
						[4] = '225033182',
						[5] = '191015015',
						[6] = '083019215',
						[7] = '179220037'
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
	local tPlayers = player(0,"table")
	local tIP = {}
	local tIPtemp = {}
	local tRes = {}
	local iMCount = 1

	for _,p in ipairs(tPlayers) do
		local ip = player(p,"ip")
		tIP[p] = ip
		tIPtemp[p] = ip
	end

	for iid,ip in ipairs(tIPtemp) do
		local matches = ku.table_count(tIPtemp,ip)

		if #matches >= 2 then
			for k,v in ipairs(matches) do
				tRes[v] = iMCount
				tIPtemp[v] = nil 
			end
			iMCount = iMCount + 1
		end
	end

	for iid,val in ipairs(tPlayers) do
		
		if(tRes[iid]) then
			parse('cmsg "\169'..ku.colors.pl[tRes[iid]]..'#'..iid.."     "..player(iid,"name")..'     '..tIP[iid]..'     '..player(iid,"usgn")..'" '..id)
		else
			parse('cmsg "\169'..ku.colors.white..'#'..iid.."     "..player(iid,"name")..'     '..tIP[iid]..'     '..player(iid,"usgn")..'" '..id)
		end
	end
end