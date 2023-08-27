Include("\\script\\dailogsys\\dailogsay.lua")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\activitysys\\npcdailog.lua")
--Include("\\script\\update_feature\\songbac\\npc_choixeng.lua")
Include("\\script\\lib\\log.lua")
--------------------------------------------------------
tbSongBac = {}
tbSongBac.TienXu	 = 12								 --Task Xu
tbSongBac.TiLeWin	 = 30								 --T� L� Win Cho T�i X�u - Ch�n L�
tbSongBac.Member	 = 25								 --T� L� Cho Member Win O�n T� T�
tbSongBac.Balane	 = 15								 --T� L� 2 B�n H�a Nhau O�n T� T�
tbSongBac.ChuSongBac	 = 60								 --T� L� Cho Admin Win O�n T� T�
tbSongBac.MaxCount	 = 1000							 --Gi�i H�n Xu Tham Gia Ch�i
tbSongBac.StartTime	 = 1							 --Th�i Gian M� C�a
tbSongBac.EndTime	 = 9999							 --Th�i Gian K�t Th�c
tbSongBac.TimeChat = "Th�i Gian M� C�a T� <color=red>08h:00<color> ��n <color=red>22h:00<color> H�ng Ng�y"

tbSongBac.FormulaList = {
	[1]={szName="Ta Mu�n Ch�i B�u Cua"},
	[2]={szName="Ta Mu�n Ch�i T�i X�u"},
	[3]={szName="Ta Mu�n Ch�i Ch�n L�"},
	[4]={szName="Ta Mu�n Ch�i O�n T� T�"},
	[5]={szName="Ta Mu�n Ch�i ��nh X�ng"},
}

tbSongBac.SelecList = {
	[1]={szName="Xem Th�ng Tin ��t C�a"},
	[2]={szName="Ta Mu�n Ch�i 1 V�n"},
	[3]={szName="T�i"},
	[4]={szName="X�u"},
	[5]={szName="Ch�n"},
	[6]={szName="L�"},
	[7]={szName="K�o"},
	[8]={szName="B�a"},
	[9]={szName="Bao"},
	[10]={szName="Xem K�t Qu� ��t C��c"},
	[11]={szName="Ta Mu�n Th� 1 V�n Xem Sao"},
	[12]={szName="N�p X�ng"},
	[13]={szName="Ta Mu�n R�t X�ng"},
	[14]={szName="Ta Mu�n B�n X�ng"},
	[15]={szName="Ta Mu�n Mua X�ng"},
}
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function tbSongBac:ThamGia()
local nTimes = tonumber(GetLocalDate("%H%M"))
local szTitle = "Xin Ch�o! Ta M� S�ng B�c �� Nhi�u N�m R�i, Kh�ng Bi�t\nC� Bao Nhi�u Anh H�ng Hi�p S� V�o ��y Th�ch ��u Vui\nCh�i Gi�i Tr� C� Th��ng, Ng��i C� Mu�n Th� 1 V�n Kh�ng Bi�t ��u ��i ��i."
	if (ChuSongBac == 1) then
		if (nTimes >= self.StartTime and nTimes < self.EndTime) then
			local tbOpt = {
				{self.FormulaList[1].szName, tbSongBac.BauCua, {tbSongBac}},
				{self.FormulaList[2].szName, tbSongBac.TaiXiu, {tbSongBac}},
				{self.FormulaList[3].szName, tbSongBac.ChanLe, {tbSongBac}},
				{self.FormulaList[4].szName, tbSongBac.DatCuocXu, {tbSongBac}},
				{self.FormulaList[5].szName, tbSongBac.ChoiXeng, {tbSongBac}},
				{"Th�i Ta Kh�ng Ch�i N�a"},
			}
			CreateNewSayEx(szTitle, tbOpt)
		else
			Talk(1,"","<color=yellow>"..self.TimeChat.."<color>")
		end
	else
		Talk(1,"","<color=red>T�nh N�ng N�y �� T�m ��ng<color>")
	end
