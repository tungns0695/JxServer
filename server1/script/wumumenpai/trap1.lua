function main(sel)
	if GetTask(12) == 410*256 and GetLevel() >= 50 then
		Talk(6,"nvxuatsu8","Ng��i th�n b�: T�i sao ng��i l�i ��n mu�n nh� v�y?","H� Tr�y: V� M�c Di Th� l� g�? Ng��i t��ng c� th� d� d�ng l�y ���c hay sao?.","Ng��i th�n b�: �!Xong ch�a?","H� T�y: �� l� �i�u ���ng nhi�n. Ta �� l�a H�n Kh�i Long ��n b�n t�u r�i gi�t ch�t h�n �� c��p l�y V� M�c Di Th�, c�ng �� tr�o ��i trang ph�c v� h�y di�n m�o h�n. Ng��i trong ���ng s� ngh� r�ng ta �� ch�t, v� cho r�ng h�n ��nh c�p V� M�c Di Th�, haha.","Ng��i th�n b�: C� k� theo d�i! L� aiiiii...???")
	end
end;

function nvxuatsu8() 
	SetTask(12,420*256)
	Msg2Player("Ti�u di�t Ng��i th�n b� v� ph�n ��.")  
end 