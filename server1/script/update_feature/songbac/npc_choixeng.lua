--------------------------------------------***Script*Create*By*Heart*Doldly***-----------------------------------------------------------
IncludeLib("LEAGUE");
Include("\\script\\dailogsys\\dailogsay.lua")
Include("\\script\\lib\\composeex.lua")
Include("\\script\\dailogsys\\g_dialog.lua")
Include("\\script\\activitysys\\npcdailog.lua")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\lib\\progressbar.lua")
--Include("\\script\\update_feature\\songbac\\baucua.lua")
------------------------------------------------------------------
nDiemTichLuy = 13
TraiTao = 14
TraiLe = 15
TraiBuoi = 16
TraiSung = 17
TraiXoai = 18
TraiCam = 19
TraiDao = 20
NaiChuoi = 21
TraiDuaHau =22
TraiDuDu = 23
nID_Xeng = 2272
nID_Xu = 417
---------------------------------------------------------------------------------------------------------------------------------------------------------------------
function NapXeng()
	AskClientForNumber("NapXeng_Xeng",0,1000,"S� L��ng X�ng")
end

function NapXeng_Xeng(num)
local nXeng = CalcEquiproomItemCount(6,1,nID_Xeng,1)
local nSL = num*10
	if (nXeng >= num) then
		ConsumeEquiproomItem(num,6,1,nID_Xeng,-1) HN_SetTaskID(nDiemTichLuy,HN_GetTaskID(nDiemTichLuy)+nSL)
	else
		Talk(1,"","<color=yellow>C�c H� Mu�n ��i <color=red>"..num.."<color> X�ng L�y <color=red>"..nSL.."<color> �i�m T�ch L�y\n               C�n Thi�u <color=red>"..num-nXeng.."<color> X�ng")
	end
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
function RutXeng()
	AskClientForNumber("RutXeng_Xeng",0,1000,"Nh�p S� �i�m")
end

function RutXeng_Xeng(num)
local nTichLuy = HN_GetTaskID(nDiemTichLuy)
local nSL = num/10
	if (nTichLuy >= num) then
		HN_SetTaskID(nDiemTichLuy,HN_GetTaskID(nDiemTichLuy)-num) tbAwardTemplet:GiveAwardByList({tbProp={6,1,nID_Xeng,1,0,0},nCount=nSL},1)
	else
		Talk(1,"","<color=yellow>C�c H� Mu�n S� D�ng <color=red>"..num.."<color> �i�m T�ch L�y L�y<color=red>"..nSL.."<color> X�ng\n          C�n Thi�u <color=red>"..num-nTichLuy.."<color> �i�m T�ch L�y")
	end
end
------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function DoiXeng()
	AskClientForNumber("DoiXeng_Xeng",0,1000,"S� L��ng X�ng")
end

function DoiXeng_Xeng(num)
local nXeng = CalcEquiproomItemCount(6,1,nID_Xeng,1)
local nSL = num*20
	if (nXeng >= num) then
		ConsumeEquiproomItem(num,6,1,nID_Xeng,-1) tbAwardTemplet:GiveAwardByList({tbProp={4,nID_Xu,1,1,0,0},nCount=nSL},1)
	else
		Talk(1,"","<color=yellow>C�c H� Mu�n ��i <color=red>"..num.."<color> X�ng L�y <color=red>"..nSL.."<color> Xu\n              C�n Thi�u <color=red>"..num-nXeng.."<color> X�ng")
	end
end
--------------------------------------------------------------------------------------------------------------------------------------------------------------------
function MuaXeng()
	AskClientForNumber("MuaXeng_Xeng",0,1000,"S� L��ng X�ng")
end

function MuaXeng_Xeng(num)
local nXu = CalcEquiproomItemCount(4,nID_Xu,1,1)
local nSL = num*20
	if (nXu >= nSL) then
		ConsumeEquiproomItem(nSL,4,nID_Xu,1,-1) tbAwardTemplet:GiveAwardByList({tbProp={6,1,nID_Xeng,1,0,0},nCount=num},1)
	else
		Talk(1,"","<color=yellow>C�c H� Mu�n Mua <color=red>"..num.."<color> X�ng\n     S� Ti�n Thanh To�n L� "..nSL.." Xu\n          C�n Thi�u <color=red>"..nSL-nXu.."<color> Xu")
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
function ChoiNgay()
	Say("Xin M�i N� Hi�p H�y ��t C�a",11,
	"Tr�i T�o/Trai_Tao",
	"Tr�i L�/Trai_Le",
	"Tr�i B��i/Trai_Buoi",
	"Tr�i Sung/Trai_Sung",
	"Tr�i Xo�i/Trai_Xoai",
	"Tr�i Cam/Trai_Cam",
	"Tr�i ��o/Trai_Dao",
	"N�i Chu�i/Nai_Chuoi",
	"Tr�i D�a H�u/Trai_DuaHau",
	"Tr�i �u ��/Trai_DuDu",
	"K�t Th�c/No")
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
function Trai_Tao()
	AskClientForNumber("CuocTraiTao",0,10000,"Nh�p S� �i�m")
end

function CuocTraiTao(num)
local nTichLuy = HN_GetTaskID(nDiemTichLuy)
	if (HN_GetTaskID(TraiTao) == 0) then
		if (nTichLuy >= num) then
			HN_SetTaskID(nDiemTichLuy,HN_GetTaskID(nDiemTichLuy)-num)
			HN_SetTaskID(TraiTao,HN_GetTaskID(TraiTao)+num)
			Msg2Player("<color=green>"..GetName().." �� ��t Tr�i T�o V�i M�c C��c L� <color=yellow>"..num.."<color> �i�m T�ch L�y<color>")
		else
			Talk(1,"","C�c H� Kh�ng �� �i�m T�ch L�y �� ��t C��c")
		end
	else
		Talk(1,"","Ng��i �� Ch�n C�a N�y R�i H�y Ch�n C�a Kh�c �i")
	end
end

function Trai_Le()
	AskClientForNumber("CuocTraiLe",0,10000,"Nh�p S� �i�m")
end

function CuocTraiLe(num)
local nTichLuy = HN_GetTaskID(nDiemTichLuy)
	if (HN_GetTaskID(TraiLe) == 0) then
		if (nTichLuy >= num) then
			HN_SetTaskID(nDiemTichLuy,HN_GetTaskID(nDiemTichLuy)-num)
			HN_SetTaskID(TraiLe,HN_GetTaskID(TraiLe)+num)
			Msg2Player("<color=green>"..GetName().." �� ��t Tr�i L� V�i M�c C��c L� <color=yellow>"..num.."<color> �i�m T�ch L�y<color>")
		else
			Talk(1,"","C�c H� Kh�ng �� �i�m T�ch L�y �� ��t C��c")
		end
	else
		Talk(1,"","Ng��i �� Ch�n C�a N�y R�i H�y Ch�n C�a Kh�c �i")
	end
