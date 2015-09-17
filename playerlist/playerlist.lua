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

function ku.playerlist(id,args)
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

	for tid,ip in ipairs(tIPtemp) do
		local matches = ku.table_count(tIPtemp,ip)

		if #matches >= 2 then
			table.foreach(matches,	function(k,v) 
										tRes[v] = iMCount
										tIPtemp[v] = nil 
									end)
			iMCount = iMCount + 1
		end
	end

	for tid,val in ipairs(tPlayers) do
		
		if(tRes[tid]) then
			parse('cmsg "\169'..ku.colors.pl[tRes[tid]]..'#'..tid.."     "..player(tid,"name")..'     '..tIP[tid]..'     '..player(tid,"usgn")..' '..id..'"')
		else
			parse('cmsg "\169'..ku.colors.white..'#'..tid.."     "..player(tid,"name")..'     '..tIP[tid]..'     '..player(tid,"usgn")..' '..id..'"')
		end
	end
end