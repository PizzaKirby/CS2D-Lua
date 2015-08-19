if not rs then rs = {} end

rs.colors = {
			
			standard = '255220000',

			teams = {
						[0] = '255220000',
						[1] = '255025000',
						[2] = '050150255',
						[3] = '050150255' 
					}
			}

function rs.radio(src,message)
	--fetch every id you wanna send it to and store it in 'ids'
    ids = {1}
	--
	for id,_ in ipairs(ids) do
		if( player(id,"team") ~= player(src,"team") ) then
			msg2(id,"©"..rs.colors.teams[player(src,"team")].."#"..src.." | "..player(src,"name").." (Radio)")
		end
	end
end

addhook("radio","rs.radio",99999)