end

function Trai_Buoi()
	AskClientForNumber("CuocTraiBuoi",0,10000,"Nh�p S� �i�m")
end

function CuocTraiBuoi(num)
local nTichLuy = HN_GetTaskID(nDiemTichLuy)
	if (HN_GetTaskID(TraiBuoi) == 0) then
		if (nTichLuy >= num) then
			HN_SetTaskID(nDiemTichLuy,HN_GetTaskID(nDiemTichLuy)-num)
			HN_SetTaskID(TraiBuoi,HN_GetTaskID(TraiBuoi)+num)
			Msg2Player("<color=green>"..GetName().." �� ��t Tr�i B��i V�i M�c C��c L� <color=yellow>"..num.."<color> �i�m T�ch L�y<color>")
		else
			Talk(1,"","C�c H� Kh�ng �� �i�m T�ch L�y �� ��t C��c")
		end
	else
		Talk(1,"","Ng��i �� Ch�n C�a N�y R�i H�y Ch�n C�a Kh�c �i")
	end
end

function Trai_Sung()
	AskClientForNumber("CuocTraiSung",0,10000,"Nh�p S� �i�m")
end

function CuocTraiSung(num)
local nTichLuy = HN_GetTaskID(nDiemTichLuy)
	if (HN_GetTaskID(TraiSung) == 0) then
		if (nTichLuy >= num) then
			HN_SetTaskID(nDiemTichLuy,HN_GetTaskID(nDiemTichLuy)-num)
			HN_SetTaskID(TraiSung,HN_GetTaskID(TraiSung)+num)
			Msg2Player("<color=green>"..GetName().." �� ��t Tr�i Sung V�i M�c C��c L� <color=yellow>"..num.."<color> �i�m T�ch L�y<color>")
		else
			Talk(1,"","C�c H� Kh�ng �� �i�m T�ch L�y �� ��t C��c")
		end
	else
		Talk(1,"","Ng��i �� Ch�n C�a N�y R�i H�y Ch�n C�a Kh�c �i")
	end
end

function Trai_Xoai()
	AskClientForNumber("CuocTraiXoai",0,10000,"Nh�p S� �i�m")
end

function CuocTraiXoai(num)
local nTichLuy = HN_GetTaskID(nDiemTichLuy)
	if (HN_GetTaskID(TraiXoai) == 0) then
		if (nTichLuy >= num) then
			HN_SetTaskID(nDiemTichLuy,HN_GetTaskID(nDiemTichLuy)-num)
			HN_SetTaskID(TraiXoai,HN_GetTaskID(TraiXoai)+num)
			Msg2Player("<color=green>"..GetName().." �� ��t Tr�i Xo�i V�i M�c C��c L� <color=yellow>"..num.."<color> �i�m T�ch L�y<color>")
		else
			Talk(1,"","C�c H� Kh�ng �� �i�m T�ch L�y �� ��t C��c")
		end
	else
		Talk(1,"","Ng��i �� Ch�n C�a N�y R�i H�y Ch�n C�a Kh�c �i")
	end
end

function Trai_Cam()
	AskClientForNumber("CuocTraiCam",0,10000,"Nh�p S� �i�m")
end

function CuocTraiCam(num)
local nTichLuy = HN_GetTaskID(nDiemTichLuy)
	if (HN_GetTaskID(TraiCam) == 0) then
		if (nTichLuy >= num) then
			HN_SetTaskID(nDiemTichLuy,HN_GetTaskID(nDiemTichLuy)-num)
			HN_SetTaskID(TraiCam,HN_GetTaskID(TraiCam)+num)
			Msg2Player("<color=green>"..GetName().." �� ��t Tr�i Cam V�i M�c C��c L� <color=yellow>"..num.."<color> �i�m T�ch L�y<color>")
		else
			Talk(1,"","C�c H� Kh�ng �� �i�m T�ch L�y �� ��t C��c")
		end
	else
		Talk(1,"","Ng��i �� Ch�n C�a N�y R�i H�y Ch�n C�a Kh�c �i")
	end
end

function Trai_Dao()
	AskClientForNumber("CuocTraiDao",0,10000,"Nh�p S� �i�m")
end

function CuocTraiDao(num)
local nTichLuy = HN_GetTaskID(nDiemTichLuy)
	if (HN_GetTaskID(TraiDao) == 0) then
		if (nTichLuy >= num) then
			HN_SetTaskID(nDiemTichLuy,HN_GetTaskID(nDiemTichLuy)-num)
			HN_SetTaskID(TraiDao,HN_GetTaskID(TraiDao)+num)
			Msg2Player("<color=green>"..GetName().." �� ��t Tr�i ��o V�i M�c C��c L� <color=yellow>"..num.."<color> �i�m T�ch L�y<color>")
		else
			Talk(1,"","C�c H� Kh�ng �� �i�m T�ch L�y �� ��t C��c")
		end
	else
		Talk(1,"","Ng��i �� Ch�n C�a N�y R�i H�y Ch�n C�a Kh�c �i")
	end
end

function Nai_Chuoi()
	AskClientForNumber("CuocNaiChuoi",0,10000,"Nh�p S� �i�m")
end

function CuocNaiChuoi(num)
local nTichLuy = HN_GetTaskID(nDiemTichLuy)
	if (HN_GetTaskID(NaiChuoi) == 0) then
		if (nTichLuy >= num) then
			HN_SetTaskID(nDiemTichLuy,HN_GetTaskID(nDiemTichLuy)-num)
			HN_SetTaskID(NaiChuoi,HN_GetTaskID(NaiChuoi)+num)
			Msg2Player("<color=green>"..GetName().." �� ��t N�i Chu�i V�i M�c C��c L� <color=yellow>"..num.."<color> �i�m T�ch L�y<color>")
		else
			Talk(1,"","C�c H� Kh�ng �� �i�m T�ch L�y �� ��t C��c")
		end
	else
		Talk(1,"","Ng��i �� Ch�n C�a N�y R�i H�y Ch�n C�a Kh�c �i")
	end
end

function Trai_DuaHau()
	AskClientForNumber("CuocDuaHau",0,10000,"Nh�p S� �i�m")
end

function CuocDuaHau(num)
local nTichLuy = HN_GetTaskID(nDiemTichLuy)
	if (HN_GetTaskID(TraiDuaHau) == 0) then
		if (nTichLuy >= num) then
			HN_SetTaskID(nDiemTichLuy,HN_GetTaskID(nDiemTichLuy)-num)
			HN_SetTaskID(TraiDuaHau,HN_GetTaskID(TraiDuaHau)+num)
			Msg2Player("<color=green>"..GetName().." �� ��t Tr�i D�a H�u V�i M�c C��c L� <color=yellow>"..num.."<color> �i�m T�ch L�y<color>")
		else
			Talk(1,"","C�c H� Kh�ng �� �i�m T�ch L�y �� ��t C��c")
		end
	else
		Talk(1,"","Ng��i �� Ch�n C�a N�y R�i H�y Ch�n C�a Kh�c �i")
	end
