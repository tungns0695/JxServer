Include("\\script\\missions\\miniencounter\\publicdef.lua");
Include("\\script\\missions\\miniencounter\\mapmanager.lua");

function CreateNpcTimer(nSubWorldIdx)
	local nMapId = SubWorldIdx2ID(nSubWorldIdx);
	local tbNpcPos  = DungeonGlobalData.tbPillarNpcPos[3];
	local tbNpcInfo = DungeonGlobalData.tbPillarNpcInfo[3];

	local tbMap  = EncounterMapManager.tbMapList[nMapId];			   -- 副本地图
	if tbMap == nil then
		return 0;
	end

	if tbMap.nGameState == 0 or tbMap.nGameState == 1 then
		return 0;
	end

	local nNpcIdx = AddNpcEx(
		tbNpcInfo[1].nNpcId,
		tbNpcInfo[1].nLevel,
		random(0, 4),
		nSubWorldIdx,
		tbNpcPos[1][1] * 32,
		tbNpcPos[1][2] * 32,
		1,
		tbNpcInfo[1].szName,
		tbNpcInfo[1].nIsBoss
	);

	if nNpcIdx ~= nil and nNpcIdx > 0 then
		-- 设置死亡脚本
		SetNpcDeathScript(nNpcIdx, "\\script\\missions\\miniencounter\\npcdeath_middlepillar.lua");
	end

	-- 刷信息
	Msg2Map(tbMap.nMapId, "C� R錸g xu蕋 hi謓! H穣 mau ch鉵g tranh 畂箃!");

	return 0;
end

-- nNpcIndex为死亡npc的索引，玩家索引直接使用PlayerIndex
function OnDeath(nNpcIndex)
	local nX, nY, nSubWorldIdx = GetNpcPos(nNpcIndex);
	local nMapId = SubWorldIdx2ID(nSubWorldIdx);

	local nNpcCamp = GetTmpCamp(nNpcIndex);
	local nOppNpcCamp = 0;
	if nNpcCamp == 1 then
		nOppNpcCamp = 2;
	else
		nOppNpcCamp = 1;
	end

	-- 清算积分
	local tbMap  = EncounterMapManager.tbMapList[nMapId];			   -- 副本地图
	if not tbMap then
		print(">> Error : tbMap is invalid!");
		return nil;
	end

	-- 如果被NPC打死，这里处理
	if not PlayerIndex or PlayerIndex <= 0 then
		tbMap.tbCampScore[nNpcCamp] = tbMap.tbCampScore[nNpcCamp] + DungeonGlobalData.SCORE_KILL_MIDDLE_PILLAR;
		tbMap:NotifyCurrentVSScore();

		local nJudgeResult = tbMap:JudgeWinnerWhenKillerPillar();
		if nJudgeResult <= 0 then									   -- 还未打到判断胜负条件
			AddTimer(60 * 18, "CreateNpcTimer", nSubWorldIdx);		  -- 60秒创建新NPC
			return nil;
		end

		tbMap:ProcessWhenFinish(nJudgeResult);
		return nil;
	end

	local szKillerName = GetName();									 -- 凶手名字
	if not szKillerName then
		print(">> Error : szKillerName is invalid!");
		return nil;
	end

	local nKillerIndex = SearchPlayer(szKillerName);
	if not nKillerIndex then
		print(">> Error : nKillerIndex is invalid!");
		return nil;
	end

	-- 夺旗数统计 
	local tbKiller = tbMap:GetPlayer(szKillerName);
	if tbKiller then
		tbKiller.nKillPillarNum = tbKiller.nKillPillarNum + 1;					  -- 总夺旗数
		tbKiller.nKillMiddlePillarNum = tbKiller.nKillMiddlePillarNum + 1;		  -- 夺取龙旗数
		tbKiller.nScoreGetForCamp = tbKiller.nScoreGetForCamp + DungeonGlobalData.SCORE_KILL_MIDDLE_PILLAR;
	end

	local nKillerCamp  = tbMap:GetCampByName(szKillerName);			 -- 凶手阵营

	local nOpponentCamp = -1;
	if nKillerCamp == 1 then
		nOpponentCamp = 2;
	else
		nOpponentCamp = 1;
	end

	-- 策划说：杀手的阵营得分，对面的阵营不扣分
	tbMap.tbCampScore[nKillerCamp]   = tbMap.tbCampScore[nKillerCamp] + DungeonGlobalData.SCORE_KILL_MIDDLE_PILLAR;

--	tbMap.tbCampScore[nOpponentCamp] = tbMap.tbCampScore[nOpponentCamp] - DungeonGlobalData.SCORE_KILL_MIDDLE_PILLAR;
--	if  tbMap.tbCampScore[nOpponentCamp] < 0 then
--		 tbMap.tbCampScore[nOpponentCamp] = 0;
--	end

	tbMap:NotifyCurrentVSScore();

	-- 记任务变量
	tbKiller:SetTaskValue(DungeonGlobalData.TASK_SCORE_TOTAL, tbKiller.nScoreGetForCamp); -- 为己方夺取的积分
	tbKiller:SetTaskValue(DungeonGlobalData.TASK_KILL_MIDDLE_PILLAR_NUM, tbKiller.nKillMiddlePillarNum); -- 夺取帅旗数量
	-- 刷信息
	local strMsg = "Phe %s, %s  cp 頲 c� R錸g. Phe %s 頲 %d 甶觤, t鎛g 甶觤 %d 甶觤";
	local strVSMsg = format("T� s� 甶觤 T鑞g Kim hi謓 t筰 c馻 2 b猲 l�: %d:%d", tbMap.tbCampScore[1], tbMap.tbCampScore[2]);
	strMsg = format(
		strMsg,
		DungeonGlobalData.tbCampName[nKillerCamp],
		szKillerName,
		DungeonGlobalData.tbCampName[nKillerCamp],
		DungeonGlobalData.SCORE_KILL_MIDDLE_PILLAR,
		tbMap.tbCampScore[nKillerCamp]
	);
	Msg2Map(tbMap.nMapId, strMsg);
	Msg2Map(tbMap.nMapId, strVSMsg);

	-- 立即判断胜负
	local nJudgeResult = tbMap:JudgeWinnerWhenKillerPillar();
	if nJudgeResult <= 0 then										   -- 还未打到判断胜负条件
		AddTimer(60 * 18, "CreateNpcTimer", nSubWorldIdx);			  -- 60秒创建新NPC
		return nil;
	end

	tbMap:ProcessWhenFinish(nJudgeResult);
end



