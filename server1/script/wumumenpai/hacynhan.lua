function OnDeath() 
	if (GetTask(12) >= 280*256 and GetTask(12) <= 310*256 and GetLevel() >= 40) then
		if (GetTask(12) == 280*256) then
			SetTask(12,290*256)
		elseif (GetTask(12) == 290*256) then
			SetTask(12,300*256)
		elseif (GetTask(12) == 300*256) then
			SetTask(12,310*256)
		elseif (GetTask(12) == 310*256) then
			SetTask(12,320*256)
		end

		if GetTask(12) == 320*256 then
			Msg2Player("La Hi�n Th�nh �� b� ch�y. Mau quay v� g�p Thi Phong.")  
		end
	end
end 