end
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------Ch�i B�u Cua----------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function tbSongBac:BauCua()
	local szTitle = "C�c H� H�y Ch�n C�a N�o"
	local tbOpt = {
		{self.SelecList[1].szName, showFishGate},
		{self.SelecList[2].szName, OnChoseKind},
		{"H�y B�"},
	}
	CreateNewSayEx(szTitle, tbOpt)
end
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------Ch�i T�i X�u-----------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function tbSongBac:TaiXiu()
	local szTitle = "C�c H� H�y Ch�n C�a N�o"
	local tbOpt = {
		{self.SelecList[3].szName, tbSongBac.DatCuocTai, {tbSongBac}},
		{self.SelecList[4].szName, tbSongBac.DatCuocXiu, {tbSongBac}},
		{"H�y B�"},
	}
	CreateNewSayEx(szTitle, tbOpt)
end
-------------------------------T�i----------------------------------------------------->>
function tbSongBac:DatCuocTai()
	AskClientForNumber("DatCuocTai",0,self.MaxCount,"Xu ��t C��c")
end
	
function DatCuocTai(num)
local nTienXu = HN_GetTaskID(tbSongBac.TienXu)
local nXu = CalcEquiproomItemCount(4,417,1,1)
	if (nXu >= 1) then
		if (nXu >= num) then
			ConsumeEquiproomItem(num,4,417,1,-1) HN_SetTaskID(tbSongBac.TienXu,nTienXu+num)
			Talk(1,"KetQuaTai","<color=yellow>"..GetName().." <color=green>�� ��t C��c <color=red>"..num.."<color> Xu<color> Ch�n [<color=fire>T�i<color>]")
		else
			Talk(1,"","C�c H� Kh�ng �� Ti�n ��t C��c ��nh L�a Ta H�")
		end
	else
		Talk(1,"","Ng��i Kh�ng C� Ti�n M� D�m Ch�i S�ng B�c H�")
	end	
end

function KetQuaTai()
	local tbAward = {
		{nRate = tbSongBac.TiLeWin,
			pFun = function (nItemCount, szLogTitle)
				Talk(1,"Win","<color=green>K�t Qu� L�n N�y: [<color=fire>T�i<color>]")
			end,
		},
		{nRate = 100-tbSongBac.TiLeWin,
			pFun = function (nItemCount, szLogTitle)
				Talk(1,"close","<color=green>K�t Qu� L�n N�y: [<color=fire>X�u<color>]")
			end,
		},
	}
	tbAwardTemplet:GiveAwardByList(tbAward,1)
end
------------------------------X�u-------------------------------------------------->>
function tbSongBac:DatCuocXiu()
	AskClientForNumber("DatCuocXiu",0,self.MaxCount,"Xu ��t C��c")
end
	
function DatCuocXiu(num)
local nTienXu = HN_GetTaskID(tbSongBac.TienXu)
local nXu = CalcEquiproomItemCount(4,417,1,1)
	if (nXu >= 1) then
		if (nXu >= num) then
			ConsumeEquiproomItem(num,4,417,1,-1) HN_SetTaskID(tbSongBac.TienXu,nTienXu+num)
			Talk(1,"KetQuaXiu","<color=yellow>"..GetName().." <color=green>�� ��t C��c <color=red>"..num.."<color> Xu<color> Ch�n [<color=fire>X�u<color>]")
		else
			Talk(1,"","C�c H� Kh�ng �� Ti�n ��t C��c ��nh L�a Ta H�")
		end
	else
		Talk(1,"","Ng��i Kh�ng C� Ti�n M� D�m Ch�i S�ng B�c H�")
	end	
end

function KetQuaXiu()
	local tbAward = {
		{nRate = tbSongBac.TiLeWin,
			pFun = function (nItemCount, szLogTitle)
				Talk(1,"Win","<color=green>K�t Qu� L�n N�y: [<color=fire>X�u<color>]")
			end,
		},
		{nRate = 100-tbSongBac.TiLeWin,
			pFun = function (nItemCount, szLogTitle)
				Talk(1,"close","<color=green>K�t Qu� L�n N�y: [<color=fire>T�i<color>]")
			end,
		},
	}
	tbAwardTemplet:GiveAwardByList(tbAward,1)
