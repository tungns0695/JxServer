Include("\\script\\activitysys\\config\\30\\head.lua")
Include("\\script\\activitysys\\config\\30\\config.lua")
Include("\\script\\missions\\basemission\\lib.lua")
Include("\\script\\lib\\log.lua")
Include("\\script\\lib\\awardtemplet.lua")

local szEventName = "Event_NhaGiaoVN"
local nMaxAskNumber = 2000 -- 打包上交时最大可支持数


local tbBookPartAward = {
	[20]={szName="Hoa Tri ",tbProp={6,1,3043,1,0,0},nExpiredTime=20111201},
	[40]={szName="Hoa Tri ",tbProp={6,1,3043,1,0,0},nCount = 3,nExpiredTime=20111201},
	[60]={szName="Hoa Tri ",tbProp={6,1,3043,1,0,0},nCount = 4,nExpiredTime=20111201},
	[80]={szName="Hoa Tri ",tbProp={6,1,3043,1,0,0},nCount = 5,nExpiredTime=20111201},
	[100]={szName="Hoa Tri ",tbProp={6,1,3043,1,0,0},nCount = 7,nExpiredTime=20111201},
	[200]={nExp_tl=1,nCount = 20000000,},
	[300]={nExp_tl=1,nCount = 20000000,},
	[400]={szName="Thi猲 V� H錸",tbProp={6,1,3044,1,0,0},nExpiredTime=20111201},
	[500]={szName="Thi猲 V� H錸",tbProp={6,1,3044,1,0,0},nExpiredTime=20111201},
	[600]={szName="Thi猲 V� H錸",tbProp={6,1,3044,1,0,0},nExpiredTime=20111201},
	[700]={szName="Thi猲 V� H錸",tbProp={6,1,3044,1,0,0},nCount = 2,nExpiredTime=20111201},
	[800]={szName="Thi猲 V� H錸",tbProp={6,1,3044,1,0,0},nCount = 2,nExpiredTime=20111201},
	[900]={szName="Thi猲 V� H錸",tbProp={6,1,3044,1,0,0},nCount = 2,nExpiredTime=20111201},
	[1000]={nExp_tl=1,nCount = 20000000,},
	[1100]={szName="Thi猲 V� H錸",tbProp={6,1,3044,1,0,0},nCount = 2,nExpiredTime=20111201},
	[1200]={szName="Thi猲 V� H錸",tbProp={6,1,3044,1,0,0},nCount = 3,nExpiredTime=20111201},
	[1300]={szName="Thi猲 V� H錸",tbProp={6,1,3044,1,0,0},nCount = 3,nExpiredTime=20111201},
	[1400]={szName="Thi猲 V� H錸",tbProp={6,1,3044,1,0,0},nCount = 3,nExpiredTime=20111201},
	[1500]={nExp_tl=1,nCount = 50000000,},
	[1600]={nExp_tl=1,nCount = 60000000,},
	[1700]={nExp_tl=1,nCount = 70000000,},
	[1800]={nExp_tl=1,nCount = 80000000,},
	[1900]={nExp_tl=1,nCount = 90000000,},
	[2000]={nExp_tl=1,nCount = 100000000,},
}
local tbBookPartAwardLog ={
	[20] = "SuDung20LanCuonSach",
	[40] = "SuDung40LanCuonSach",
	[60] = "SuDung60LanCuonSach",
	[80] = "SuDung80LanCuonSach",
	[100] = "SuDung100LanCuonSach", 
	[200] = "SuDung200LanCuonSach",
	[300] = "SuDung300LanCuonSach",
	[400] = "SuDung400LanCuonSach",
	[500] = "SuDung500LanCuonSach",
	[600] = "SuDung600LanCuonSach", 
	[700] = "SuDung700LanCuonSach",
	[800] = "SuDung800LanCuonSach",
	[900] = "SuDung900LanCuonSach",
	[1000] = "SuDung1000LanCuonSach",
	[1100] = "SuDung1100LanCuonSach", 
	[1200] = "SuDung1200LanCuonSach",
	[1300] = "SuDung1300LanCuonSach",
	[1400] = "SuDung1400LanCuonSach",
	[1500] = "SuDung1500LanCuonSach",
	[1600] = "SuDung1600LanCuonSach", 
	[1700] = "SuDung1700LanCuonSach",
	[1800] = "SuDung1800LanCuonSach",
	[1900] = "SuDung1900LanCuonSach",
	[2000] = "SuDung2000LanCuonSach",
}

