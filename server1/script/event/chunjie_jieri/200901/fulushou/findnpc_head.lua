-- ====================== 文件信息 ======================

-- 剑侠情缘网络版越南收费版一 2009年新年-寿神对话

-- Edited by 子非魚
-- 2009/01/07 16:50
-- 
-- ======================================================


Include("\\script\\task\\system\\task_string.lua");
Include("\\script\\lib\\awardtemplet.lua");

tbChunjie_Jieri_2009 = {};
tbChunjie_Jieri_2009.szClassName = "tbChunjie_Jieri_2009";

TB_CHUNJIE0901_FINDNPC = {
	tbFuLuShouNpc	= {
			{	nNpcId = 455, nLevel = 1, nMapId = 1, szName = "Ph骳 Th莕", 
				tbPos = {{197,192}, {204,195}, {196,203}, {187,198}, {204,205}}, 
				szScriptPath = "\\script\\event\\chunjie_jieri\\200901\\fulushou\\npc_fushen.lua"},
				
			{	nNpcId = 455, nLevel = 1, nMapId = 176, szName = "L閏 Th莕", 
				tbPos = {{179,211}, {174,201}, {184,192}, {207,189}, {203,202}}, 
				szScriptPath = "\\script\\event\\chunjie_jieri\\200901\\fulushou\\npc_lushen.lua"},
				
			{	nNpcId = 455, nLevel = 1, nMapId = 37, szName = "Th� Th莕", 
				tbPos = {{210,196}, {222,191}, {228,193}, {208,188}, {220,187}}, 
				szScriptPath = "\\script\\event\\chunjie_jieri\\200901\\fulushou\\npc_shoushen.lua"},
		},
	tbLine			= {	
					[1] = {{1,2},{2,3},{3,1}},	-- 福禄寿
					[2] = {{1,3},{3,2},{2,1}},	-- 福寿禄
	},
	tbArry			= {
		-- 规则1
		-- 	第一列：福禄寿
		-- 	第二列：禄寿福
		-- 	第三列：寿福禄
		-- 规则2：
		-- 	第一列：福寿禄
		-- 	第二列：寿禄福
		-- 	第三列：禄福寿
		-- 1:翻倍；2:减半；3:不变
		{1, 2, 3},
		{1, 3, 2},
		{2, 1, 3},
		{2, 3, 1},
		{3, 1, 2},
		{3, 2, 1},
	},
	
	nNpcParam_selfid	= 1,
	nNpcParam_nextid	= 2,
	nNpcParam_ntimed	= 3,
	nNpcParam_ladder	= 4,
	nNpcParam_ntype		= 5,
	
	TSK_CHUNJIE2009_VERSION = 1937,
	TSK_CHUNJIE2009_FLS_NTIMEID = 1938,
	TSK_CHUNJIE2009_FLS_STAGE = 1939,
	TSK_CHUNJIE2009_FLS_MAXEXP = 1940,
	
	nDate_Start = 09011612,
	nDate_Close = 09021520,
	
	nMaxExp = 360000000,
}


function reset_task_version()
	if (GetTask(TB_CHUNJIE0901_FINDNPC.TSK_CHUNJIE2009_VERSION) ~= TB_CHUNJIE0901_FINDNPC.nDate_Start) then
		SetTask(TB_CHUNJIE0901_FINDNPC.TSK_CHUNJIE2009_VERSION, TB_CHUNJIE0901_FINDNPC.nDate_Start);
		SetTask(TB_CHUNJIE0901_FINDNPC.TSK_CHUNJIE2009_FLS_MAXEXP, 0);
		SetTask(TB_CHUNJIE0901_FINDNPC.TSK_CHUNJIE2009_FLS_NTIMEID, 0);
		SetTask(TB_CHUNJIE0901_FINDNPC.TSK_CHUNJIE2009_FLS_STAGE, 0);
	end
end


function OnCancel()
end


function tbChunjie_Jieri_2009:fulushounpc_settask(ntaskid, nvalue, nbyte)
	local nTskValue = GetTask(ntaskid);
	
	if (nbyte) then
		nTskValue = SetByte(nTskValue, nbyte, nvalue);
		SetTask(ntaskid, nTskValue);
	else
		SetTask(ntaskid, nvalue);
	end
end


function tbChunjie_Jieri_2009:fulushounpc_gettask(ntaskid, nbyte)
	local nTskValue = GetTask(ntaskid);
	if (nbyte) then
		return GetByte(nTskValue, nbyte);
	else
		return nTskValue;
	end
end