end
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------Ch�i T�i X�u-----------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function tbSongBac:ChanLe()
	local szTitle = "C�c H� H�y Ch�n C�a N�o Ch�n H�y L�"
	local tbOpt = {
		{self.SelecList[5].szName, tbSongBac.DatCuocChan, {tbSongBac}},
		{self.SelecList[6].szName, tbSongBac.DatCuocLe, {tbSongBac}},
		{"H�y B�"},
	}
	CreateNewSayEx(szTitle, tbOpt)
end
-------------------------------Ch�n----------------------------------------------------->>
function tbSongBac:DatCuocChan()
	AskClientForNumber("DatCuocChan",0,self.MaxCount,"Xu ��t C��c")
end
	
function DatCuocChan(num)
local nTienXu = HN_GetTaskID(tbSongBac.TienXu)
local nXu = CalcEquiproomItemCount(4,417,1,1)
	if (nXu >= 1) then
		if (nXu >= num) then
			ConsumeEquiproomItem(num,4,417,1,-1) HN_SetTaskID(tbSongBac.TienXu,nTienXu+num)
			Talk(1,"KetQuaChan","<color=yellow>"..GetName().." <color=green>�� ��t C��c <color=red>"..num.."<color> Xu<color> Ch�n [<color=fire>Ch�n<color>]")
		else
			Talk(1,"","C�c H� Kh�ng �� Ti�n ��t C��c ��nh L�a Ta H�")
		end
	else
		Talk(1,"","Ng��i Kh�ng C� Ti�n M� D�m Ch�i S�ng B�c H�")
	end
end

function KetQuaChan()
	local tbAward = {
		{nRate = tbSongBac.TiLeWin,
			pFun = function (nItemCount, szLogTitle)
				Talk(1,"Win","<color=green>K�t Qu� L�n N�y: [<color=fire>Ch�n<color>]")
			end,
		},
		{nRate = 100-tbSongBac.TiLeWin,
			pFun = function (nItemCount, szLogTitle)
				Talk(1,"close","<color=green>K�t Qu� L�n N�y: [<color=fire>L�<color>]")
			end,
		},
	}
	tbAwardTemplet:GiveAwardByList(tbAward,1)
end
------------------------------L�-------------------------------------------------->>
function tbSongBac:DatCuocLe()
	AskClientForNumber("DatCuocLe",0,self.MaxCount,"Xu ��t C��c")
end
	
function DatCuocLe(num)
local nTienXu = HN_GetTaskID(tbSongBac.TienXu)
local nXu = CalcEquiproomItemCount(4,417,1,1)
	if (nXu >= 1) then
		if (nXu >= num) then
			ConsumeEquiproomItem(num,4,417,1,-1) HN_SetTaskID(tbSongBac.TienXu,nTienXu+num)
			Talk(1,"KetQuaLe","<color=yellow>"..GetName().." <color=green>�� ��t C��c <color=red>"..num.."<color> Xu<color> Ch�n [<color=fire>L�<color>]")
		else
			Talk(1,"","C�c H� Kh�ng �� Ti�n ��t C��c ��nh L�a Ta H�")
		end
	else
		Talk(1,"","Ng��i Kh�ng C� Ti�n M� D�m Ch�i S�ng B�c H�")
	end
end

function KetQuaLe()
	local tbAward = {
		{nRate = tbSongBac.TiLeWin,
			pFun = function (nItemCount, szLogTitle)
				Talk(1,"Win","<color=green>K�t Qu� L�n N�y: [<color=fire>L�<color>]")
			end,
		},
		{nRate = 100-tbSongBac.TiLeWin,
			pFun = function (nItemCount, szLogTitle)
				Talk(1,"close","<color=green>K�t Qu� L�n N�y: [<color=fire>Ch�n<color>]")
			end,
		},
	}
	tbAwardTemplet:GiveAwardByList(tbAward,1)
end
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------Ch�i O�n T� T�-----------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function tbSongBac:DatCuocXu()
	AskClientForNumber("DatCuocXu",0,self.MaxCount,"Xu ��t C��c")
