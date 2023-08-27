Include("\\script\\lib\\awardtemplet.lua")

------------------------------------------------
function main()
dofile("script/wumumenpai/nhacdinh.lua")
	if (GetTask(13) >= 30*256 and GetLevel() >= 90 and GetRepute() >= 240 and GetLastFactionNumber() == 11 and GetTask(14) == 0) then
		Describe("Nh�c ��nh: Qu�n Kim th�t ��ng gh�t, d�m h�y h�a ��c x�m ph�m bi�n gi�i, gi�t ng��i v� t�i. Theo tin b�o v�, Kim T��ng qu�n v� s� b� ng��i kh�c l�i d�ng, h�n �ang h� tr�i m�t m�nh � Ph�c Ng�u S�n T�y, ng��i h�y �i gi�t h�n �� l�m an l�ng d�n",2,"���c ta s� �i ngay/nv9x1","�� ta suy ngh� l�i/no")
	elseif GetTask(14) == 60*256 then 
		Talk(3,"nv9x3",""..GetName()..": Th�ng tin t�nh b�o kh�ng ch�nh x�c, qu�n Kim mai ph�c kh�p n�i","Nh�c ��nh: Ta c�ng nh�n th�y c� m�t v�n �� l�n � ��y. Ta c� m�t danh s�ch c�c �� t� kh� nghi, hay mau ki�m tra, n�u h�n ph�n b�i, x� ngay t�i ch�!")
	elseif GetTask(14) == 100*256 then
		Talk(6,"nv9x6","Nh�c ��nh: Ng��i �� t�m th�y ch�a? Th�t s� c� gian t�?",""..GetName()..": Ta �� bi�t ���c v� tr� c�a Kim T��ng Qu�n v� �� l�y ���c th� c�p c�a h�n","Nh�c ��nh: �� ta xem","Nh�c ��nh: L�m t�t l�m","Nh�c ��nh: Kim T��ng qu�n �� ch�t, qu�n Kim tan r�, � ��y c� m�t ch�t �� d�ng, h�y �em ph�n ph�t cho nh�ng ng��i b� �p b�c, �� h� ti�p t�c s�ng.")
	elseif GetTask(14) == 150*256 then
		Talk(3,"nv9x7",""..GetName()..": ��y l� l� th� c�a nh�ng ng��i d�n g�i l�i c�m �n.","Nh�c ��nh: ��ng r�i, ��y l� s� c�ng nh�n c�a ng��i d�n v� ng��i")
	else
		Talk(1,"","Nh�c ��nh: Ng��i �� nh�n ���c tin g� ch�a?")
	end;
end

function nv9x1()
SetTask(14,10*256)
Msg2Player("��n Ph�c Ng�u S�n T�y (247/181), ti�u di�t qu�n Kim.")
end;

function nv9x3()
SetTask(14,70*256)
Msg2Player("T�m �� T� Kh� Nghi (199/193), (218/201), (205/201), (212/206) �� th�m tra.") 
end;

function nv9x6()
	if (CalcEquiproomItemCount(6,1,5100,1) >= 1) then
		SetTask(14,110*256)
		ConsumeEquiproomItem(1,6,1,5100,-1)
		tbAwardTemplet:GiveAwardByList({tbProp = {6,1,5101,1,0,0},nCount = 4, nBindState=-2},"Sinh Ho�t V�t T�",1); 
		Msg2Player("��n Long Tuy�n Th�n t�m T� Thanh My (195/200), M�nh B� B� (207/204), L� Giai (203/204), T�n Gia Gia (195/204) ph�n ph�t nhu y�u ph�m cho ng��i b� �p b�c.") 
	else
		Talk(1,"","Th� c�p c�a h�n ��u? Sao ta kh�ng th�y!")
	end
end;

function nv9x7()
	if (CalcEquiproomItemCount(6,1,5102,1) >= 1) then
		if HaveMagic(1863) <= 0 and HaveMagic(1864) <= 0 then
			AddMagic(1983,1) AddMagic(1967,1)
			SetTask(14,160*256)
			ConsumeEquiproomItem(1,6,1,5102,-1)
			Msg2Player("Ho�n th�nh nhi�m v� c�p 90. H�c ���c <color=yellow>Kh�t �m Hung N� Huy�t, Tr�n Bi�n Th�y<color>") 
		else
			SetTask(14,160*256)
			ConsumeEquiproomItem(1,6,1,5102,-1)
			Msg2Player("Ho�n th�nh nhi�m v� c�p 90 c�a ph�i V� H�n.") 
		end
	else
		Talk(1,"","Nhi�m v� ta giao cho ng��i �i ph�n ph�t v�t t� �� l�m xong ch�a?")
	end
end