end

function Trai_DuDu()
	AskClientForNumber("CuocDuDu",0,10000,"Nh�p S� �i�m")
end

function CuocDuDu(num)
local nTichLuy = HN_GetTaskID(nDiemTichLuy)
	if (HN_GetTaskID(TraiDuDu) == 0) then
		if (nTichLuy >= num) then
			HN_SetTaskID(nDiemTichLuy,HN_GetTaskID(nDiemTichLuy)-num)
			HN_SetTaskID(TraiDuDu,HN_GetTaskID(TraiDuDu)+num)
			Msg2Player("<color=green>"..GetName().." �� ��t Tr�i �u �� V�i M�c C��c L� <color=yellow>"..num.."<color> �i�m T�ch L�y<color>")
		else
			Talk(1,"","C�c H� Kh�ng �� �i�m T�ch L�y �� ��t C��c")
		end
	else
		Talk(1,"","Ng��i �� Ch�n C�a N�y R�i H�y Ch�n C�a Kh�c �i")
	end
end
------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function XemKetQua()
local strTittle = "<color=green>K�t Qu� ��t C��c L�n N�y:<color>\n"
strTittle = strTittle..format("<color=green>%-70s%-62s%-70s%-62s%-70s%-62s%-70s%-62s%-70s%s<color>\n", ""..ViewTraiTao().."", ""..ViewTraiLe().."", ""..ViewTraiBuoi().."", ""..ViewTraiSung().."", ""..ViewTraiXoai().."", ""..ViewTraiCam().."", ""..ViewTraiDao().."", ""..ViewNaiChuoi().."", ""..ViewTraiDuaHau().."", ""..ViewTraiDuDu().."")
	local tbOpt = {
		{"Quay X�ng May M�n",QuayXeng},
		{"K�t Th�c",No},
	}
	CreateNewSayEx(strTittle, tbOpt)
end
---------------------------------------------------Xem Thong Tin ��t C��c--------------------------------------------------------------------------------------------
function ViewTraiTao()
	if (HN_GetTaskID(TraiTao) >= 1) then
		return "<color=yellow>Tr�i T�o <color=red>"..HN_GetTaskID(TraiTao).."<color> �i�m<color>"
	else
		return "<color=yellow>Tr�i T�o <color=red>"..HN_GetTaskID(TraiTao).."<color> �i�m<color>"
	end
end

function ViewTraiLe()
	if (HN_GetTaskID(TraiLe) >= 1) then
		return "<color=yellow>Tr�i L� <color=red>"..HN_GetTaskID(TraiLe).."<color> �i�m<color>"
	else
		return "<color=yellow>Tr�i L� <color=red>"..HN_GetTaskID(TraiLe).."<color> �i�m<color>"
	end
end

function ViewTraiBuoi()
	if (HN_GetTaskID(TraiBuoi) >= 1) then
		return "<color=yellow>Tr�i B��i <color=red>"..HN_GetTaskID(TraiBuoi).."<color> �i�m<color>"
	else
		return "<color=yellow>Tr�i B��i <color=red>"..HN_GetTaskID(TraiBuoi).."<color> �i�m<color>"
	end
end

function ViewTraiSung()
	if (HN_GetTaskID(TraiSung) >= 1) then
		return "<color=yellow>Tr�i Sung <color=red>"..HN_GetTaskID(TraiSung).."<color> �i�m<color>"
	else
		return "<color=yellow>Tr�i Sung <color=red>"..HN_GetTaskID(TraiSung).."<color> �i�m<color>"
	end
end

function ViewTraiXoai()
	if (HN_GetTaskID(TraiXoai) >= 1) then
		return "<color=yellow>Tr�i Xo�i <color=red>"..HN_GetTaskID(TraiXoai).."<color> �i�m<color>"
	else
		return "<color=yellow>Tr�i Xo�i <color=red>"..HN_GetTaskID(TraiXoai).."<color> �i�m<color>"
	end
end

function ViewTraiCam()
	if (HN_GetTaskID(TraiCam) >= 1) then
		return "<color=yellow>Tr�i Cam <color=red>"..HN_GetTaskID(TraiCam).."<color> �i�m<color>"
	else
		return "<color=yellow>Tr�i Cam <color=red>"..HN_GetTaskID(TraiCam).."<color> �i�m<color>"
	end
end

function ViewTraiDao()
	if (HN_GetTaskID(TraiDao) >= 1) then
		return "<color=yellow>Tr�i ��o <color=red>"..HN_GetTaskID(TraiDao).."<color> �i�m<color>"
	else
		return "<color=yellow>Tr�i ��o <color=red>"..HN_GetTaskID(TraiDao).."<color> �i�m<color>"
	end
end

function ViewNaiChuoi()
	if (HN_GetTaskID(NaiChuoi) >= 1) then
		return "<color=yellow>N�i Chu�i <color=red>"..HN_GetTaskID(NaiChuoi).."<color> �i�m<color>"
	else
		return "<color=yellow>N�i Chu�i <color=red>"..HN_GetTaskID(NaiChuoi).."<color> �i�m<color>"
	end
end

function ViewTraiDuaHau()
	if (HN_GetTaskID(TraiDuaHau) >= 1) then
		return "<color=yellow>Tr�i D�a H�u <color=red>"..HN_GetTaskID(TraiDuaHau).."<color> �i�m<color>"
	else
		return "<color=yellow>Tr�i D�a H�u <color=red>"..HN_GetTaskID(TraiDuaHau).."<color> �i�m<color>"
	end
end

function ViewTraiDuDu()
	if (HN_GetTaskID(TraiDuDu) >= 1) then
		return "<color=yellow>Tr�i �u �� <color=red>"..HN_GetTaskID(TraiDuDu).."<color> �i�m<color>"
	else
		return "<color=yellow>Tr�i �u �� <color=red>"..HN_GetTaskID(TraiDuDu).."<color> �i�m<color>"
	end
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------
local _OnBreak = function()
	Msg2Player("<color=yellow>Qu� Tr�nh Quay X�ng B� Gi�n �o�n...!")
end

