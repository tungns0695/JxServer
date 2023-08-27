IncludeLib("SETTING")

function main()
	dofile("script/wumumenpai/ngulien.lua")
	local UTask_wh = GetTask(12)
	if (UTask_wh == 10*256 and GetLevel() >= 10) then
		Say("Ng� Li�n: Hi�p s� ��n b�n ���ng c� chuy�n g� kh�ng?",3,"Ta c�n gi�p ��/TimHieuMonPhai","Ta c� vi�c kh�c/nv1x1","K�t th�c ��i tho�i./No")
	elseif (UTask_wh == 30*256 and GetLevel() >= 10) then
		Say("Ng� Li�n: Hi�p s� ��n b�n ���ng c� chuy�n g� kh�ng?",3,"Ta c�n gi�p ��/TimHieuMonPhai","Ta c� vi�c kh�c/nv1x3","K�t th�c ��i tho�i./No")
	else
		Say("Ng� Li�n: Hi�p s� ��n b�n ���ng c� chuy�n g� kh�ng?",3,"Ta c�n gi�p ��/TimHieuMonPhai","K�t th�c ��i tho�i./No")
	end
end

function nv1x1()
	Say("Ng� Li�n: Ch�o m�ng gia nh�p B�n ���ng, ��y l� T� ph�m, h�y c�m l�y �i b�i t� Nh�c Phi T��ng Qu�n!",3,"Ta �i ngay/nv1x2","Ta c� vi�c kh�c ph�i l�m/No")
end

function nv1x2()
	if (CalcEquiproomItemCount(6,1,5094,1) == 0) then
		local nIndex = AddItem(6,1,5094,1,0,0) SetItemBindState(nIndex, -2) SetTask(12,20*256) NewWorld(1042, 1648, 3024)
	else
		NewWorld(1042, 1648, 3024)
	end
end

function nv1x3()
AddMagic(1964)
AddMagic(1975)
SetRank(91)
SetTask(12,40*256)
Msg2Player("Ho�n th�nh nhi�m v� b�i t� Nh�c Phi. H�c ���c v� c�ng V� H�n �ao Ph�p v� V� H�n Thu�n Ph�p, ���c phong l� Trung Qu�n!")
end

function TimHieuMonPhai()
	Say("Ng� Li�n: Th� ra l� S� �i�t, c�n gi�p g� kh�ng?",3,"T�m hi�u ��ng m�n/TimDongMon","T�m hi�u nhi�m v� m�n ph�i/TimHieuNhiemVu","K�t th�c ��i tho�i./No")
end

function TimDongMon()
Say("Ng� Li�n: Ng��i mu�n t�m ai?",14,
	"Ta bi�t r�i/No",
                 "T�m Nh�c L�i/#TimViTriNpc(1)",
	"T�m Ng�u Th�ng/#TimViTriNpc(2)",
	"T�m H�n Th��ng ��c/#TimViTriNpc(3)",
	"T�m Thi Phong/#TimViTriNpc(4)",
	"T�m Thang Anh/#TimViTriNpc(5)",
	"T�m H�n Kh�i Ph��ng/#TimViTriNpc(6)",
	"T�m Nh�c ��nh/#TimViTriNpc(7)",
	"T�m C�t Khang/#TimViTriNpc(8)",
	"T�m Th� Nhu�/#TimViTriNpc(9)",
	"T�m Y S�/#TimViTriNpc(10)",
	"T�m D� ��i Ch�y/#TimViTriNpc(11)",
	"T�m Nh�c Nh� N��ng/#TimViTriNpc(12)")
end

