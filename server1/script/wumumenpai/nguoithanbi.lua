Include("\\script\\lib\\awardtemplet.lua")

function OnDeath () 
	if GetTask(12) == 420*256 and GetLevel() >= 50 then
		SetTask(12,430*256)
		tbAwardTemplet:GiveAwardByList({tbProp={6,1,5099,1,0,0},nCount=1,nBindState = -2},"V� M�c Di Th�")
		Talk(1,"","�� l�y ���c V� M�c Di Th�, quay v� t�m <color=yellow>Nh�c L�i<color>")
		Msg2Player("L�y ���c V� M�c Di Th�, quay v� g�p Ch��ng M�n Nh�c L�i.")  
	end
end 