function tbChunjie_Jieri_2009:fulushounpc_main()
	
	reset_task_version();
	
	local nSvrTimeId = tonumber(GetLocalDate("%y%m%d%H"));
	
	if (nSvrTimeId < 09011612 or nSvrTimeId > 09021520) then
		CreateTaskSay({"<dec><npc>".."Xin ch祇 ngi ph祄 tr莕.", "K誸 th骳 i tho筰/OnCancel"});
		return 0;
	end
	
	local nNpcIndex = GetLastDiagNpc();
	local nTimeid = GetNpcParam(nNpcIndex, TB_CHUNJIE0901_FINDNPC.nNpcParam_ntimed);
	--Msg2Player(nTimeid, nSvrTimeId)
	if (nTimeid ~= nSvrTimeId) then
		CreateTaskSay({"<dec><npc>".."Ho箃 ng  k誸 th骳.", "K誸 th骳 i tho筰/OnCancel"});
		return 0;
	end
	
	local nnpc_selfid = GetNpcParam(nNpcIndex, TB_CHUNJIE0901_FINDNPC.nNpcParam_selfid);
	local nnpc_nextid = GetNpcParam(nNpcIndex, TB_CHUNJIE0901_FINDNPC.nNpcParam_nextid);
	
	local nmy_nextid = self:fulushounpc_gettask(TB_CHUNJIE0901_FINDNPC.TSK_CHUNJIE2009_FLS_STAGE, 1);
	
	local nMyTimeId = self:fulushounpc_gettask(TB_CHUNJIE0901_FINDNPC.TSK_CHUNJIE2009_FLS_NTIMEID);
	local nMyStage = self:fulushounpc_gettask(TB_CHUNJIE0901_FINDNPC.TSK_CHUNJIE2009_FLS_STAGE, 2);
	
	--print(nMyTimeId, nMyStage, nnpc_nextid, nnpc_selfid)
	
	if (nMyTimeId ~= nTimeid) then
		CreateTaskSay({"<dec><npc>".."H穣 t譵 gi髉 2 v� b籲g h鱱 c馻 ta, ch髇g ta c莕 ph秈 l猲 Thi猲 ёnh  b竔 ki課 Ng鋍 Ho祅g.", 
				format("%s/#%s:fulushounpc_start(%d, %d, %d, %d, %d)", "Ta mu鑞 t譵 v� th� nh蕋", self.szClassName, nTimeid, nnpc_selfid, nnpc_nextid, 1, nNpcIndex),
				"<#> L竧 n鱝 ta s� quay l筰!/OnCancel"});
	elseif (nMyTimeId == nTimeid and nmy_nextid == nnpc_selfid and nMyStage == 1) then
		CreateTaskSay({"<dec><npc>".."C竚 琻 i hi謕  chuy觧 tin, ta s� n ch� h� ngay!", 
				format("%s/#%s:fulushounpc_start(%d, %d, %d, %d, %d)", "Ta mu鑞 ti誴 t鬰 t譵 v� th� 2", self.szClassName, nTimeid, nnpc_selfid, nnpc_nextid, 2, nNpcIndex),
				"<#> L竧 n鱝 ta s� quay l筰!/OnCancel"});
	elseif (nMyTimeId == nTimeid and nmy_nextid == nnpc_selfid and nMyStage == 2) then
		CreateTaskSay({"<dec><npc>".."C竚 琻 i hi謕  chuy觧 tin! Ta ban cho ngi ch髏 qu� m鋘 m鮪g n╩ m韎!", 
				format("%s/#%s:fulushounpc_start(%d, %d, %d, %d, %d)", "Nh薾 l蕐 l� v藅", self.szClassName, nTimeid, nnpc_selfid, nnpc_nextid, 3, nNpcIndex),
				"<#> L竧 n鱝 ta s� quay l筰!/OnCancel"});
	elseif (nMyTimeId == nTimeid and nmy_nextid == nnpc_nextid and nMyStage == 3) then
		CreateTaskSay({"<dec><npc>".."C竚 琻 i hi謕  chuy觧 tin, ta s� n ch� h� ngay!", 
				"K誸 th骳 i tho筰/OnCancel"});
	else
		CreateTaskSay({"<dec><npc>".."Xin ch祇 ngi ph祄 tr莕.", "K誸 th骳 i tho筰/OnCancel"});
	end
end