function pContributionAward(nCount)
	local _ , nTongID = GetTongName()
	if (nTongID > 0) then
		AddContribution(nCount)
		Msg2Player("B筺 nh薾 頲 "..nCount.." 甶觤 c鑞g hi課 bang h閕")
		%tbLog:PlayerActionLog(%szEventName, "SuDungCuonSachNhanVatPham", nCount.." 甶觤 c鑞g hi課 bang h閕")
	end
end

local tbBookAward = {
	{szName="Kim � L謓h",tbProp={6,1,2349,1,0,0},nCount=1,nRate=0.02},
	{szName="Kim � Kim B礽",tbProp={6,1,3001,1,0,0},nCount=1,nRate=0.05},
	{szName="у Ph� Kim � Kh玦",tbProp={6,1,2982,1,0,0},nCount=1,nRate=0.1},
	{szName="у Ph� Kim � Y",tbProp={6,1,2983,1,0,0},nCount=1,nRate=0.1},
	{szName="у Ph� Kim � H礽",tbProp={6,1,2984,1,0,0},nCount=1,nRate=0.05},
	{szName="у Ph� Kim � Y猽 Цi",tbProp={6,1,2985,1,0,0},nCount=1,nRate=0.05},
	{szName="у Ph� Kim � H� Uy觧",tbProp={6,1,2986,1,0,0},nCount=1,nRate=0.1},
	{szName="у Ph� Kim � H筺g Li猲",tbProp={6,1,2987,1,0,0},nCount=1,nRate=0.1},
	{szName="у Ph� Kim � B閕",tbProp={6,1,2988,1,0,0},nCount=1,nRate=0.1},
	{szName="у Ph� Kim � Thng Gi韎",tbProp={6,1,2989,1,0,0},nCount=1,nRate=0.1},
	{szName="у Ph� Kim � H� Gi韎",tbProp={6,1,2990,1,0,0},nCount=1,nRate=0.1},
	{szName="у Ph� Kim � Kh� Gi韎",tbProp={6,1,2991,1,0,0},nCount=1,nRate=0.05},
	{szName="Kim Hoa Chi B秓",tbProp={6,1,3002,1,0,0},nCount=1,nRate=0.05},
	{szName="Ph� Th髖 Chi B秓",tbProp={6,1,3003,1,0,0},nCount=1,nRate=0.03},
	{szName="Phong V﹏ Chi B秓",tbProp={6,1,3004,1,0,0},nCount=1,nRate=0.001},
	{szName="Thanh C﹗ Th筩h",tbProp={6,1,2710,1,0,0},nCount=1,nRate=0.4},
	{szName="V﹏ L閏 Th筩h",tbProp={6,1,2711,1,0,0},nCount=1,nRate=0.3},
	{szName="Thng Lang Th筩h",tbProp={6,1,2712,1,0,0},nCount=1,nRate=0.2},
	{szName = "6000000 觤 Kinh Nghi謒", nExp=6000000,nRate=35},
	{szName = "8000000 觤 Kinh Nghi謒", nExp=8000000,nRate=22},
	{szName = "12000000 觤 Kinh Nghi謒", nExp=12000000,nRate=10},
	{szName = "20000000 觤 Kinh Nghi謒", nExp=20000000,nRate=3},
	{szName = "50000000 觤 Kinh Nghi謒", nExp=50000000,nRate=0.5},
	{szName = "100000000 觤 Kinh Nghi謒", nExp=100000000,nRate=0.1},
	{szName="Чi l鵦 ho祅 l� bao",tbProp={6,1,2517,1,0,0},nCount=1,nRate=3},
	{szName="Phi t鑓 ho祅 l� bao",tbProp={6,1,2520,1,0,0},nCount=1,nRate=3},
	{szName="H錳 thi猲 t竔 t筼 l� bao",tbProp={6,1,2527,1,0,0},nCount=1,nRate=2,nExpiredTime=43200},
	{szName="T鑞g Kim Chi猽 Binh L謓h",tbProp={6,1,30083,1,0,0},nCount=1,nRate=2,nExpiredTime=10080},
	{szName="Ng鋍 Qu竛",tbProp={6,1,2311,1,0,0},nCount=1,nRate=0.5,nExpiredTime=43200},
	{szName="S竧 Th� Gi秐 l� h閜",tbProp={6,1,2339,1,0,0},nCount=1,nRate=2},
	{szName="Ng鋍 Tr飊g Luy謓",tbProp={6,1,30104,1,0,0},nCount=1,nRate=0.2,nExpiredTime=43200},
	{szName="C祅 Kh玭 Song Tuy謙 B閕",tbProp={6,1,2219,1,0,0},nCount=1,nRate=0.04,nExpiredTime=43200},
	{szName="K輈h C玭g Tr� L鵦 Ho祅",tbProp={6,1,2952,1,0,0},nCount=1,nRate=1,nExpiredTime=20160},
	{szName=" Dng Ho箃 Huy誸 Кn",tbProp={6,1,2953,1,0,0},nCount=1,nRate=1,nExpiredTime=20160},
	{szName="M閏 Nh﹏ L謓h",tbProp={6,1,30105,1,0,0},nCount=5,nRate=9.664},
	{szName="50000 觤 C鑞g Hi課 Bang H閕",nCount=1,nRate=2, pFun = function() %pContributionAward(50000) end},
	{szName="100000 觤 C鑞g Hi課 Bang H閕",nCount=1,nRate=1, pFun = function() %pContributionAward(100000) end},
	{szName="T� M穘g Chi B秓 (N鉵)",tbProp={6,1,30140,1,0,0},nCount=1,nRate=0.01,tbParam={1,0,0,0,0,0}},
	{szName="T� M穘g Chi B秓 (i L璶g)",tbProp={6,1,30140,1,0,0},nCount=1,nRate=0.02,tbParam={4,0,0,0,0,0}},
	{szName="T� M穘g Chi B秓 (Bao Tay)",tbProp={6,1,30140,1,0,0},nCount=1,nRate=0.01,tbParam={3,0,0,0,0,0}},
	{szName="T� M穘g Chi B秓 (Ng鋍 B閕)",tbProp={6,1,30140,1,0,0},nCount=1,nRate=0.01,tbParam={8,0,0,0,0,0}},
	{szName="T� M穘g Chi B秓 (竜)",tbProp={6,1,30140,1,0,0},nCount=1,nRate=0.01,tbParam={5,0,0,0,0,0}},
	{szName="T� M穘g Chi B秓 (Gi莥)",tbProp={6,1,30140,1,0,0},nCount=1,nRate=0.01,tbParam={7,0,0,0,0,0}},
	{szName="T� M穘g Chi B秓 (H筺g Li猲)",tbProp={6,1,30140,1,0,0},nCount=1,nRate=0.01,tbParam={0,0,0,0,0,0}},
	{szName="T� M穘g Chi B秓 (Nh蒼 Tr猲)",tbProp={6,1,30140,1,0,0},nCount=1,nRate=0.005,tbParam={2,0,0,0,0,0}},
	{szName="T� M穘g Chi B秓 (Nh蒼 Di)",tbProp={6,1,30140,1,0,0},nCount=1,nRate=0.005,tbParam={9,0,0,0,0,0}},
	{szName="T� M穘g Chi B秓 (V� Kh�)",tbProp={6,1,30140,1,0,0},nCount=1,nRate=0.005,tbParam={6,0,0,0,0,0}},
}

