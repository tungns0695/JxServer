
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\dailogsys\\dailogsay.lua")
function main(sel)
	if (GetTask(69) == 13)  or GetLastFactionNumber() == 12 then
		Say("Ki�m ��ng: � ��y c� r�t nhi�u th�n binh l�i kh�, ng��i c� mu�n m�t m�n kh�ng?", 2,"Giao d�ch/yes", "Kh�ng giao d�ch/no");
	else 
	Talk(1,"","Ki�m ��ng: Ch��ng m�n c� l�nh, binh kh� b�n ph�i ch� b�n cho ��ng m�n.")	
	end
end;


function yes()
	Sale(1);  			
end;


function no()
end;