function tbChunjie_Jieri_2009:fulushounpc_start(ntimeid, nnpc_selfid, nnpc_nextid, nstage, nNpcIndex)
	self:fulushounpc_settask(TB_CHUNJIE0901_FINDNPC.TSK_CHUNJIE2009_FLS_STAGE, nnpc_nextid, 1);
	self:fulushounpc_settask(TB_CHUNJIE0901_FINDNPC.TSK_CHUNJIE2009_FLS_STAGE, nstage, 2);
	
	self:fulushounpc_settask(TB_CHUNJIE0901_FINDNPC.TSK_CHUNJIE2009_FLS_NTIMEID, ntimeid);
	
	-- 找到最后一个人则发奖
	if (nstage == 3) then
		local ntype = GetNpcParam(nNpcIndex, TB_CHUNJIE0901_FINDNPC.nNpcParam_ntype);
		local nladder = GetNpcParam(nNpcIndex, TB_CHUNJIE0901_FINDNPC.nNpcParam_ladder) + 1;
		SetNpcParam(nNpcIndex, TB_CHUNJIE0901_FINDNPC.nNpcParam_ladder, nladder);
		--Msg2Player("你是第"..nladder)
		
		local nladder = GetNpcParam(nNpcIndex, TB_CHUNJIE0901_FINDNPC.nNpcParam_ladder);
		local coef = 100;
		if (nladder >= 1 and nladder <= 3) then
			coef = 300;
		elseif (nladder >= 4 and nladder <= 10) then
			coef = 200;
		end
		
		-- local nrand = random();		-- 运气好就翻倍
		if (nladder <= 10 and ntype == 1) then
			coef = coef * 2;
			--Msg2Player("运气好翻倍")
		elseif (ntype == 2) then						-- 不好就减半喽
			coef = coef * 0.5;
			--Msg2Player("运气不好减半")
		else
			--Msg2Player("不翻倍");
		end
		
		-- 先看是不是第一名给道具奖励
		if (nladder == 1) then
			tbItem = {
				{szName="чng S竧 B筩h Kim 猽 Long Gi韎", nQuality=1, tbProp={0, 143},nRate = 0.5},
				{szName="чng S竧 B筩h Ng鋍 C祅 Kh玭 B閕", nQuality=1, tbProp={0, 144},nRate = 0.5},
				{szName="чng S竧 B筩h Kim T� Ph鬾g Gi韎", nQuality=1, tbProp={0, 145},nRate = 0.5},
				{szName="чng S竧 Ph� Th髖 Ng鋍 H筺g Khuy猲", nQuality=1, tbProp={0, 146},nRate = 0.5},
				{szName="Th莕 b� kho竛g th筩h", tbProp={6,1,398,1,1,0},nRate = 0.5},
				{szName="V� L﹎ M藅 T辌h", tbProp={6,1,26,1,1,0},nRate = 1},
				{szName="T葃 T駓 Kinh", tbProp={6,1,22,1,1,0},nRate = 1},
--				{szName="洞察之白金雕龙戒", nQuality=1, tbProp={0, 143},nRate = 20},
--				{szName="洞察之白玉乾坤佩", nQuality=1, tbProp={0, 144},nRate = 20},
--				{szName="洞察之白金锈凤戒", nQuality=1, tbProp={0, 145},nRate = 20},
--				{szName="洞察之翡翠玉项圈", nQuality=1, tbProp={0, 146},nRate = 10},
--				{szName="神秘矿石", tbProp={6,1,398,1,1,0},nRate = 10},
--				{szName="武林秘籍", tbProp={6,1,26,1,1,0},nRate = 10},
--				{szName="洗髓经", tbProp={6,1,22,1,1,0},nRate = 10},
			};
			tbAwardTemplet:GiveAwardByRate(tbItem, "chunjie_jieri2009_fulushou")
			
		end
				
		local nLevel = GetLevel();
		local naddexp = nLevel * nLevel * coef;
		local nmycurexp = self:fulushounpc_gettask(TB_CHUNJIE0901_FINDNPC.TSK_CHUNJIE2009_FLS_MAXEXP);
		if (nmycurexp >= TB_CHUNJIE0901_FINDNPC.nMaxExp) then
			Msg2Player("Х nh薾 kinh nghi謒 gi韎 h筺 cao nh蕋.");
			return 0;
		elseif (nmycurexp + naddexp >= TB_CHUNJIE0901_FINDNPC.nMaxExp) then
			naddexp = TB_CHUNJIE0901_FINDNPC.nMaxExp - nmycurexp;
		end
		
		self:fulushounpc_settask(TB_CHUNJIE0901_FINDNPC.TSK_CHUNJIE2009_FLS_MAXEXP, nmycurexp + naddexp);
		AddOwnExp(naddexp);
		Msg2Player(format("Nh薾 頲 kinh nghi謒 棗%d", naddexp));
		
		self:fulushounpc_settask(TB_CHUNJIE0901_FINDNPC.TSK_CHUNJIE2009_FLS_STAGE, nstage, 0);
		
		-- self:fulushounpc_settask(TB_CHUNJIE0901_FINDNPC.TSK_CHUNJIE2009_FLS_NTIMEID, ntimeid);
	else
		Msg2Player("Nh薾 nhi謒 v� v� t譵 nh鱪g v� b籲g h鱱 kh竎.");
	end
end

