if not vp then vp = {} end

vp.ALLOW_MULTIPLE_VOTES_BY_SAME_IP = false
vp.DEFAULT_KICK_RATIO = game("mp_kickpercent")

function vp.vote(src,mode,id)
	if(mode == 1) then

		--if(player(id,"bot")) then return end

		id = tonumber(id)

		if(not ALLOW_MULTIPLE_VOTES_BY_SAME_IP) then
			for _,p in ipairs(player(0,"table")) do
				if( ( player(p,"ip") == player(src,"ip") ) and ( player(p,"votekick") == id ) ) then parse("mp_kickpercent 0.0") timer(20,"vp.reset") end
			end
		end
	end
end

function vp.reset()
	parse("mp_kickpercent "..vp.DEFAULT_KICK_RATIO)
end

addhook("vote","vp.vote",99999)