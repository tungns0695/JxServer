Include("\\script\\activitysys\\config\\21\\head.lua");
Include("\\script\\activitysys\\config\\21\\variables.lua");
Include("\\script\\activitysys\\config\\21\\awardlist.lua");
Include("\\script\\activitysys\\config\\21\\materiallist.lua");
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


-- 启动时初始化
-- 导入OBJ坐标点
-- 加载采集OBJ
function pActivity:Init()
	self:LoadDataFromConfig();
	self:AddGatherObj();
	self:InitComposeMaterial4();
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
		--tbPos.nTaskId = tonumber(TabFile_GetCell(POSPATH_CAIJI, nRow, "TaskId"));
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
			--SetNpcParam(nNpcIdx, 1, tbPos.nTaskId);
		end
	end
	return 1;
end


function pActivity:GetExMoneyStep()
	local nCnt_Exchange = self:GetTask(TSK_COMPOSE_MATERIAL4);
	if (nCnt_Exchange < 100) then
		return 1;
	elseif (nCnt_Exchange >= 100 and nCnt_Exchange < 200) then
		return 2;
	else
		return 3;
	end
end


function pActivity:UseAward1()
	local nCnt_Award1 = self:GetTask(TSK_USE_AWARD1);
	if (nCnt_Award1 < 0) then
		return
	end
	
	self:AddTask(TSK_USE_AWARD1,1);
	nCnt_Award1 = nCnt_Award1 + 1;
	
	PlayerFunLib:AddExp(EXP_AWARD1, 1, EVENT_LOG_TITLE, "USE AWARD1");
end

function pActivity:UseAward2()
	local nCnt_Award2 = self:GetTask(TSK_USE_AWARD2);
	if (nCnt_Award2 < 0) then
		return
	end
	self:AddTask(TSK_USE_AWARD2,1);
	nCnt_Award2 = nCnt_Award2 + 1;
	
	PlayerFunLib:AddExp(EXP_AWARD2, 1, EVENT_LOG_TITLE, "USE AWARD2")
	
	if nCnt_Award2 == 1500 then
		tbAwardTemplet:Give(tbAward_C, 1, {EVENT_LOG_TITLE, "UseAward2Max"});
	elseif (mod(nCnt_Award2, 100) == 0) then
		tbAwardTemplet:Give(tbAward_B, 1, {EVENT_LOG_TITLE, "UseAward2", ITEM_AWARD2.szName,"S� d鬾g "..nCnt_Award2.." l莕"});
	else
		tbAwardTemplet:Give(tbAward_A, 1, {EVENT_LOG_TITLE, "UseAward2", ITEM_AWARD2.szName,"S� d鬾g "..nCnt_Award2.." l莕"})
	end
end

function pActivity:UseAward3()
	local nCnt_Award2 = self:GetTask(TSK_USE_AWARD2);
	if (nCnt_Award2 < 0) then
		return
	end
	
	self:AddTask(TSK_USE_AWARD2,1);
	nCnt_Award2 = nCnt_Award2 + 1;
	
	PlayerFunLib:AddExp(EXP_AWARD3, 1, EVENT_LOG_TITLE, "USE AWARD3")
		
	if nCnt_Award2 == 1500 then
		tbAwardTemplet:Give(tbAward_C, 1, {EVENT_LOG_TITLE, "UseAward3Max"})
	elseif (mod(nCnt_Award2, 100)) == 0 then
		tbAwardTemplet:Give(tbAward_B, 1, {EVENT_LOG_TITLE, "UseAward3", ITEM_AWARD3.szName,"S� d鬾g "..nCnt_Award2.." l莕"})
	end
end

function pActivity:PlayerOnLogin()
	local nDate = self:GetTask(TSK_LAST_ONLINEDATA)
	local nNowDate = tonumber(GetLocalDate("%Y%m%d"))
	local nCount = 0
	if nDate ~= nNowDate then	-- 与最近记录不是同一天
		nCurrentOnLineTime = GetGameTime()
		self:SetTask(TSK_LAST_ONLINETIME,nCurrentOnLineTime)
		self:SetTask(TSK_LAST_ONLINEDATA,nNowDate)
	end
