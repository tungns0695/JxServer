function main(sel)
	if (GetLastFactionNumber() == 11 or GetTask(13) >= 30*256) then 
		Say("D� ��i Ch�y: �� thi ��u trong ��u tr��ng, v� kh� l� m�t th� kh�ng th� thi�u.", 2,"Giao d�ch/yes", "Ta c� vi�c kh�c/no")
	else
		Say("D� ��i Ch�y: Ch��ng M�n c� l�nh c�c �� t� b�n m�n kh�ng ���c cung c�p v� kh� cho ng��i ngo�i!")
	end
end;

function yes()
Sale(37)			
end;


function no()
end;