local _GetFruit = function(nItemIdx)
	local x = random(1,40)
	if (x == 1) then
		Talk(1,"AnTraiTao1","<color=yellow>K�t Qu� L�n N�y L�<color> <color=red>Tr�i T�o<color>")
	elseif (x == 2) then
		Talk(1,"AnTraiTao2","<color=yellow>K�t Qu� L�n N�y L�<color> <color=red>Tr�i T�o<color>")
	elseif (x == 3) then
		Talk(1,"AnTraiTao3","<color=yellow>K�t Qu� L�n N�y L�<color> <color=red>Tr�i T�o<color>")
	elseif (x == 4) then
		Talk(1,"AnTraiTao4","<color=yellow>K�t Qu� L�n N�y L�<color> <color=red>Tr�i T�o<color>")
		
	elseif (x == 5) then
		Talk(1,"AnTraiLe1","<color=yellow>K�t Qu� L�n N�y L�<color> <color=red>Tr�i L�<color>")
	elseif (x == 6) then
		Talk(1,"AnTraiLe2","<color=yellow>K�t Qu� L�n N�y L�<color> <color=red>Tr�i L�<color>")
	elseif (x == 7) then
		Talk(1,"AnTraiLe3","<color=yellow>K�t Qu� L�n N�y L�<color> <color=red>Tr�i L�<color>")
	elseif (x == 8) then
		Talk(1,"AnTraiLe4","<color=yellow>K�t Qu� L�n N�y L�<color> <color=red>Tr�i L�<color>")
		
	elseif (x == 9) then
		Talk(1,"AnTraiBuoi1","<color=yellow>K�t Qu� L�n N�y L�<color> <color=red>Tr�i B��i<color>")
	elseif (x == 10) then
		Talk(1,"AnTraiBuoi2","<color=yellow>K�t Qu� L�n N�y L�<color> <color=red>Tr�i B��i<color>")
	elseif (x == 11) then
		Talk(1,"AnTraiBuoi3","<color=yellow>K�t Qu� L�n N�y L�<color> <color=red>Tr�i B��i<color>")
	elseif (x == 12) then
		Talk(1,"AnTraiBuoi4","<color=yellow>K�t Qu� L�n N�y L�<color> <color=red>Tr�i B��i<color>")
		
	elseif (x == 13) then
		Talk(1,"AnTraiSung1","<color=yellow>K�t Qu� L�n N�y L�<color> <color=red>Tr�i Sung<color>")
	elseif (x == 14) then
		Talk(1,"AnTraiSung2","<color=yellow>K�t Qu� L�n N�y L�<color> <color=red>Tr�i Sung<color>")
	elseif (x == 15) then
		Talk(1,"AnTraiSung3","<color=yellow>K�t Qu� L�n N�y L�<color> <color=red>Tr�i Sung<color>")
	elseif (x == 16) then
		Talk(1,"AnTraiSung4","<color=yellow>K�t Qu� L�n N�y L�<color> <color=red>Tr�i Sung<color>")
		
	elseif (x == 17) then
		Talk(1,"AnTraiXoai1","<color=yellow>K�t Qu� L�n N�y L�<color> <color=red>Tr�i Xo�i<color>")
	elseif (x == 18) then
		Talk(1,"AnTraiXoai2","<color=yellow>K�t Qu� L�n N�y L�<color> <color=red>Tr�i Xo�i<color>")
	elseif (x == 19) then
		Talk(1,"AnTraiXoai3","<color=yellow>K�t Qu� L�n N�y L�<color> <color=red>Tr�i Xo�i<color>")
	elseif (x == 20) then
		Talk(1,"AnTraiXoai4","<color=yellow>K�t Qu� L�n N�y L�<color> <color=red>Tr�i Xo�i<color>")
		
	elseif (x == 21) then
		Talk(1,"AnTraiCam1","<color=yellow>K�t Qu� L�n N�y L�<color> <color=red>Tr�i Cam<color>")
	elseif (x == 22) then
		Talk(1,"AnTraiCam2","<color=yellow>K�t Qu� L�n N�y L�<color> <color=red>Tr�i Cam<color>")
	elseif (x == 23) then
		Talk(1,"AnTraiCam3","<color=yellow>K�t Qu� L�n N�y L�<color> <color=red>Tr�i Cam<color>")
	elseif (x == 24) then
		Talk(1,"AnTraiCam4","<color=yellow>K�t Qu� L�n N�y L�<color> <color=red>Tr�i Cam<color>")
		
	elseif (x == 25) then
		Talk(1,"AnTraiDao1","<color=yellow>K�t Qu� L�n N�y L�<color> <color=red>Tr�i ��o<color>")
	elseif (x == 26) then
		Talk(1,"AnTraiDao2","<color=yellow>K�t Qu� L�n N�y L�<color> <color=red>Tr�i ��o<color>")
	elseif (x == 27) then
		Talk(1,"AnTraiDao3","<color=yellow>K�t Qu� L�n N�y L�<color> <color=red>Tr�i ��o<color>")
	elseif (x == 28) then
		Talk(1,"AnTraiDao4","<color=yellow>K�t Qu� L�n N�y L�<color> <color=red>Tr�i ��o<color>")
		
	elseif (x == 29) then
		Talk(1,"AnNaiChuoi1","<color=yellow>K�t Qu� L�n N�y L�<color> <color=red>N�i Chu�i<color>")
	elseif (x == 30) then
		Talk(1,"AnNaiChuoi2","<color=yellow>K�t Qu� L�n N�y L�<color> <color=red>N�i Chu�i<color>")
	elseif (x == 31) then
		Talk(1,"AnNaiChuoi3","<color=yellow>K�t Qu� L�n N�y L�<color> <color=red>N�i Chu�i<color>")
	elseif (x == 32) then
		Talk(1,"AnNaiChuoi4","<color=yellow>K�t Qu� L�n N�y L�<color> <color=red>N�i Chu�i<color>")
		
	elseif (x == 33) then
		Talk(1,"AnTraiDuaHau1","<color=yellow>K�t Qu� L�n N�y L�<color> <color=red>Tr�i D�a H�u<color>")
	elseif (x == 34) then
		Talk(1,"AnTraiDuaHau2","<color=yellow>K�t Qu� L�n N�y L�<color> <color=red>Tr�i D�a H�u<color>")
	elseif (x == 35) then
		Talk(1,"AnTraiDuaHau3","<color=yellow>K�t Qu� L�n N�y L�<color> <color=red>Tr�i D�a H�u<color>")
	elseif (x == 36) then
		Talk(1,"AnTraiDuaHau4","<color=yellow>K�t Qu� L�n N�y L�<color> <color=red>Tr�i D�a H�u<color>")
		
	elseif (x == 37) then
		Talk(1,"AnTraiDuDu1","<color=yellow>K�t Qu� L�n N�y L�<color> <color=red>Tr�i �u ��<color>")
	elseif (x == 38) then
		Talk(1,"AnTraiDuDu2","<color=yellow>K�t Qu� L�n N�y L�<color> <color=red>Tr�i �u ��<color>")
	elseif (x == 39) then
		Talk(1,"AnTraiDuDu3","<color=yellow>K�t Qu� L�n N�y L�<color> <color=red>Tr�i �u ��<color>")
	elseif (x == 40) then
		Talk(1,"AnTraiDuDu4","<color=yellow>K�t Qu� L�n N�y L�<color> <color=red>Tr�i �u ��<color>")
	end
end

