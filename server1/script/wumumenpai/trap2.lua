function main(sel)
	if GetTask(14) == 10*256 and GetLevel() >= 90 then
		Talk(2,"nv9x2","Th� ra l� m�t c�i b�y, gi�t h�t b�n ch�ng v� tho�t kh�i v�ng v�y")
	end
end;

function nv9x2() 
	SetTask(14,20*256)
	Msg2Player("Gi�t h�t b�n qu�n Kim.")  
end 