function main() 
	if (GetTask(14) == 80*256) then
		Talk(3,"nv9x6","�� t� kh� nghi: A! �� ta n�i cho ng��i bi�t tin t�c c�a Kim t��ng qu�n, ng��i ��ng gi�t ta, h�n �ang � Ph�c Ng�u S�n ��ng.","�� t� kh� nghi: Ng��i s� cho ta 1 con ���ng s�ng ph�i kh�ng?")
	end
end

function nv9x6()
	SetTask(14,90*256)
	Msg2Player("��n Ph�c Ng�u S�n ��ng (228/214) ti�u di�t T��ng qu�n Kim.")  
end