function QuayXeng()
	if (HN_GetTaskID(TraiTao) >= 1 or HN_GetTaskID(TraiLe) >= 1 or HN_GetTaskID(TraiBuoi) >= 1 or HN_GetTaskID(TraiSung) >= 1 or HN_GetTaskID(TraiXoai) >= 1 or HN_GetTaskID(TraiCam) >= 1 or HN_GetTaskID(TraiDao) >= 1 or HN_GetTaskID(NaiChuoi) >= 1 or HN_GetTaskID(TraiDuaHau) >= 1 or HN_GetTaskID(TraiDuDu) >= 1) then
		tbProgressBar:OpenByConfig(25, %_GetFruit, {nItemIdx}, %_OnBreak)
	else
		Talk(1,"","<color=red>C�c H� Ch�a ��t C�a N�o")
	end
end
----------------------------------------------------------------Tr�i T�o-------------------------------------------------------------------------------------------------------
function AnTraiTao1()
local nTraiTao = HN_GetTaskID(TraiTao)*2
	if (HN_GetTaskID(TraiTao) >= 1) then
		HN_SetTaskID(nDiemTichLuy,HN_GetTaskID(nDiemTichLuy)+nTraiTao)
		Msg2SubWorld("<color=green>Ch�c M�ng "..GetName().." �� �n ���c Tr�i T�o Nh�n ���c <color=yellow>"..nTraiTao.."<color> �i�m T�ch L�y<color>")
	else
		Msg2Player("Ch�c "..GetName().." May M�n L�n Sau")
	end
	ClearData()
end

function AnTraiTao2()
local nTraiTao = HN_GetTaskID(TraiTao)*4
	if (HN_GetTaskID(TraiTao) >= 1) then
		HN_SetTaskID(nDiemTichLuy,HN_GetTaskID(nDiemTichLuy)+nTraiTao)
		Msg2SubWorld("<color=green>Ch�c M�ng "..GetName().." �� �n ���c Tr�i T�o Nh�n ���c <color=yellow>"..nTraiTao.."<color> �i�m T�ch L�y<color>")
	else
		Msg2Player("Ch�c "..GetName().." May M�n L�n Sau")
	end
	ClearData()
end

function AnTraiTao3()
local nTraiTao = HN_GetTaskID(TraiTao)*6
	if (HN_GetTaskID(TraiTao) >= 1) then
		HN_SetTaskID(nDiemTichLuy,HN_GetTaskID(nDiemTichLuy)+nTraiTao)
		Msg2SubWorld("<color=green>Ch�c M�ng "..GetName().." �� �n ���c Tr�i T�o Nh�n ���c <color=yellow>"..nTraiTao.."<color> �i�m T�ch L�y<color>")
	else
		Msg2Player("Ch�c "..GetName().." May M�n L�n Sau")
	end
	ClearData()
end

function AnTraiTao4()
local nTraiTao = HN_GetTaskID(TraiTao)*8
	if (HN_GetTaskID(TraiTao) >= 1) then
		HN_SetTaskID(nDiemTichLuy,HN_GetTaskID(nDiemTichLuy)+nTraiTao)
		Msg2SubWorld("<color=green>Ch�c M�ng "..GetName().." �� �n ���c Tr�i T�o Nh�n ���c <color=yellow>"..nTraiTao.."<color> �i�m T�ch L�y<color>")
	else
		Msg2Player("Ch�c "..GetName().." May M�n L�n Sau")
	end
	ClearData()
end
----------------------------------------------------------------Tr�i L�------------------------------------------------------------------------------------------------------
function AnTraiLe1()
local nTraiLe = HN_GetTaskID(TraiLe)*2
	if (HN_GetTaskID(TraiLe) >= 1) then
		HN_SetTaskID(nDiemTichLuy,HN_GetTaskID(nDiemTichLuy)+nTraiLe)
		Msg2SubWorld("<color=green>Ch�c M�ng "..GetName().." �� �n ���c Tr�i L� Nh�n ���c <color=yellow>"..nTraiLe.."<color> �i�m T�ch L�y<color>")
	else
		Msg2Player("Ch�c "..GetName().." May M�n L�n Sau")
	end
	ClearData()
end

function AnTraiLe2()
local nTraiLe = HN_GetTaskID(TraiLe)*4
	if (HN_GetTaskID(TraiLe) >= 1) then
		HN_SetTaskID(nDiemTichLuy,HN_GetTaskID(nDiemTichLuy)+nTraiLe)
		Msg2SubWorld("<color=green>Ch�c M�ng "..GetName().." �� �n ���c Tr�i L� Nh�n ���c <color=yellow>"..nTraiLe.."<color> �i�m T�ch L�y<color>")
	else
		Msg2Player("Ch�c "..GetName().." May M�n L�n Sau")
	end
	ClearData()
end

function AnTraiLe3()
local nTraiLe = HN_GetTaskID(TraiLe)*6
	if (HN_GetTaskID(TraiLe) >= 1) then
		HN_SetTaskID(nDiemTichLuy,HN_GetTaskID(nDiemTichLuy)+nTraiLe)
		Msg2SubWorld("<color=green>Ch�c M�ng "..GetName().." �� �n ���c Tr�i L� Nh�n ���c <color=yellow>"..nTraiLe.."<color> �i�m T�ch L�y<color>")
	else
		Msg2Player("Ch�c "..GetName().." May M�n L�n Sau")
	end
	ClearData()
end

function AnTraiLe4()
local nTraiLe = HN_GetTaskID(TraiLe)*8
	if (HN_GetTaskID(TraiLe) >= 1) then
		HN_SetTaskID(nDiemTichLuy,HN_GetTaskID(nDiemTichLuy)+nTraiLe)
		Msg2SubWorld("<color=green>Ch�c M�ng "..GetName().." �� �n ���c Tr�i L� Nh�n ���c <color=yellow>"..nTraiLe.."<color> �i�m T�ch L�y<color>")
	else
		Msg2Player("Ch�c "..GetName().." May M�n L�n Sau")
	end
	ClearData()
end
---------------------------------------------------------------Tr�i B��i-----------------------------------------------------------------------------------------------------
function AnTraiBuoi1()
local nTraiBuoi = HN_GetTaskID(TraiBuoi)*2
	if (HN_GetTaskID(TraiBuoi) >= 1) then
		HN_SetTaskID(nDiemTichLuy,HN_GetTaskID(nDiemTichLuy)+nTraiBuoi)
		Msg2SubWorld("<color=green>Ch�c M�ng "..GetName().." �� �n ���c Tr�i B��i Nh�n ���c <color=yellow>"..nTraiBuoi.."<color> �i�m T�ch L�y<color>")
	else
		Msg2Player("Ch�c "..GetName().." May M�n L�n Sau")
	end
	ClearData()
end

