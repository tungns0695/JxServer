Include("\\script\\global\\seasonnpc.lua")
function main()
	if tl_gettaskcourse() ~= 1 then 
		Say("Ng¬¬i kh«ng hoµn thµnh nhiÖm vô D• TÈu. Hèi lé ta sÏ mÊt GiÊy Nî §Êy")
		return 1
	end
	Task_AwardRecord()
	Task_GiveAward()
end