local tbBaizhiPartLog = {
	[500] = "NopVatPhamGiayTrang500Lan",
	[1000] = "NopVatPhamGiayTrang1000Lan",
	[1500] = "NopVatPhamGiayTrang1500Lan",
	[2000] = "NopVatPhamGiayTrang2000Lan",
	[2500] = "NopVatPhamGiayTrang2500Lan",
	[3000] = "NopVatPhamGiayTrang3000Lan",
}	

function pActivity:AddInitNpc()
	local tbNpcPos = {
		[1] = {176,1431,3287,},
		[2] = {176,1428,3283,},
	}
	local tbNpc = {
		[1] = {
			szName = "Чi L穙 S�", 
			nLevel = 95,
			nNpcId = 1877,
			nIsboss = 0,
			szScriptPath = "\\script\\activitysys\\npcdailog.lua",
			},
		[2] = {
			szName = "Th� уng", 
			nLevel = 95,
			nNpcId = 1878,
			nIsboss = 0,
			szScriptPath = "\\script\\activitysys\\npcdailog.lua",
			},
	}
	for i=1,getn(tbNpcPos) do
		local nMapId, nPosX, nPosY = unpack(tbNpcPos[i])
		basemission_CallNpc(tbNpc[i], nMapId, nPosX * 32, nPosY * 32)	
	end
