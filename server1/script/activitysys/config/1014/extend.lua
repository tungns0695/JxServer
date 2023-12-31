Include("\\script\\activitysys\\config\\1014\\head.lua");
Include("\\script\\activitysys\\config\\1014\\variables.lua");
Include("\\script\\activitysys\\config\\1014\\awardlist.lua");
Include("\\script\\activitysys\\config\\1014\\materiallist.lua");
Include("\\script\\dailogsys\\dailogsay.lua");
Include("\\script\\lib\\awardtemplet.lua");
IncludeLib("SETTING");

pActivity.nPak = curpack()

function pActivity:IsOpen()
	local nCurDate = tonumber(GetLocalDate("%Y%m%d%H%M"));
	if (nCurDate >= self.nStartDate and nCurDate < self.nEndDate) then
		return 1;
	else
		return 0;
	end
end
--Npc d飊g  thu th藀 Hoa Tri 
function pActivity:Init()
	self:LoadDataFromConfig();
	self:AddGatherObj();
--	self:InitComposeMaterial4();
end

pActivity.tbObjPos = {}
function pActivity:LoadDataFromConfig()
	if (TabFile_Load(POSPATH_CAIJI, POSPATH_CAIJI) == 0) then
		print("Load TabFile Error!"..szPosPath)
		return 0
	end
	local nTotalRow = TabFile_GetRowCount(POSPATH_CAIJI)
	
	self.tbObjPos = {}
	for nRow = 2, nTotalRow do
		local tbPos = {}	
		tbPos.nMapId = tonumber(TabFile_GetCell(POSPATH_CAIJI, nRow, "MapId"));
		tbPos.nX = tonumber(TabFile_GetCell(POSPATH_CAIJI, nRow, "X"));
		tbPos.nY = tonumber(TabFile_GetCell(POSPATH_CAIJI, nRow, "Y"));
		tbPos.nNpcRes = tonumber(TabFile_GetCell(POSPATH_CAIJI, nRow, "NpcRes"));
		tbPos.szObjName = TabFile_GetCell(POSPATH_CAIJI, nRow, "NpcName");
		tbPos.szNpcScript = TabFile_GetCell(POSPATH_CAIJI, nRow, "NpcScript");
		tinsert(self.tbObjPos, tbPos)
	end
	return 1;
end

function pActivity:AddGatherObj()
	for i=1,getn(self.tbObjPos) do
		local tbPos = self.tbObjPos[i];
		local nNpcIdx = AddNpc(tbPos.nNpcRes, 1, SubWorldID2Idx(tbPos.nMapId), tbPos.nX * 32, tbPos.nY * 32, 0, tbPos.szObjName);
		if (nNpcIdx ~= nil and nNpcIdx > 0) then
			SetNpcScript(nNpcIdx, tbPos.szNpcScript);
		end
	end
	return 1;
end

function pActivity:UseAward1()
	local nCnt_Award1 = tbVNG_BitTask_Lib:getBitTask(%TSK_USE_AWARD1)
	if (nCnt_Award1 < 0) then
		return
	end
	%tbVNG_BitTask_Lib:addTask(%TSK_USE_AWARD1, 1)	
	nCnt_Award1 = nCnt_Award1 + 1;
	PlayerFunLib:AddExp(%EXP_AWARD1, 1, %EVENT_LOG_TITLE, format("SuDung%dSachLichSu",nCnt_Award1));
end

function pActivity:UseAward2()
	local nCnt_Award2 = tbVNG_BitTask_Lib:getBitTask(%TSK_USE_AWARD2)
	if (nCnt_Award2 < 0) then
		return
	end
	%tbVNG_BitTask_Lib:addTask(%TSK_USE_AWARD2, 1)	
	nCnt_Award2 = nCnt_Award2 + 1;
	PlayerFunLib:AddExp(%EXP_AWARD2, 1,%EVENT_LOG_TITLE, "SuDungSachDiaLyNhanExp")
	if (mod(nCnt_Award2, 100) == 0) then
		tbAwardTemplet:Give(%tbAward_B, 1, {%EVENT_LOG_TITLE, format("SuDung%dSachDiaLyNhanAwardSpecial",nCnt_Award2)});
		if (%tbAward_D1[nCnt_Award2]) then
			tbAwardTemplet:Give(%tbAward_D1[nCnt_Award2], 1, {%EVENT_LOG_TITLE, format("SuDung%dSachDiaLyNhanAwardC",nCnt_Award2)});
		end
	elseif mod(nCnt_Award2,30) == 0 then
		tbAwardTemplet:Give(%tbAward_C, 1, {%EVENT_LOG_TITLE, format("SuDung%dSachDiaLyNhanAwardDatMoc",nCnt_Award2)});
	else
		tbAwardTemplet:Give(%tbAward_A1, 1, {%EVENT_LOG_TITLE, format("SuDung%dSachDiaLyNhanAwardThuong", nCnt_Award2)})
	end
end

