function OnDeath () 
	if GetTask(12) == 340*256 and GetLevel() >= 50 then
		SetTask(12,350*256)
		NewWorld(1042,1554,3065) 
		Msg2Player("T� v� th�nh c�ng, quay v� g�p Ng�u Th�ng.")  
	end
end 