function TimViTriNpc(NpcPos)
	if (NpcPos == 1) then
		Say("<color=yellow>Nh�c L�i:<color>\n<color=red>V� tr� tr��c Trung D�ng ���ng, t�a ��: 211,190!<color>",2,"K�t th�c ��i tho�i./#SetMovePos(1)")
	elseif (NpcPos == 2) then
		Say("<color=yellow>Ng�u Th�ng:<color>\n<color=red>V� tr� tr��c Trung D�ng ���ng, t�a ��: 210,190!<color>",2,"K�t th�c ��i tho�i./#SetMovePos(2)")
	elseif (NpcPos == 3) then
		Say("<color=yellow>H�n Th��ng ��c:<color>\n<color=red>V� tr� tr��c Trung D�ng ���ng, t�a ��: 211,191!<color>",2,"K�t th�c ��i tho�i./#SetMovePos(3)")
	elseif (NpcPos == 4) then
		Say("<color=yellow>Thi Phong:<color>\n<color=red>Nh�n nhi�m v� m�n ph�i c�p 40, t�a ��: 218,203!<color>",2,"K�t th�c ��i tho�i./#SetMovePos(4)")
	elseif (NpcPos == 5) then
		Say("<color=yellow>Thang Anh:<color>\n<color=red>V� tr� Gi�i ���ng, t�a ��: 211,199!<color>",2,"K�t th�c ��i tho�i./#SetMovePos(5)")
	elseif (NpcPos == 6) then
		Say("<color=yellow>H�n Kh�i Ph��ng:<color>\n<color=red>V� tr� B�n Long ��i, t�a ��: 200,188!<color>",2,"K�t th�c ��i tho�i./#SetMovePos(6)")
	elseif (NpcPos == 7) then
		Say("<color=yellow>Nh�c ��nh:<color>\n<color=red>V� tr� B�n Long ��i, t�a ��: 199,187!<color>",2,"K�t th�c ��i tho�i./#SetMovePos(7)")
	elseif (NpcPos == 8) then
		Say("<color=yellow>C�t Khang:<color>\n<color=red>V� tr� C� T��ng ��i, t�a ��: 190,202!<color>",2,"K�t th�c ��i tho�i./#SetMovePos(8)")
	elseif (NpcPos == 9) then
		Say("<color=yellow>Th� Nhu�:<color>\n<color=red>V� tr� C� T��ng ��i, t�a ��: 190,202!<color>",2,"K�t th�c ��i tho�i./#SetMovePos(9)")
	elseif (NpcPos == 10) then
		Say("<color=yellow>Y S�:<color>\n<color=red>V� tr� Gi�i ���ng, t�a ��: 223,200!<color>",2,"K�t th�c ��i tho�i./#SetMovePos(10)")
	elseif (NpcPos == 11) then
		Say("<color=yellow>D� ��i Ch�y:<color>\n<color=red>V� tr� Ti�m Binh Kh�, t�a ��: 226,202!<color>",2,"K�t th�c ��i tho�i./#SetMovePos(11)")
	elseif (NpcPos == 12) then
		Say("<color=yellow>Nh�c Nh� N��ng:<color>\n<color=red>V� tr� Ti�m Trang B�, t�a ��: 208,206!<color>",2,"K�t th�c ��i tho�i./#SetMovePos(12)")
	end
end

function TimHieuNhiemVu()
Say("Ng� Li�n: Ng��i mu�n t�m hi�u nhi�m v� n�o?",10,
	"Ta bi�t r�i/No",
	"Nhi�m v� c�p 10/#NhiemVuMonPhai(1)",
	"Nhi�m v� c�p 20/#NhiemVuMonPhai(2)",
	"Nhi�m v� c�p 30/#NhiemVuMonPhai(3)",
	"Nhi�m v� c�p 40/#NhiemVuMonPhai(4)",
	"Nhi�m v� c�p 50/#NhiemVuMonPhai(5)",
	"Nhi�m v� Xu�t S�/#NhiemVuMonPhai(6)",
	"Nhi�m v� Tr�ng Ph�n S� M�n/#NhiemVuMonPhai(7)",
	"Nhi�m v� K� Danh �� T�/#NhiemVuMonPhai(8)",
	"Nhi�m v� c�p 90/#NhiemVuMonPhai(9)")
end

