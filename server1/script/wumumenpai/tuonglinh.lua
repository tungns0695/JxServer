Include("\\script\\lib\\awardtemplet.lua")

function OnDeath() 
	if GetTask(14) == 90*256 then
		SetTask(14,100*256)
		tbAwardTemplet:GiveAwardByList({tbProp = {6,1,5100,1,0,0}, nBindState = -2}, "T��ng L�nh Th� C�p", 1);
		Msg2Player("Mang th� c�p quay v� g�p Nh�c ��nh.")  
	end
end 