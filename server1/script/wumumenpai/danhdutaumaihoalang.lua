function OnDeath () 
	if GetTask(12) == 90*256 and GetLevel() >= 20 then
		SetTask(12,100*256)
		Msg2Player("Quay l�i g�p C�t Khang.") 
		AddNote("Quay l�i g�p C�t Khang.")
		Talk(1,"","Du T�u M�i H�a Lang: Xin h�y tha cho ta, ta s� kh�ng bao gi� d�m n�a!")
	end
	local npcindex = AddNpc(2484, 1, SubWorldID2Idx(179), 1875*32, 2636*32, 1, "Th��ng gia");
	SetNpcScript(npcindex, "\\script\\wumumenpai\\dutaumaihoalang.lua")
end 