function NhiemVuMonPhai(nNV)
	if (nNV == 1) then
		Say("<color=yellow>Nhi�m v� c�p 10: T� B�i Anh H�n<color>\n<color=red>��i tho�i v�i Ng� Li�n, ti�p nh�n nhi�m v� b�i t� Nh�c Phi!<color>")
	elseif (nNV == 2) then
		Say("<color=yellow>Nhi�m v� c�p 20: Tr� Gian Di�t �c<color>\n<color=red>��i tho�i v�i C�t Khang ho�c Th� Nhu�, ti�p nh�n nhi�m v� gi�o hu�n Du T�u M�i H�a Lang!<color>",2,"K�t th�c ��i tho�i./#SetMovePos(8)")
	elseif (nNV == 3) then
		Say("<color=yellow>Nhi�m v� c�p 30: Chi�n H�u C�ng S�<color>\n<color=red>��i tho�i v�i Thang Anh, ti�p nh�n nhi�m v� thu th�p qu�n gi�i v� tr� li�u cho c�c �� t� b�n ���ng<color>",2,"K�t th�c ��i tho�i./#SetMovePos(5)")
	elseif (nNV == 4) then
		Say("<color=yellow>Nhi�m v� c�p 40: M�t Tr� N�nh Th�n<color>\n<color=red>��i tho�i v�i Thi Phong, ti�p nh�n nhi�m v� ti�u di�t La Hi�n Th�nh tr� th� cho Nh�c Phi<color>",2,"K�t th�c ��i tho�i./#SetMovePos(4)")
	elseif (nNV == 5) then
		Say("<color=yellow>Nhi�m v� c�p 50: Kh�o Nghi�m V� Ngh�<color>\n<color=red>��i tho�i v�i Ng�u Th�ng, ti�p nh�n nhi�m v� t� th� Di�n V� Tr��ng<color>",2,"K�t th�c ��i tho�i./#SetMovePos(2)")
	elseif (nNV == 6) then
		Say("<color=yellow>Nhi�m v� Xu�t S�: V� M�c Di Th� Th�t Gi�<color>\n<color=red>��i tho�i v�i H�n Kh�i Ph��ng, ti�p nh�n nhi�m v� �i t�m V� M�c Di Th�!<color>",2,"K�t th�c ��i tho�i./#SetMovePos(6)")
	elseif (nNV == 7) then
		Say("<color=yellow>Nhi�m v� Tr�ng Ph�n S� M�n:<color>\n<color=red>��i tho�i v�i Nh�c L�i, ti�p nh�n nhi�m v� xin gia nh�p l�i b�n ���ng<color>",2,"K�t th�c ��i tho�i./#SetMovePos(1)")
	elseif (nNV == 8) then
		Say("<color=yellow>Nhi�m v� K� Danh �� T�:<color>\n<color=red>��i tho�i v�i H�n Th��ng ��c, ti�p nh�n nhi�m v� gi�o hu�n C��ng Gi�!<color>",2,"K�t th�c ��i tho�i./#SetMovePos(3)")
	elseif (nNV == 9) then
		Say("<color=yellow>Nhi�m v� c�p 90: Di�t Gi�n �i�p<color>\n<color=red>��i tho�i v�i Nh�c ��nh,, ti�p nh�n nhi�m v� ti�u di�t T��ng L�nh �� ��u qu�n cho b�n Kim Qu�c!<color>",2,"K�t th�c ��i tho�i./#SetMovePos(7)")
	end
end

function SetMovePos(nPos)
local nMap,_,_ = GetWorldPos()
	if (nMap == 1042) then
		if (nPos == 1) then
			ST_SyncMiniMapObj(1688*32,3040*32)
		elseif (nPos == 2) then
			ST_SyncMiniMapObj(1680*32,3040*32)
		elseif (nPos == 3) then
			ST_SyncMiniMapObj(1688*32,3056*32)
		elseif (nPos == 4) then
			ST_SyncMiniMapObj(1744*32,3248*32)
		elseif (nPos == 5) then
			ST_SyncMiniMapObj(1688*32,3184*32)
		elseif (nPos == 6) then
			ST_SyncMiniMapObj(1600*32,3008*32)
		elseif (nPos == 7) then
			ST_SyncMiniMapObj(1592*32,2992*32)
		elseif (nPos == 8) then
			ST_SyncMiniMapObj(1520*32,3232*32)
		elseif (nPos == 9) then
			ST_SyncMiniMapObj(1520*32,3232*32)
		elseif (nPos == 10) then
			ST_SyncMiniMapObj(1784*32,3200*32)
		elseif (nPos == 11) then
			ST_SyncMiniMapObj(1808*32,3232*32)
		elseif (nPos == 12) then
			ST_SyncMiniMapObj(1664*32,3296*32)
		end
	end
end