end

function pActivity:GetItemCount(tbMaterial)
	local nMaxCount = -1
	if type(tbMaterial[1]) == "table" then
		for i=1, getn(tbMaterial) do
			local tbProp = tbMaterial[i].tbProp
			tbMaterial[i].nCount = tbMaterial[i].nCount or 1
			local nCount = CalcItemCount(3, tbProp[1], tbProp[2], tbProp[3], -1)
			nCount = floor(nCount / tbMaterial[i].nCount)
			if nMaxCount < 0 then
				nMaxCount = nCount
			else
				nMaxCount = min(nMaxCount, nCount)
			end
		end
	else
		local tbProp = tbMaterial.tbProp
		local nCount = CalcItemCount(3, tbProp[1], tbProp[2], tbProp[3], -1)
		nMaxCount = min(nMaxCount, nCount)
	end
	nMaxCount = max(0, nMaxCount)
	return nMaxCount
end

function pActivity:ConsumeItem(tbMaterial, nCount)
	if type(tbMaterial[1]) == "table" then
		for i=1, getn(tbMaterial) do
			local tbProp = tbMaterial[i].tbProp
			tbMaterial[i].nCount = tbMaterial[i].nCount or 1
			local nTotalCount = nCount * tbMaterial[i].nCount
			if ConsumeItem(3, nTotalCount, tbProp[1], tbProp[2], tbProp[3], -1) ~= 1 then
				Msg2Player(format("Khi ti猽 hao %s  th蕋 b筰, xin h穣 i m閠 l竧 r錳 quay l筰",tbMaterial[i].szName))
				return 0
			end
		end
	else
		local tbProp = tbMaterial.tbProp
		if ConsumeItem(3, nCount, tbProp[1], tbProp[2], tbProp[3], -1) ~= 1 then
			Msg2Player(format("Khi ti猽 hao %s  th蕋 b筰, xin h穣 i m閠 l竧 r錳 quay l筰",tbMaterial[i].szName))
			return 0
		end
	end
	return 1
end

function pActivity:CheckItemCount(nValue, nTarget)
	if nValue < nTarget then
		Say("Ngi kh玭g  nguy猲 li謚, xin h穣 chu萵 b� l筰")
		return 0
	end
	return 1
end