function AnTraiBuoi2()
local nTraiBuoi = HN_GetTaskID(TraiBuoi)*4
	if (HN_GetTaskID(TraiBuoi) >= 1) then
		HN_SetTaskID(nDiemTichLuy,HN_GetTaskID(nDiemTichLuy)+nTraiBuoi)
		Msg2SubWorld("<color=green>Ch�c M�ng "..GetName().." �� �n ���c Tr�i B��i Nh�n ���c <color=yellow>"..nTraiBuoi.."<color> �i�m T�ch L�y<color>")
	else
		Msg2Player("Ch�c "..GetName().." May M�n L�n Sau")
	end
	ClearData()
end

function AnTraiBuoi3()
local nTraiBuoi = HN_GetTaskID(TraiBuoi)*6
	if (HN_GetTaskID(TraiBuoi) >= 1) then
		HN_SetTaskID(nDiemTichLuy,HN_GetTaskID(nDiemTichLuy)+nTraiBuoi)
		Msg2SubWorld("<color=green>Ch�c M�ng "..GetName().." �� �n ���c Tr�i B��i Nh�n ���c <color=yellow>"..nTraiBuoi.."<color> �i�m T�ch L�y<color>")
	else
		Msg2Player("Ch�c "..GetName().." May M�n L�n Sau")
	end
	ClearData()
end

function AnTraiBuoi4()
local nTraiBuoi = HN_GetTaskID(TraiBuoi)*8
	if (HN_GetTaskID(TraiBuoi) >= 1) then
		HN_SetTaskID(nDiemTichLuy,HN_GetTaskID(nDiemTichLuy)+nTraiBuoi)
		Msg2SubWorld("<color=green>Ch�c M�ng "..GetName().." �� �n ���c Tr�i B��i Nh�n ���c <color=yellow>"..nTraiBuoi.."<color> �i�m T�ch L�y<color>")
	else
		Msg2Player("Ch�c "..GetName().." May M�n L�n Sau")
	end
	ClearData()
end
-----------------------------------------------------------------Tr�i Sung-----------------------------------------------------------------------------------------------
function AnTraiSung1()
local nTraiSung = HN_GetTaskID(TraiSung)*2
	if (HN_GetTaskID(TraiSung) >= 1) then
		HN_SetTaskID(nDiemTichLuy,HN_GetTaskID(nDiemTichLuy)+nTraiSung)
		Msg2SubWorld("<color=green>Ch�c M�ng "..GetName().." �� �n ���c Tr�i Sung Nh�n ���c <color=yellow>"..nTraiSung.."<color> �i�m T�ch L�y<color>")
	else
		Msg2Player("Ch�c "..GetName().." May M�n L�n Sau")
	end
	ClearData()
end

function AnTraiSung2()
local nTraiSung = HN_GetTaskID(TraiSung)*4
	if (HN_GetTaskID(TraiSung) >= 1) then
		HN_SetTaskID(nDiemTichLuy,HN_GetTaskID(nDiemTichLuy)+nTraiSung)
		Msg2SubWorld("<color=green>Ch�c M�ng "..GetName().." �� �n ���c Tr�i Sung Nh�n ���c <color=yellow>"..nTraiSung.."<color> �i�m T�ch L�y<color>")
	else
		Msg2Player("Ch�c "..GetName().." May M�n L�n Sau")
	end
	ClearData()
end

function AnTraiSung3()
local nTraiSung = HN_GetTaskID(TraiSung)*6
	if (HN_GetTaskID(TraiSung) >= 1) then
		HN_SetTaskID(nDiemTichLuy,HN_GetTaskID(nDiemTichLuy)+nTraiSung)
		Msg2SubWorld("<color=green>Ch�c M�ng "..GetName().." �� �n ���c Tr�i Sung Nh�n ���c <color=yellow>"..nTraiSung.."<color> �i�m T�ch L�y<color>")
	else
		Msg2Player("Ch�c "..GetName().." May M�n L�n Sau")
	end
	ClearData()
end

function AnTraiSung4()
local nTraiSung = HN_GetTaskID(TraiSung)*8
	if (HN_GetTaskID(TraiSung) >= 1) then
		HN_SetTaskID(nDiemTichLuy,HN_GetTaskID(nDiemTichLuy)+nTraiSung)
		Msg2SubWorld("<color=green>Ch�c M�ng "..GetName().." �� �n ���c Tr�i Sung Nh�n ���c <color=yellow>"..nTraiSung.."<color> �i�m T�ch L�y<color>")
	else
		Msg2Player("Ch�c "..GetName().." May M�n L�n Sau")
	end
	ClearData()
end
-----------------------------------------------------------------Tr�i Xo�i-----------------------------------------------------------------------------------------------------
function AnTraiXoai1()
local nTraiXoai = HN_GetTaskID(TraiXoai)*2
	if (HN_GetTaskID(TraiXoai) >= 1) then
		HN_SetTaskID(nDiemTichLuy,HN_GetTaskID(nDiemTichLuy)+nTraiXoai)
		Msg2SubWorld("<color=green>Ch�c M�ng "..GetName().." �� �n ���c Tr�i Xo�i Nh�n ���c <color=yellow>"..nTraiXoai.."<color> �i�m T�ch L�y<color>")
	else
		Msg2Player("Ch�c "..GetName().." May M�n L�n Sau")
	end
	ClearData()
end

function AnTraiXoai2()
local nTraiXoai = HN_GetTaskID(TraiXoai)*4
	if (HN_GetTaskID(TraiXoai) >= 1) then
		HN_SetTaskID(nDiemTichLuy,HN_GetTaskID(nDiemTichLuy)+nTraiXoai)
		Msg2SubWorld("<color=green>Ch�c M�ng "..GetName().." �� �n ���c Tr�i Xo�i Nh�n ���c <color=yellow>"..nTraiXoai.."<color> �i�m T�ch L�y<color>")
	else
		Msg2Player("Ch�c "..GetName().." May M�n L�n Sau")
	end
	ClearData()
end

function AnTraiXoai3()
local nTraiXoai = HN_GetTaskID(TraiXoai)*6
	if (HN_GetTaskID(TraiXoai) >= 1) then
		HN_SetTaskID(nDiemTichLuy,HN_GetTaskID(nDiemTichLuy)+nTraiXoai)
		Msg2SubWorld("<color=green>Ch�c M�ng "..GetName().." �� �n ���c Tr�i Xo�i Nh�n ���c <color=yellow>"..nTraiXoai.."<color> �i�m T�ch L�y<color>")
	else
		Msg2Player("Ch�c "..GetName().." May M�n L�n Sau")
	end
	ClearData()
end

function AnTraiXoai4()
local nTraiXoai = HN_GetTaskID(TraiXoai)*8
	if (HN_GetTaskID(TraiXoai) >= 1) then
		HN_SetTaskID(nDiemTichLuy,HN_GetTaskID(nDiemTichLuy)+nTraiXoai)
		Msg2SubWorld("<color=green>Ch�c M�ng "..GetName().." �� �n ���c Tr�i Xo�i Nh�n ���c <color=yellow>"..nTraiXoai.."<color> �i�m T�ch L�y<color>")
	else
		Msg2Player("Ch�c "..GetName().." May M�n L�n Sau")
	end
	ClearData()
