function OnDeath() 
	if (GetTask(14) == 20*256) then
		SetTask(14,30*256)
	elseif (GetTask(14) == 30*256) then
		SetTask(14,40*256)
	elseif (GetTask(14) == 40*256) then
		SetTask(14,50*256)
	elseif (GetTask(14) == 50*256) then
		SetTask(14,60*256)
	end
	if (GetTask(14) == 60*256) then
		Msg2Player("Quay v� b�o c�o v�i Nh�c ��nh.")  
	end 
end