-- 上交书本成功后相关操作
--function pActivity:DoHandInBook(nCount, nTaskId)
--	local nPreCount = self:GetTask(nTaskId)
--	local nNowCount = nPreCount + nCount
--	
--	if self:CheckFreeCell(nTaskId, nCount) ~= 1 then
--		return 
--	end
--	tbAwardTemplet:Give(%tbBookAward, nCount, {%szEventName, "SuDungCuonSachNhanVatPham"})
--	for key,value in %tbBookPartAward do
--		if key > nPreCount and key <= nNowCount then
--			tbAwardTemplet:Give(value, 1, {%szEventName,%tbBookPartAwardLog[key]})
--		end
--	end
--	self:AddTask(nTaskId, nCount)
--end

-- 上交白纸成功后相关操作
function pActivity:DoHandInPaper(nCount, nTaskId)
	local tbExp = {{nExp_tl=1,nCount = 1000000,},}
	local nPreCount = self:GetTask(nTaskId)
	local nNowCount = nPreCount + nCount
	tbAwardTemplet:Give(tbExp, nCount, {%szEventName, "HandInPaper"})
	for key,value in %tbBaizhiPartLog do
		if key > nPreCount and key <= nNowCount then
			%tbLog:PlayerActionLog(%szEventName, value)
			tbVngTransLog:Write("201111_20Thang11/", 16, value, "N/A", 1)
		end
	end
	self:AddTask(nTaskId, nCount)
end

-- 上交道具阶段性奖励
function pActivity:GiveAward(nTaskId, nCount)
	if nTaskId == %TSK_HandInBook then
		self:DoHandInBook(nCount, nTaskId)
	elseif nTaskId == %TSK_HandInPaper then
		self:DoHandInPaper(nCount, nTaskId)
	end
	
end

function pActivity:CheckFreeCell(nTaskId, nCount)
	if nTaskId == %TSK_HandInBook then
		local nFreeCount = nCount * 3 -- 漠北传送令有3张且不可叠加
		if CalcFreeItemCellCount() < nFreeCount then
			Say(format("в b秓 m an to祅 t礽 s秐, xin h穣 m b秓 h祅h trang c遪 th鮝 %d � tr鑞g.",nFreeCount))
			return 0
		end
	end
	return 1
end

-- 确定上交道具
function pActivity:SureHandIn(tbMaterial, nTaskId, nCount)
	if nCount <= 0 then
		return 
	end	
	--Ki觤 tra s� lng giao n閜 c� vt qu� gi韎 h筺 - Modified by DinhHQ - 20111101
	local nMaxCount = 0
	if nTaskId == %TSK_HandInBook then
		nMaxCount = %nMaxBookCount + self:GetTask(%TSK_UsedTianyuhun) * %nPerTianyuhun - self:GetTask(%TSK_HandInBook) - nCount
	elseif nTaskId == %TSK_HandInPaper then
		nMaxCount = %nMaxPaperCount + self:GetTask(%TSK_UsedZhienhua) * %nPerZhienhua - self:GetTask(%TSK_HandInPaper) - nCount
	end	
		
	if nMaxCount < 0 then
		Say("S� lng vt qu� gi韎 h筺, xin h穣 nh藀 s� kh竎!")
		return 
	end
	
	local nItemCount = self:GetItemCount(tbMaterial)
	if self:CheckItemCount(nItemCount, nCount) ~= 1 then
		return
	end
	
	if self:CheckFreeCell(nTaskId, nCount) ~= 1 then
		return 
	end 
	
	if self:ConsumeItem(tbMaterial, nCount) ~= 1 then
		return 
	end
	
	self:GiveAward(nTaskId, nCount)
end