end
----------------------------------------------------------------------Tr�i Cam----------------------------------------------------------------------------------------------
function AnTraiCam1()
local nTraiCam = HN_GetTaskID(TraiCam)*2
	if (HN_GetTaskID(TraiCam) >= 1) then
		HN_SetTaskID(nDiemTichLuy,HN_GetTaskID(nDiemTichLuy)+nTraiCam)
		Msg2SubWorld("<color=green>Ch�c M�ng "..GetName().." �� �n ���c Tr�i Cam Nh�n ���c <color=yellow>"..nTraiCam.."<color> �i�m T�ch L�y<color>")
	else
		Msg2Player("Ch�c "..GetName().." May M�n L�n Sau")
	end
	ClearData()
end

function AnTraiCam2()
local nTraiCam = HN_GetTaskID(TraiCam)*4
	if (HN_GetTaskID(TraiCam) >= 1) then
		HN_SetTaskID(nDiemTichLuy,HN_GetTaskID(nDiemTichLuy)+nTraiCam)
		Msg2SubWorld("<color=green>Ch�c M�ng "..GetName().." �� �n ���c Tr�i Cam Nh�n ���c <color=yellow>"..nTraiCam.."<color> �i�m T�ch L�y<color>")
	else
		Msg2Player("Ch�c "..GetName().." May M�n L�n Sau")
	end
	ClearData()
end

function AnTraiCam3()
local nTraiCam = HN_GetTaskID(TraiCam)*6
	if (HN_GetTaskID(TraiCam) >= 1) then
		HN_SetTaskID(nDiemTichLuy,HN_GetTaskID(nDiemTichLuy)+nTraiCam)
		Msg2SubWorld("<color=green>Ch�c M�ng "..GetName().." �� �n ���c Tr�i Cam Nh�n ���c <color=yellow>"..nTraiCam.."<color> �i�m T�ch L�y<color>")
	else
		Msg2Player("Ch�c "..GetName().." May M�n L�n Sau")
	end
	ClearData()
end

function AnTraiCam4()
local nTraiCam = HN_GetTaskID(TraiCam)*8
	if (HN_GetTaskID(TraiCam) >= 1) then
		HN_SetTaskID(nDiemTichLuy,HN_GetTaskID(nDiemTichLuy)+nTraiCam)
		Msg2SubWorld("<color=green>Ch�c M�ng "..GetName().." �� �n ���c Tr�i Cam Nh�n ���c <color=yellow>"..nTraiCam.."<color> �i�m T�ch L�y<color>")
	else
		Msg2Player("Ch�c "..GetName().." May M�n L�n Sau")
	end
	ClearData()
end
-----------------------------------------------------------------------Tr�i ��o----------------------------------------------------------------------------------------------
function AnTraiDao1()
local nTraiDao = HN_GetTaskID(TraiDao)*2
	if (HN_GetTaskID(TraiDao) >= 1) then
		HN_SetTaskID(nDiemTichLuy,HN_GetTaskID(nDiemTichLuy)+nTraiDao)
		Msg2SubWorld("<color=green>Ch�c M�ng "..GetName().." �� �n ���c Tr�i ��o Nh�n ���c <color=yellow>"..nTraiDao.."<color> �i�m T�ch L�y<color>")
	else
		Msg2Player("Ch�c "..GetName().." May M�n L�n Sau")
	end
	ClearData()
end

function AnTraiDao2()
local nTraiDao = HN_GetTaskID(TraiDao)*4
	if (HN_GetTaskID(TraiDao) >= 1) then
		HN_SetTaskID(nDiemTichLuy,HN_GetTaskID(nDiemTichLuy)+nTraiDao)
		Msg2SubWorld("<color=green>Ch�c M�ng "..GetName().." �� �n ���c Tr�i ��o Nh�n ���c <color=yellow>"..nTraiDao.."<color> �i�m T�ch L�y<color>")
	else
		Msg2Player("Ch�c "..GetName().." May M�n L�n Sau")
	end
	ClearData()
end

function AnTraiDao3()
local nTraiDao = HN_GetTaskID(TraiDao)*6
	if (HN_GetTaskID(TraiDao) >= 1) then
		HN_SetTaskID(nDiemTichLuy,HN_GetTaskID(nDiemTichLuy)+nTraiDao)
		Msg2SubWorld("<color=green>Ch�c M�ng "..GetName().." �� �n ���c Tr�i ��o Nh�n ���c <color=yellow>"..nTraiDao.."<color> �i�m T�ch L�y<color>")
	else
		Msg2Player("Ch�c "..GetName().." May M�n L�n Sau")
	end
	ClearData()
end

function AnTraiDao4()
local nTraiDao = HN_GetTaskID(TraiDao)*8
	if (HN_GetTaskID(TraiDao) >= 1) then
		HN_SetTaskID(nDiemTichLuy,HN_GetTaskID(nDiemTichLuy)+nTraiDao)
		Msg2SubWorld("<color=green>Ch�c M�ng "..GetName().." �� �n ���c Tr�i ��o Nh�n ���c <color=yellow>"..nTraiDao.."<color> �i�m T�ch L�y<color>")
	else
		Msg2Player("Ch�c "..GetName().." May M�n L�n Sau")
	end
	ClearData()
end
----------------------------------------------------------------------N�i Chu�i---------------------------------------------------------------------------------------------
function AnNaiChuoi1()
local nNaiChuoi = HN_GetTaskID(NaiChuoi)*2
	if (HN_GetTaskID(NaiChuoi) >= 1) then
		HN_SetTaskID(nDiemTichLuy,HN_GetTaskID(nDiemTichLuy)+nNaiChuoi)
		Msg2SubWorld("<color=green>Ch�c M�ng "..GetName().." �� �n ���c Tr�i Chu�i Nh�n ���c <color=yellow>"..nNaiChuoi.."<color> �i�m T�ch L�y<color>")
	else
		Msg2Player("Ch�c "..GetName().." May M�n L�n Sau")
	end
	ClearData()
end

function AnNaiChuoi2()
local nNaiChuoi = HN_GetTaskID(NaiChuoi)*4
	if (HN_GetTaskID(NaiChuoi) >= 1) then
		HN_SetTaskID(nDiemTichLuy,HN_GetTaskID(nDiemTichLuy)+nNaiChuoi)
		Msg2SubWorld("<color=green>Ch�c M�ng "..GetName().." �� �n ���c Tr�i Chu�i Nh�n ���c <color=yellow>"..nNaiChuoi.."<color> �i�m T�ch L�y<color>")
	else
		Msg2Player("Ch�c "..GetName().." May M�n L�n Sau")
	end
	ClearData()
end

