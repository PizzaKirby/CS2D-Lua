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

rs.radiomsg = 	{
					[0] = "Affirmative!",
					[1] = "Need backup!",
					[2] = "Get out of there she's gonna blow!",
					[5] = "Sector clear!",
					[6] = "Cover me!",
					[8]	= "Enemy down!",
					[9]	= "Enemy spotted!",
					[10]= "Team fall back!",
					[11]= "Taking fire, need assistance!",
					[13]= "Follow me!",
					[14]= "Get in position and wait for my go!",
					[15]= "Go, go, go!",
					[17]= "I'm in position!",
					[22]= "Negative!",
					[23]= "Hold this position!",
					[24]= "Regroup team!",
					[25]= "Report in, team!",
					[26]= "Reporting in!",
					[28]= "Roger that!",
					[30]= "Stick together team!",
					[31]= "Storm the front!",
					[32]= "You take the point!"
				}
function rs.radio(src,message)
	--fetch every id you wanna send it to
    ids = {1}
	--
	for id,_ in ipairs(ids) do
		if( player(id,"team") ~= player(src,"team") ) then
			msg2(id,"©"..rs.colors.teams[player(src,"team")]..player(src,"name").."©"..rs.colors.standard.." (Radio): "..rs.radiomsg[message])
		end
	end
end

addhook("radio","rs.radio",99999)