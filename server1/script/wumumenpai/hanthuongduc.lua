function main(sel)
	dofile("script/wumumenpai/hanthuongduc.lua")
	if (GetCamp() == 4 and GetLevel() >= 60 and GetTask(13) == 0) then
		Describe("H�n Th��ng ��c: Mu�n tr� th�nh �� t� k� danh c�a b�n ph�i, ph�i ��nh b�i �� t� c� t�n tu�i nh�t. Ng��i c� mu�n kh�o nghi�m kh�ng",2,"���c, ta s� �i ngay/nvkydanhdetu","�� ta suy ngh� l�i/no")
	elseif GetTask(13) == 20*256 then
		Talk(3,"nvkydanhdetu4",""..GetName()..": Ta �� v��t qua kh�o nghi�m.","H�n Th��ng ��c: Ta th�c s� kh�ng nh�n l�m ng��i, b�y gi� ng��i l� k� danh �� t� c�a b�n m�n, h�y ch�m ch� luy�n t�p.")
	else
		Talk(1,"","H�n Th��ng ��c: Khi�n s� b�o v� ���c th�n th�, c�n �ao d�ng �� t�n c�ng.")
	end
end

function nvkydanhdetu() 
SetTask(13,10*256)
Msg2Player("��n Di�n V� Tr��ng (194/191) t� th� v� c�ng.") 
end


function nvkydanhdetu4() 
SetTask(13,30*256)
AddRepute(1) 
Msg2Player("Ho�n th�nh nhi�m v� K� danh �� t�. Ng��i �� tr� th�nh �� t� k� danh V� H�n ���ng, nh�n ���c 1 �i�m danh v�ng.") 
end 