function pActivity:UseAward3()
	local nCnt_Award3 = tbVNG_BitTask_Lib:getBitTask(%TSK_USE_AWARD3)
	if (nCnt_Award3 < 0) then
		return
	end
	%tbVNG_BitTask_Lib:addTask(%TSK_USE_AWARD3, 1)	
	nCnt_Award3 = nCnt_Award3 + 1;
	PlayerFunLib:AddExp(%EXP_AWARD3, 1, %EVENT_LOG_TITLE, format("SuDung%dSachVanHoc",nCnt_Award3));
end

function pActivity:UseAward4(nNumber)
	local nCnt_Award4 = tbVNG_BitTask_Lib:getBitTask(%TSK_USE_AWARD4)
	if (nCnt_Award4 < 0) then
		return
	end
	%tbVNG_BitTask_Lib:addTask(%TSK_USE_AWARD4, 1)	
	nCnt_Award4 = nCnt_Award4 + 1;
	if nNumber == 1 then
		tbAwardTemplet:Give(%tbAward_VExp, 1, {%EVENT_LOG_TITLE, format("SuDung%dBoHoaMauDoNhanNgauNhienExp",nCnt_Award4)});
	else
		PlayerFunLib:AddExp(%EXP_AWARD4, 1, %EVENT_LOG_TITLE, format("SuDung%dBoHoaHongMauXanh",nCnt_Award4));
	end
end

function pActivity:UseAward6()
	local nCnt_Award6 = tbVNG_BitTask_Lib:getBitTask(%TSK_USE_AWARD6)
	if (nCnt_Award6 < 0) then
		return
	end
	%tbVNG_BitTask_Lib:addTask(%TSK_USE_AWARD6, 1)	
	nCnt_Award6 = nCnt_Award6 + 1;
	PlayerFunLib:AddExp(%EXP_AWARD6, 1,%EVENT_LOG_TITLE, "SuDungBoHoaMauVangNhanExp")
	if (mod(nCnt_Award6, 100) == 0) then
		tbAwardTemplet:Give(%tbAward_VB, 1, {%EVENT_LOG_TITLE, format("SuDung%dBoHoaMauVang",nCnt_Award6)});
		if (%tbAward_VD[nCnt_Award6]) then
			tbAwardTemplet:Give(%tbAward_VD[nCnt_Award6], 1, {%EVENT_LOG_TITLE, format("SuDungBoHoaMauVangNhanAwardCLanThu%d",nCnt_Award6)});
		end
	else
		tbAwardTemplet:Give(%tbAward_VA, 1, {%EVENT_LOG_TITLE, format("SuDung%dBoHoaMauVang", nCnt_Award6)})
	end
end

function pActivity:ResetTask()
	local nNowDate = tonumber(GetLocalDate("%Y%m%d"))
	local nVal1 = tbVNG_BitTask_Lib:getBitTask({nTaskID = 2925,nStartBit = 26,nBitCount = 1,nMaxValue = 1})
	if nVal1 ~= 1 and  nNowDate <= 20121131 then
		for i = 1, 24 do
 			tbVNG_BitTask_Lib:setBitTask({nTaskID = 2925,nStartBit = i,nBitCount = 1,nMaxValue = 1}, 0)
 		end
	 	for i =2923, 2928 do
	 		if i ~= 2925 then
	 			SetTask(i,0)
	 		end
	 	end
	 	tbVNG_BitTask_Lib:setBitTask({nTaskID = 2925,nStartBit = 26,nBitCount = 1,nMaxValue = 1}, 1)
	end
end
function pActivity:PlayerOnLogin()
	local nDate = GetTask(%TSK_LAST_ONLINEDATA)
	local nNowDate = tonumber(GetLocalDate("%Y%m%d"))
	local nCount = 0
	if nDate ~= nNowDate then	-- 与最近记录不是同一天
		nCurrentOnLineTime = GetGameTime()
		SetTask(%TSK_LAST_ONLINETIME,nCurrentOnLineTime)
		SetTask(%TSK_LAST_ONLINEDATA,nNowDate)
	end
	--Reset task d飊g l筰 c馻 event tinh nh﹏
	self:ResetTask()
end