end
	
function DatCuocXu(num)
local nTienXu = HN_GetTaskID(tbSongBac.TienXu)
local nXu = CalcEquiproomItemCount(4,417,1,1)
	if (nXu >= 1) then
		if (nXu >= num) then
			ConsumeEquiproomItem(num,4,417,1,-1) HN_SetTaskID(tbSongBac.TienXu,nTienXu+num)
			Talk(1,"OanTuTi","<color=yellow>"..GetName().." <color=green>�� ��t C��c <color=red>"..num.."<color> Xu<color> Tham Gia Ch�i O�n T� T�")
		else
			Talk(1,"","C�c H� Kh�ng �� Ti�n ��t C��c ��nh L�a Ta H�")
		end
	else
		Talk(1,"","Ng��i Kh�ng C� Ti�n M� D�m Ch�i S�ng B�c H�")
	end
end

function OanTuTi()
	local szTitle = "N�o B�t ��u Ch�i N�o 1,2,3 Ra C�i G� Ra C�i N�y"
	local tbOpt = {
		{tbSongBac.SelecList[7].szName, DatCuocKeo},
		{tbSongBac.SelecList[8].szName, DatCuocBua},
		{tbSongBac.SelecList[9].szName, DatCuocBao},
		{"H�y B�"},
	}
	CreateNewSayEx(szTitle, tbOpt)
end

function DatCuocKeo()
	local tbAward = {
		{nRate = tbSongBac.Member,
			pFun = function (nItemCount, szLogTitle)
				Talk(2,"Win","<color=green>"..GetName().." Ch�n [<color=fire>K�o<color>]\n\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\tVS\n\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\tCh� S�ng B�c Ch�n [<color=fire>Bao<color>]","<color=green>"..GetName().." �� D�nh Th�ng Cu�c")
			end,
		},
		{nRate = tbSongBac.Balane,
			pFun = function (nItemCount, szLogTitle)
				Talk(2,"ChoiLai","<color=green>"..GetName().." Ch�n [<color=fire>K�o<color>]\n\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\tVS\n\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\tCh� S�ng B�c Ch�n [<color=fire>K�o<color>]","<color=green>2 B�n H�a Nhau Ta Ch�i L�i Nh�")
			end,
		},
		{nRate = tbSongBac.ChuSongBac,
			pFun = function (nItemCount, szLogTitle)
				Talk(2,"close","<color=green>"..GetName().." Ch�n [<color=fire>K�o<color>]\n\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\tVS\n\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\tCh� S�ng B�c Ch�n [<color=fire>B�a<color>]","<color=green>Ch� S�ng B�i �� D�nh Th�ng Cu�c")
			end,
		},
	}
	tbAwardTemplet:GiveAwardByList(tbAward,1)
end

function DatCuocBua()
	local tbAward = {
		{nRate = tbSongBac.Member,
			pFun = function (nItemCount, szLogTitle)
				Talk(2,"Win","<color=green>"..GetName().." Ch�n [<color=fire>B�a<color>]\n\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\tVS\n\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\tCh� S�ng B�c Ch�n [<color=fire>K�o<color>]","<color=green>"..GetName().." �� D�nh Th�ng Cu�c")
			end,
		},
		{nRate = tbSongBac.Balane,
			pFun = function (nItemCount, szLogTitle)
				Talk(2,"ChoiLai","<color=green>"..GetName().." Ch�n [<color=fire>B�a<color>]\n\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\tVS\n\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\tCh� S�ng B�c Ch�n [<color=fire>B�a<color>]","<color=green>2 B�n H�a Nhau Ta Ch�i L�i Nh�")
			end,
		},
		{nRate = tbSongBac.ChuSongBac,
			pFun = function (nItemCount, szLogTitle)
				Talk(2,"close","<color=green>"..GetName().." Ch�n [<color=fire>B�a<color>]\n\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\tVS\n\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\tCh� S�ng B�c Ch�n [<color=fire>Bao<color>]","<color=green>Ch� S�ng B�i �� D�nh Th�ng Cu�c")
			end,
		},
	}
	tbAwardTemplet:GiveAwardByList(tbAward,1)