end

function pActivity:GetOnlineAward()
	local nDate = self:GetTask(TSK_LAST_ONLINEDATA)
	local nNowDate = tonumber(GetLocalDate("%Y%m%d"))
	local nHour = 0
	local nCurrentOnLineTime = 0
	local nLastOnLineTime = 0
	local nCount = 0
	if nDate == nNowDate then	-- 最近一次记录的时间和领取时间是同一天
		nLastOnLineTime = self:GetTask(TSK_LAST_ONLINETIME)
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
	
	local nMaxCount = MAX_GET_ONLINEAWARD -  self:GetTaskDaily(TSK_GET_ONLINEAWARD);
	nMaxCount = min(nMaxCount, nCount)
	if nMaxCount <= 0 then
		Msg2Player("H玬 nay ngi kh玭g th� nh薾 n鱝, ng祔 mai h穣 quay l筰.")
		return 
	end
	
	-- 更新领取的时间
	self:SetTask(TSK_LAST_ONLINETIME,nCurrentOnLineTime)
	self:SetTask(TSK_LAST_ONLINEDATA,nNowDate)
	
	PlayerFunLib:GetItem(AWARD_ONLINEITEM, nMaxCount, EVENT_LOG_TITLE, "GetOnlineAward")
	self:AddTaskDaily(TSK_GET_ONLINEAWARD, nMaxCount)

end

function pActivity:UseOnlineAward2(nContribution)
	local szTongName , nTongID = GetTongName();
	if (nTongID ~= 0) then
		AddContribution(nContribution);
		Msg2Player(format("B筺 nh薾 頲 %d 甶觤 c鑞g hi課", nContribution));
	end
end

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


pActivity.tbCompose = {}

function pActivity:InitComposeMaterial4()
	self.tbCompose = {};
	for nJxb = 1, getn(tbMaterial_Jxb) do
		local tbCompose = {};
		
		for nType=1,getn(tbMaterial_Mat) do
			tbFormulaList = {	
				nWidth = 1,
				nHeight = 1,
				nFreeItemCellLimit = 0.02,
				tbProduct = {szName=ITEM_MATERIAL_4.szName,tbProp=ITEM_MATERIAL_4.tbProp,nExpiredTime=DATE_END},
				};
			tbFormulaList.tbMaterial = {};
			tinsert(tbFormulaList.tbMaterial, tbMaterial_Mat[nType]);
			tinsert(tbFormulaList.tbMaterial, tbMaterial_Jxb[nJxb]);
			tbFormulaList.pProductFun = function(pCompose, nComposeCount)
				if (%self:GetTask(TSK_COMPOSE_MATERIAL4) <= 200) then
					%self:AddTask(TSK_COMPOSE_MATERIAL4, nComposeCount);
				end
			end
			p = tbActivityCompose:new(tbFormulaList, "ComposeMaterial4", INVENTORY_ROOM.room_equipment)
			tinsert(tbCompose, nType, p)
		end
		
		tinsert(self.tbCompose, nJxb, tbCompose);
	end
end

function pActivity:ComposeMaterial4Dailog()
	local szTitle = format("Xin h穣 l鵤 ch鋘 i<color=green>%s<color> nguy猲 li謚", ITEM_MATERIAL_4.szName);
	local nStep = self:GetExMoneyStep();
	local tbOpt = {}
	for i=1, getn(tbMaterial_Mat) do
		tinsert(tbOpt, {tbMaterial_Mat[i].szName, self.ComposeMaterial4_Do, {self, nStep,i}})
	end
	
	tinsert(tbOpt, {"R阨 kh醝", cancel})
	
	CreateNewSayEx(szTitle, tbOpt);
end

function pActivity:ComposeMaterial4_Do(nStep, nType)
	self.tbCompose[nStep][nType]:ComposeDailog();
end
