function main() 
	dofile("script/wumumenpai/thithe.lua")
	if (GetTask(12) == 400*256 and GetLevel() >= 50)  then
		Talk(3,"nvxuatsu7","Y ph�c n�y r�t gi�ng c�a H� Tr�y...nh�ng khu�n m�t �� b� h�y ho�i kh�ng th� nh�n r�","Nh�n qua Thi Th� t�nh c� t�m th�y manh m�i �� l�i, n� ch� ��n Long Cung ��ng.")
	else
		Talk(1,"","Thi Th�:... ...")
	end
end

function nvxuatsu7() 
SetTask(12,410*256) 
Msg2Player("��n <color=yellow>Long Cung ��ng (197/187)<color> T�m V� M�c Di Th�.")  
end 