-- 上交书本
--function pActivity:HandInBook()
--	print("Giao n閜 Cu鑞 S竎h")
--	local tbBook = {
--		[1]={szName="Cu鑞 S竎h",tbProp={6,1,3042,1,0,0},},	
--	}
--	local nMaxCount = %nMaxBookCount + self:GetTask(%TSK_UsedTianyuhun) * %nPerTianyuhun - self:GetTask(%TSK_HandInBook)
--	if nMaxCount < 1 then
--		Say("Hi謓 t筰 s� l莕 giao n閜 c馻 ngi  t n gi韎 h筺 cao nh蕋, kh玭g th� giao n閜 頲 n鱝")
--		return 
--	end
--	print("nMaxCount = " .. nMaxCount)
--	print("nMaxAskNumber" .. %nMaxAskNumber)
--	nMaxCount = min(%nMaxAskNumber, nMaxCount)
--	local nItemCount = self:GetItemCount(tbBook)
--	nMaxCount = min(nMaxCount, nItemCount)
--	if self:CheckItemCount(nMaxCount, 1) ~= 1 then
--		return
--	end
--	g_AskClientNumberEx(0,nMaxCount, format("Nh藀 s� (0-%d)", nMaxCount), {self.SureHandIn, {self,tbBook,%TSK_HandInBook}})
--end


-- 上交白纸
function pActivity:HandInPaper()
	local tbPape = {
		[1]={szName="Gi蕐 Tr緉g",tbProp={6,1,3039,1,0,0},},	
	}
	local nMaxCount = %nMaxPaperCount + self:GetTask(%TSK_UsedZhienhua) * %nPerZhienhua - self:GetTask(%TSK_HandInPaper)
	if nMaxCount < 1 then
		Say("Hi謓 t筰 s� l莕 giao n閜 c馻 ngi  t n gi韎 h筺 cao nh蕋, kh玭g th� giao n閜 頲 n鱝")
		return 
	end
	nMaxCount = min(%nMaxAskNumber, nMaxCount)
	local nItemCount = self:GetItemCount(tbPape)	
	nMaxCount = min(nMaxCount, nItemCount)
	if self:CheckItemCount(nMaxCount, 1) ~= 1 then
		return
	end
	g_AskClientNumberEx(0,nMaxCount, format("Nh藀 s� (0-%d)", nMaxCount), {self.SureHandIn, {self,tbPape,%TSK_HandInPaper}})
end

-- 领取教师节经验奖励
function pActivity:TeacherAward()
	local nStartTime = 20111120
	if tonumber(GetLocalDate("%Y%m%d")) ~= nStartTime then
		Say("Ch� c� th� v祇 ng祔 <color=yellow>  20/11/2011 <color> m韎 nh薾 頲 ph莕 thng n祔, hi謓 t筰 kh玭g th� nh薾 頲")
		return 
	end
	local tbTeacherEXP = { {nExp_tl=1,nCount = 100000000,}, }
	local tbTranslog = {strFolder = "201111_20Thang11/", nPromID = 16, nResult = 1}
	tbAwardTemplet:Give(tbTeacherEXP,1,{%szEventName, "NhanPhanThuongTaiNPCDaiLaoSu", tbTranslog})
	self:AddTask(%TSK_TeacherAward, 1)
end

local tbJinwu = {
	[1]={szName="у Ph� Kim � Kh玦",tbProp={6,1,2982,1,0,0},},
	[2]={szName="у Ph� Kim � Y",tbProp={6,1,2983,1,0,0},},
	[3]={szName="у Ph� Kim � H礽",tbProp={6,1,2984,1,0,0},},
	[4]={szName="у Ph� Kim � Y猽 Цi",tbProp={6,1,2985,1,0,0},},
	[5]={szName="у Ph� Kim � H� Uy觧",tbProp={6,1,2986,1,0,0},},
	[6]={szName="у Ph� Kim � H筺g Li猲",tbProp={6,1,2987,1,0,0},},
	[7]={szName="у Ph� Kim � B閕",tbProp={6,1,2988,1,0,0},},
}
-- 领取上次书本次数超过700时的金乌奖励
function pActivity:JinwuAward()
	print("Nh薾 ph莕 thng  ph� Kim �")
	local szTitle = "Xin h穣 l鵤 ch鋘 у Ph� m� ngi mu鑞 nh薾:"
	local tbOpt = {}
	for nIndex=1,getn(%tbJinwu) do
		tinsert(tbOpt, {%tbJinwu[nIndex].szName, self.SelectJinWu,{self, nIndex}})
	end
	tinsert(tbOpt, {"в ta suy ngh� l筰 !", cancel})
	CreateNewSayEx(szTitle, tbOpt)
