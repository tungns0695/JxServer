MONEY_ADDLIFETIME = 1000000

function Checkup()
	-- 因为通过使用物品增加聊天室时间，检查金钱的代码放到\\item\\chatroom\\pay.lua中
	return 1
end

function Consume()
	if (DelCommonItem(6,1,1062) == 1) then
		Msg2Player("<#><color=green>Th猰 gi� th祅h c玭g<color>!")
		return 1
	end
	return 0
end
