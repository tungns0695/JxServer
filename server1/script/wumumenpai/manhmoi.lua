Include("\\script\\lib\\awardtemplet.lua")


function main() 
	dofile("script/wumumenpai/manhmoi.lua")
	if (GetTask(12) == 370*256 and GetLevel() >= 50) then
		Talk(3,"nvxuatsu3","B�n ��n ch� Kh�i Long s� th�c nh�ng kh�ng t�m th�y g�. Nh�ng m�nh gi�y ch�a ch�y h�t khi�n b�n ch� �","B�n tr�n c� nh�ng manh m�i m�p m�: V�...S�ch...Tay, nay...��ng b�n t�u...�i")
	end
end

function nvxuatsu3() 
	SetTask(12,380*256)
	tbAwardTemplet:GiveAwardByList({tbProp = {6,1,5098,1,0,0}, nBindState = -2}, "M�nh Gi�y Ch�y",1); 
	Msg2Player("Quay l�i t�m H�n Kh�i Ph��ng.")  
end 