function pActivity:GetOnlineAward()
	local nDate = GetTask(%TSK_LAST_ONLINEDATA)
	local nNowDate = tonumber(GetLocalDate("%Y%m%d"))
	local nHour = 0
	local nCurrentOnLineTime = 0
	local nLastOnLineTime = 0
	local nCount = 0
	if nDate == nNowDate then	-- 最近一次记录的时间和领取时间是同一天
		nLastOnLineTime = GetTask(%TSK_LAST_ONLINETIME)
		nCurrentOnLineTime = GetGameTime()
		-- 根据时间差可获得的个数
		nHour = floor((nCurrentOnLineTime - nLastOnLineTime) / 60 / 60)
		nCurrentOnLineTime = nLastOnLineTime + nHour * 60 * 60
	else -- 最近一次记录时间和领取的时候不是同一天
		local nCurrentH = tonumber(GetLocalDate("%H"))
		local nCurrentM = tonumber(GetLocalDate("%M"))
		local nCurrentS = tonumber(GetLocalDate("%S"))
		nHour = nCurrentH 
		nCurrentOnLineTime = GetGameTime() - nCurrentM * 60 - nCurrentS
	end
	nCount = nHour
	if nCount <= 0 then
		Msg2Player("Kho秐g c竎h nh薾 l莕 trc, th阨 gian tr猲 m筺g c馻 ngi ch璦  1 gi�, kh玭g th� nh薾")
		return 
	end
	local nMaxCount = %MAX_GET_ONLINEAWARD -  PlayerFunLib:GetTaskDailyCount(%TSK_GET_ONLINEAWARD);
	nMaxCount = min(nMaxCount, nCount)
	if nMaxCount <= 0 then
		Msg2Player("H玬 nay ngi kh玭g th� nh薾 n鱝, ng祔 mai h穣 quay l筰.")
		return 
	end
	
	-- 更新领取的时间
	SetTask(%TSK_LAST_ONLINETIME,nCurrentOnLineTime)
	SetTask(%TSK_LAST_ONLINEDATA,nNowDate)
	
	PlayerFunLib:GetItem(%AWARD_ONLINEITEM, nMaxCount, %EVENT_LOG_TITLE, "NhanThuongOnline")
	PlayerFunLib:AddTaskDaily(%TSK_GET_ONLINEAWARD, nMaxCount)
end

--function pActivity:UseOnlineAward2(nContribution)
--	local szTongName , nTongID = GetTongName();
--	if (nTongID ~= 0) then
--		AddContribution(nContribution);
--		Msg2Player(format("B筺 nh薾 頲 %d 甶觤 c鑞g hi課", nContribution));
--	end
--end

-- 检查使用上线奖励2时的位置和战斗状态
function pActivity:CheckState()
	if (GetFightState() ~= 0) then
		lib:ShowMessage("Ch� c� th� s� d鬾g 頲 t筰 khu v鵦 phi chi課 u trong 7 th祅h th� l韓.");
		return nil;
	end
	
	local nCurMapId = GetWorldPos();
	if (nCurMapId == 1 or nCurMapId == 11 or nCurMapId == 37 or nCurMapId == 78 or nCurMapId == 80 or nCurMapId == 162 or nCurMapId == 176) then
		return 1;
	else
		lib:ShowMessage("Ch� c� th� s� d鬾g 頲 t筰 khu v鵦 phi chi課 u trong 7 th祅h th� l韓.");
		return nil;
	end
end

--Kh雐 t筼 thu th藀 hoa tri ﹏
--pActivity.tbCompose = {}
--function pActivity:InitComposeMaterial4()
--	self.tbCompose = {};
--	for nJxb = 1, getn(tbMaterial_Jxb) do
--		local tbCompose = {};
--		
--		for nType=1,getn(tbMaterial_Mat) do
--			tbFormulaList = {	
--				nWidth = 1,
--				nHeight = 1,
--				nFreeItemCellLimit = 0.02,
--				tbProduct = {szName=ITEM_MATERIAL_4.szName,tbProp=ITEM_MATERIAL_4.tbProp,nExpiredTime=DATE_END},
--				};
--			tbFormulaList.tbMaterial = {};
--			tinsert(tbFormulaList.tbMaterial, tbMaterial_Mat[nType]);
--			tinsert(tbFormulaList.tbMaterial, tbMaterial_Jxb[nJxb]);
--			tbFormulaList.pProductFun = function(pCompose, nComposeCount)
--				if (GetTask(%TSK_COMPOSE_MATERIAL4) <= 200) then
--					PlayerFunLib:AddTask(%TSK_COMPOSE_MATERIAL4, nComposeCount)
--				end
--			end
--			p = tbActivityCompose:new(tbFormulaList, "ComposeMaterial4", INVENTORY_ROOM.room_equipment)
--			tinsert(tbCompose, nType, p)
--		end
--		
--		tinsert(self.tbCompose, nJxb, tbCompose);
--	end
--end
--
--function pActivity:ComposeMaterial4Dailog()
--	local szTitle = format("Xin h穣 l鵤 ch鋘 i<color=green>%s<color> nguy猲 li謚", ITEM_MATERIAL_4.szName);
--	local nStep = self:GetExMoneyStep();
--	local tbOpt = {}
--	for i=1, getn(tbMaterial_Mat) do
--		tinsert(tbOpt, {tbMaterial_Mat[i].szName, self.ComposeMaterial4_Do, {self, nStep,i}})
--	end
--	
--	tinsert(tbOpt, {"R阨 kh醝", cancel})
--	
--	CreateNewSayEx(szTitle, tbOpt);
--end
--
--function pActivity:ComposeMaterial4_Do(nStep, nType)
--	self.tbCompose[nStep][nType]:ComposeDailog();
--end
