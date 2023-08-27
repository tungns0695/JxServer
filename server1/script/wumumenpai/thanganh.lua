---------------------------------------------
function main()
dofile("script/wumumenpai/thanganh.lua")
	if (GetTask(12) == 110*256) and GetLevel() >= 30 then
		Describe("Thang Anh: B�n ta v�a ti�u di�t c�c ��n v� c� gi�i v� c� s� c�a ��ch, ta c�n c�c �� t� �i thu h�i nh�ng v�t t�. C�c h� c� gi�p ta ���c kh�ng?",2,"Ta s� �i ngay/nx3x1","Xin l�i, ta c� vi�c kh�c/no")
	elseif GetTask(12) == 170*256 and GetLevel() >= 30 then 
		Talk(3,"nx3x2",""..GetName()..": T�t c� v�t t� �� ���c thu h�i, xin h�y ki�m tra l�i.","Thang Anh: T�t, nh�ng hi�n t�i c� m�t s� �� t� �ang b� th��ng n�ng. Ng��i h�y mau �i thu th�p d��c li�u tr� th��ng!")	
	elseif GetTask(12) == 250*256 and GetLevel() >= 30 then 
		Talk(3,"nx3x4",""..GetName()..": M�t s� �� t� b� th��ng �� ���c ch�a tr�, v�n c�n r�t nhi�u �� t� kh�c �ang ch� ��n l��t, c� v� Y S� h�i gi� y�u m�t ch�t.","Thang Anh: Haiz! L�o Th�n y �� l�n tu�i r�i, n�n ph�i t�m th�m ng��i m�i th�i. L�n n�y ng��i l�m t�t l�m, ��y l� ph�n th��ng d�nh cho ng��i.")	
	else
		Talk(1,"","Thang Anh: C� chuy�n t�t th� ��ng qu�n ta nh�!")	
	end
end

function nx3x1() 
	SetTask(12,120*256)
	--NewWorld(92, 1758, 3140)
	--SetFightState(1)
	Msg2Player("��n Th�c C��ng S�n (219/196),(221/186),(227/187),(226/194),(237/192),(237/196) �� thu h�i v�t t�.") 
end 

function nx3x2() 
	ConsumeEquiproomItem(5,6,1,5095,-1)
	SetTask(12,180*256)
	--NewWorld(195, 721, 2905)
	--SetFightState(1)
	Msg2Player("Giao v�t t� th�nh c�ng, ��n Nh�n ��ng S�n (90/181),(87/184),(82/187),(76/185) �� h�i thu�c.") 
end 

function nx3x4() 
	SetTask(12,260*256)
	SetRank(93)
	AddMagic(1977)
	AddMagic(1965)
	Msg2Player("Ho�n th�nh nhi�m v� c�p 30. H�c ���c <color=yellow>H�m S�n K�ch<color> v� <color=yellow>Th�nh Anh �� Nhu� L�<color>") 
end 