end

function pActivity:SelectJinWu(nIndex)
	local nFreeItemCellLimit = 1
	if CalcFreeItemCellCount() < nFreeItemCellLimit then
		Say(format("в m b秓 an to祅 cho t礽 s秐 c馻 b筺, xin h穣 m b秓 r籲g 輙 nh蕋 <color=yellow>%d <color> � tr鑞g h祅h trang",nFreeItemCellLimit))
		return 
	end
	tbAwardTemplet:Give(%tbJinwu[nIndex], 1, {%szEventName, "SuDung700LanCuonSach_JinWu"})
	self:AddTask(%TSK_JinwuAward, 1)
end

function pActivity:UseZhienhua()
	local tbUseLog = {
		[10] = "SuDungHoaTriAn10Lan",
		[20] = "SuDungHoaTriAn20Lan",
		}
	self:AddTask(%TSK_UsedZhienhua,1)
	local nUseTime = self:GetTask(%TSK_UsedZhienhua)
	if tbUseLog[nUseTime] then
		%tbLog:PlayerActionLog(%szEventName, tbUseLog[nUseTime])
		tbVngTransLog:Write("201111_20Thang11/", 16, tbUseLog[nUseTime], "N/A", 1)
	end
	Msg2Player(format("S� d鬾g th祅h c玭g <color=yellow>%s<color>, nh薾 頲 <color=yellow>%d<color> giao n閜 <color=yellow>%s<color> l莕","Hoa Tri ",%nPerZhienhua,"Gi蕐 Tr緉g"))
end

function pActivity:UseTianyuhun()
	local tbUseLog = {
		[10] = "SuDungThienVuHon10Lan",
		[20] = "SuDungThienVuHon20Lan",
		}
	self:AddTask(%TSK_UsedTianyuhun,1)
	local nUseTime = self:GetTask(%TSK_UsedTianyuhun)
	if tbUseLog[nUseTime] then
		%tbLog:PlayerActionLog(%szEventName, tbUseLog[nUseTime])
		tbVngTransLog:Write("201111_20Thang11/", 16, tbUseLog[nUseTime], "N/A", 1)
	end
	Msg2Player(format("S� d鬾g th祅h c玭g <color=yellow>%s<color>, nh薾 頲 <color=yellow>%d<color> giao n閜 <color=yellow>%s<color> l莕","Thi猲 V� H錸",%nPerTianyuhun,"Cu鑞 S竎h"))
end

function pActivity:CheckBookLimit()
	local nMaxCount = %nMaxBookCount + self:GetTask(%TSK_UsedTianyuhun) * %nPerTianyuhun - self:GetTask(%TSK_HandInBook)
	if nMaxCount < 1 then
		Say("Чi hi謕  s� d鬾g t鑙 產 v藅 ph萴 n祔, kh玭g th� s� d鬾g th猰!")
		return nil
	end
	return 1
end

function pActivity:UseBook()
	self:AddTask(%TSK_HandInBook,1)	
	local tbTranslog = {strFolder = "201111_20Thang11/", nPromID = 16, nResult = 1}
	tbAwardTemplet:Give(%tbBookAward, nCount, {%szEventName, "SuDungCuonSachNhanVatPham", tbTranslog})
	local nUseTime = self:GetTask(%TSK_HandInBook)
	--print(nUseTime)
	if %tbBookPartAward[nUseTime] then
		tbAwardTemplet:Give(%tbBookPartAward[nUseTime], 1, {%szEventName,%tbBookPartAwardLog[nUseTime]})
		tbVngTransLog:Write("201111_20Thang11/", 16, %tbBookPartAwardLog[nUseTime], "N/A", 1)
	end	
end

pActivity.nPak = curpack()