function AnNaiChuoi3()
local nNaiChuoi = HN_GetTaskID(NaiChuoi)*6
	if (HN_GetTaskID(NaiChuoi) >= 1) then
		HN_SetTaskID(nDiemTichLuy,HN_GetTaskID(nDiemTichLuy)+nNaiChuoi)
		Msg2SubWorld("<color=green>Ch�c M�ng "..GetName().." �� �n ���c Tr�i Chu�i Nh�n ���c <color=yellow>"..nNaiChuoi.."<color> �i�m T�ch L�y<color>")
	else
		Msg2Player("Ch�c "..GetName().." May M�n L�n Sau")
	end
	ClearData()
end

function AnNaiChuoi4()
local nNaiChuoi = HN_GetTaskID(NaiChuoi)*8
	if (HN_GetTaskID(NaiChuoi) >= 1) then
		HN_SetTaskID(nDiemTichLuy,HN_GetTaskID(nDiemTichLuy)+nNaiChuoi)
		Msg2SubWorld("<color=green>Ch�c M�ng "..GetName().." �� �n ���c Tr�i Chu�i Nh�n ���c <color=yellow>"..nNaiChuoi.."<color> �i�m T�ch L�y<color>")
	else
		Msg2Player("Ch�c "..GetName().." May M�n L�n Sau")
	end
	ClearData()
end
-----------------------------------------------------------------Tr�i D�a H�u----------------------------------------------------------------------------------------------
function AnTraiDuaHau1()
local nTraiDuaHau = HN_GetTaskID(TraiDuaHau)*2
	if (HN_GetTaskID(TraiDuaHau) >= 1) then
		HN_SetTaskID(nDiemTichLuy,HN_GetTaskID(nDiemTichLuy)+nTraiDuaHau)
		Msg2SubWorld("<color=green>Ch�c M�ng "..GetName().." �� �n ���c Tr�i D�a H�u Nh�n ���c <color=yellow>"..nTraiDuaHau.."<color> �i�m T�ch L�y<color>")
	else
		Msg2Player("Ch�c "..GetName().." May M�n L�n Sau")
	end
	ClearData()
end

function AnTraiDuaHau2()
local nTraiDuaHau = HN_GetTaskID(TraiDuaHau)*4
	if (HN_GetTaskID(TraiDuaHau) >= 1) then
		HN_SetTaskID(nDiemTichLuy,HN_GetTaskID(nDiemTichLuy)+nTraiDuaHau)
		Msg2SubWorld("<color=green>Ch�c M�ng "..GetName().." �� �n ���c Tr�i D�a H�u Nh�n ���c <color=yellow>"..nTraiDuaHau.."<color> �i�m T�ch L�y<color>")
	else
		Msg2Player("Ch�c "..GetName().." May M�n L�n Sau")
	end
	ClearData()
end

function AnTraiDuaHau3()
local nTraiDuaHau = HN_GetTaskID(TraiDuaHau)*6
	if (HN_GetTaskID(TraiDuaHau) >= 1) then
		HN_SetTaskID(nDiemTichLuy,HN_GetTaskID(nDiemTichLuy)+nTraiDuaHau)
		Msg2SubWorld("<color=green>Ch�c M�ng "..GetName().." �� �n ���c Tr�i D�a H�u Nh�n ���c <color=yellow>"..nTraiDuaHau.."<color> �i�m T�ch L�y<color>")
	else
		Msg2Player("Ch�c "..GetName().." May M�n L�n Sau")
	end
	ClearData()
end

function AnTraiDuaHau4()
local nTraiDuaHau = HN_GetTaskID(TraiDuaHau)*8
	if (HN_GetTaskID(TraiDuaHau) >= 1) then
		HN_SetTaskID(nDiemTichLuy,HN_GetTaskID(nDiemTichLuy)+nTraiDuaHau)
		Msg2SubWorld("<color=green>Ch�c M�ng "..GetName().." �� �n ���c Tr�i D�a H�u Nh�n ���c <color=yellow>"..nTraiDuaHau.."<color> �i�m T�ch L�y<color>")
	else
		Msg2Player("Ch�c "..GetName().." May M�n L�n Sau")
	end
	ClearData()
end
---------------------------------------------------------------Tr�i �u ��-------------------------------------------------------------------------------------------------------
function AnTraiDuDu1()
local nTraiDuDu = HN_GetTaskID(TraiDuDu)*2
	if (HN_GetTaskID(TraiDuDu) >= 1) then
		HN_SetTaskID(nDiemTichLuy,HN_GetTaskID(nDiemTichLuy)+nTraiDuDu)
		Msg2SubWorld("<color=green>Ch�c M�ng "..GetName().." �� �n ���c Tr�i �u �� Nh�n ���c <color=yellow>"..nTraiDuDu.."<color> �i�m T�ch L�y<color>")
	else
		Msg2Player("Ch�c "..GetName().." May M�n L�n Sau")
	end
	ClearData()
end

function AnTraiDuDu2()
local nTraiDuDu = HN_GetTaskID(TraiDuDu)*4
	if (HN_GetTaskID(TraiDuDu) >= 1) then
		HN_SetTaskID(nDiemTichLuy,HN_GetTaskID(nDiemTichLuy)+nTraiDuDu)
		Msg2SubWorld("<color=green>Ch�c M�ng "..GetName().." �� �n ���c Tr�i �u �� Nh�n ���c <color=yellow>"..nTraiDuDu.."<color> �i�m T�ch L�y<color>")
	else
		Msg2Player("Ch�c "..GetName().." May M�n L�n Sau")
	end
	ClearData()
end

function AnTraiDuDu3()
local nTraiDuDu = HN_GetTaskID(TraiDuDu)*6
	if (HN_GetTaskID(TraiDuDu) >= 1) then
		HN_SetTaskID(nDiemTichLuy,HN_GetTaskID(nDiemTichLuy)+nTraiDuDu)
		Msg2SubWorld("<color=green>Ch�c M�ng "..GetName().." �� �n ���c Tr�i �u �� Nh�n ���c <color=yellow>"..nTraiDuDu.."<color> �i�m T�ch L�y<color>")
	else
		Msg2Player("Ch�c "..GetName().." May M�n L�n Sau")
	end
	ClearData()
end

function AnTraiDuDu4()
local nTraiDuDu = HN_GetTaskID(TraiDuDu)*8
	if (HN_GetTaskID(TraiDuDu) >= 1) then
		HN_SetTaskID(nDiemTichLuy,HN_GetTaskID(nDiemTichLuy)+nTraiDuDu)
		Msg2SubWorld("<color=green>Ch�c M�ng "..GetName().." �� �n ���c Tr�i �u �� Nh�n ���c <color=yellow>"..nTraiDuDu.."<color> �i�m T�ch L�y<color>")
	else
		Msg2Player("Ch�c "..GetName().." May M�n L�n Sau")
	end
	ClearData()
end
---------------------------------------------------------------------------------------------------------------------------------------------------------------------
function ClearData()
	for i = 14,23 do
		HN_SetTaskID(i,0)
	end
end
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------