end

function DatCuocBao()
	local tbAward = {
		{nRate = tbSongBac.Member,
			pFun = function (nItemCount, szLogTitle)
				Talk(2,"Win","<color=green>"..GetName().." Ch�n [<color=fire>Bao<color>]\n\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\tVS\n\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\tCh� S�ng B�c Ch�n [<color=fire>B�a<color>]","<color=green>"..GetName().." �� D�nh Th�ng Cu�c")
			end,
		},
		{nRate = tbSongBac.Balane,
			pFun = function (nItemCount, szLogTitle)
				Talk(2,"ChoiLai","<color=green>"..GetName().." Ch�n [<color=fire>Bao<color>]\n\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\tVS\n\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\tCh� S�ng B�c Ch�n [<color=fire>Bao<color>]","<color=green>2 B�n H�a Nhau Ta Ch�i L�i Nh�")
			end,
		},
		{nRate = tbSongBac.ChuSongBac,
			pFun = function (nItemCount, szLogTitle)
				Talk(2,"close","<color=green>"..GetName().." Ch�n [<color=fire>Bao<color>]\n\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\tVS\n\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\tCh� S�ng B�c Ch�n [<color=fire>K�o<color>]","<color=green>Ch� S�ng B�i �� D�nh Th�ng Cu�c")
			end,
		},
	}
	tbAwardTemplet:GiveAwardByList(tbAward,1)
end
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------Ch�i X�ng-----------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function tbSongBac:ChoiXeng()
	local tbOpt = {
		{self.SelecList[10].szName, XemKetQua},
		{self.SelecList[11].szName, ChoiNgay},
		{self.SelecList[12].szName, NapXeng},
		{self.SelecList[13].szName, RutXeng},
		{self.SelecList[14].szName, DoiXeng},
		{self.SelecList[15].szName, MuaXeng},
		{"H�y B�"},
	}
	CreateNewSayEx("<color=yellow>C�c H� Hi�n �ang C�: <color=red>"..HN_GetTaskID(nDiemTichLuy).."<color> �i�m T�ch L�y\nC� Mu�n Th� V�n V�n May Kh�ng Bi�t ��u ��i ��i<color>", tbOpt)
end
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------K�t Qu� Trao Th��ng-----------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function Win()
local tbXu = HN_GetTaskID(tbSongBac.TienXu)*2
tbAwardTemplet:GiveAwardByList({tbProp={4,417,1,1,0,0},nCount=tbXu},1) HN_SetTaskID(tbSongBac.TienXu,0)
Msg2SubWorld("Ch�c M�ng "..GetName().." �� Th�ng Ch� S�ng B�i Nh�n ���c "..tbXu.." Xu")
logplayer("dulieu/songbac.txt",""..GetAccount().."  "..GetName().."\t "..tonumber(GetLocalDate("%Y%m%d%H%M")).."   "..GetIP().."\t �� Th�ng Ch� S�ng B�i Nh�n ���c "..tbXu.." Ti�n Xu")
end

function ChoiLai()
local tbXu = HN_GetTaskID(tbSongBac.TienXu)
tbAwardTemplet:GiveAwardByList({tbProp={4,417,1,1,0,0},nCount=tbXu},1) HN_SetTaskID(tbSongBac.TienXu,0) Msg2Player("2 B�n H�a Nhau "..GetName().." Nh�n L�i Ti�n Xu")
end

function close()
Msg2SubWorld("Ha...Ha...! Ng��i �� Thua R�i.") HN_SetTaskID(tbSongBac.TienXu,0)
logplayer("dulieu/songbac.txt",""..GetAccount().."  "..GetName().."\t "..tonumber(GetLocalDate("%Y%m%d%H%M")).."   "..GetIP().."\t �� Thua Ch� S�ng B�i")
end

function logplayer(zFile,szMsg)
	local handle = openfile(zFile,"a")
	write(handle,format("%s\n",szMsg));
	closefile(handle);
end

function main()
dofile("script/global/dicegame.lua")
tbSongBac:ThamGia()
end;
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------