Include("\\script\\missions\\miniencounter\\publicdef.lua");
Include("\\script\\missions\\miniencounter\\mapmanager.lua");

function CreateNpcTimer(nSubWorldIdx)
	local nMapId = SubWorldIdx2ID(nSubWorldIdx);
	local tbNpcPos  = DungeonGlobalData.tbPillarNpcPos[1];
	local tbNpcInfo = DungeonGlobalData.tbPillarNpcInfo[1];
	local nPillarLv = 0;
	local tbMap  = EncounterMapManager.tbMapList[nMapId];			   -- 副本地图
	
	if tbMap == nil then
		return 0;
	end

	if tbMap.nGameState == 0 or tbMap.nGameState == 1 then
		return 0;
	end

	nPillarLv	   = tbMap.nSongPillarLv + 1;
	local nTotalLv  = getn(tbNpcInfo);
	if nPillarLv > nTotalLv then
		nPillarLv = nTotalLv;
	end
	tbMap.nSongPillarLv = nPillarLv;

	local nNpcIdx = AddNpcEx(
		tbNpcInfo[nPillarLv].nNpcId,
		tbNpcInfo[nPillarLv].nLevel,
		random(0, 4),
		nSubWorldIdx,
		tbNpcPos[1][1] * 32,
		tbNpcPos[1][2] * 32,
		1,
		tbNpcInfo[nPillarLv].szName,
		tbNpcInfo[nPillarLv].nIsBoss
	);

	if nNpcIdx ~= nil and nNpcIdx > 0 then
		-- 设置阵营
		SetTmpCamp(1, nNpcIdx);

		-- 设置死亡脚本
		SetNpcDeathScript(nNpcIdx, "\\script\\missions\\miniencounter\\npcdeath_songpillar.lua");
	end

	-- 刷信息
	tbMap:Msg2Camp(1, "Th鑞g so竔 phe ta  d鵱g l筰 c� Nguy猲 So竔, h靑 c竎 chi課 s� h穣 mau ch鉵g n b秓 v�!");
	tbMap:Msg2Camp(2, "Th鑞g so竔 phe T鑞g  d鵱g l筰 c� Nguy猲 So竔, h靑 c竎 chi課 s� h穣 mau ch鉵g cp c� tr秏 tng!");

	return 0;
end

-- nNpcIndex为死亡npc的索引，玩家索引直接使用PlayerIndex
function OnDeath(nNpcIndex)
	local nX, nY, nSubWorldIdx = GetNpcPos(nNpcIndex);
	local nMapId = SubWorldIdx2ID(nSubWorldIdx);						-- 地图ID

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
		tbMap.tbCampScore[2] = tbMap.tbCampScore[2] + 1;
		tbMap.tbCampScore[1] = tbMap.tbCampScore[1] - 1;
		tbMap:NotifyCurrentVSScore();

		local nJudgeResult = tbMap:JudgeWinnerWhenKillerPillar();
		if nJudgeResult <= 0 then									   -- 还未打到判断胜负条件
			AddTimer(60 * 18, "CreateNpcTimer", nSubWorldIdx);		  -- 60秒创建新NPC
			return nil;
		end

		tbMap:ProcessWhenFinish(nJudgeResult);
		return nil;
	end

	-- 夺旗数统计
	local szRoleName = GetName();
	local tbKiller   = tbMap:GetPlayer(szRoleName);
	if tbKiller then
		tbKiller.nKillPillarNum = tbKiller.nKillPillarNum + 1;
		tbKiller.nKillEnemyPillarNum = tbKiller.nKillEnemyPillarNum + 1;
		tbKiller.nScoreGetForCamp = tbKiller.nScoreGetForCamp + 1
	end

	-- 金方阵营积分+1(策划说不得分)
	tbMap.tbCampScore[2] = tbMap.tbCampScore[2] + 1;
	-- 宋方阵营积分-1
	tbMap.tbCampScore[1] = tbMap.tbCampScore[1] - 1;
	if  tbMap.tbCampScore[1] < 0 then
		 tbMap.tbCampScore[1] = 0;
	end
	
	tbMap:NotifyCurrentVSScore();

	-- 记任务变量
	tbKiller:SetTaskValue(DungeonGlobalData.TASK_SCORE_TOTAL, tbKiller.nScoreGetForCamp); -- 为己方夺取的积分
	tbKiller:SetTaskValue(DungeonGlobalData.TASK_KILL_ENEMY_PILLAR_NUM, tbKiller.nKillEnemyPillarNum); -- 夺敌帅旗数

	-- 刷信息
	local strMsg = "Phe Kim l鵦 lng h飊g m筺h,  tr秏 %s c� chi課 c馻 phe T鑞g, phe Kim 頲 1 甶觤, phe T鑞g m蕋 1 甶觤.";
--	local strMsg = "金方势如破竹，%s斩断了宋方的战旗，宋方失去1分。";
	local strVSMsg = format("T� s� 甶觤 T鑞g Kim hi謓 t筰 c馻 2 b猲 l�: %d:%d", tbMap.tbCampScore[1], tbMap.tbCampScore[2]);
	strMsg = format(strMsg, szRoleName);
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

