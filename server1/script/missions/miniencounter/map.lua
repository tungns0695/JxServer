Include("\\script\\lib\\file.lua");
Include("\\script\\lib\\objbuffer_head.lua");
Include("\\script\\global\\autoexec_head.lua");
Include("\\script\\missions\\basemission\\lib.lua");
Include("\\script\\missions\\basemission\\dungeon.lua");
Include("\\script\\missions\\miniencounter\\publicdef.lua");
Include("\\script\\missions\\miniencounter\\player.lua");
Include("\\script\\lib\\objbuffer_head.lua")
Include("\\script\\script_protocol\\protocol_def_gs.lua")


EncounterMap = Dungeon:new_type("miniencounter");		   -- 生成符离冲突战副本类型
--EncounterMap.nTemplateMapID = 975;						  -- 单人PVP地图模板ID，测试用
EncounterMap.nTemplateMapID = 988;						  -- 符离冲突战地图模板ID

-- EncounterMap:_init
-- 重载Dungeon:_init函数
function EncounterMap:_init(...)

	self.tbCamp = {};					 -- 阵营
	self.tbCamp[1] = {};				  -- 阵营：宋
	self.tbCamp[2] = {};				  -- 阵营：金

	self.tbCampScore = {};				-- 阵营积分
	self.tbCampScore[1] = 0;			  -- 宋方阵营积分
	self.tbCampScore[2] = 0;			  -- 金方阵营积分


	self.nGameStartTime = 0;			  -- 比赛开始时间
	-- 0 - 初始化状态，1 - 准备场等待开始状态，2 - 比赛中状态，3 - 比赛结束状态
	self.nGameState = 0;

	self.nSongPillarLv = 1;			   -- 宋方柱子等级，每杀死一次，上升一个等级，到最顶级不再上升
	self.nJinPillarLv  = 1;			   -- 金方柱子等级，每杀死一次，上升一个等级，到最顶级不再上升
	self.nResult	   = 0;			   -- 0 - 平局，1 - 宋方胜利，2 - 金方胜利

	self.tbCurPlayerNum = {};
	self.tbCurPlayerNum[1] = 0;		   -- 当前宋方在场人数
	self.tbCurPlayerNum[2] = 0;		   -- 当前金方在场人数

	-- 辅助数据
	self.nCountSecond  = DungeonGlobalData.MAP_WAIT_COUNT_SECOND;		-- 用于开启战斗前倒数
	self.nNoticeCount  = 3;											  -- 提示三次，真特么蛋疼
	self.nCeaseCountSecond = DungeonGlobalData.MAP_WAIT_COUNT_SECOND;	-- 用于结束战斗前倒数

	-- 创建NPC
	local tbNpcList = DungeonGlobalData.tbNonFightNpcPos;
	for i = 1, getn(tbNpcList) do
		basemission_CallNpc(tbNpcList[i], self.nMapId)
	end

	DungeonGlobalData:CreatePillarNpc(self.nMapId);
	return 1;
end

-- 静态函数
function EncounterMap:GetNewWorldPos(nCamp)
	--return 1583, 3231;				-- 单人PVP图测试坐标
	if nCamp == 1 then				  -- 宋方
		return 1633, 3418;
	elseif nCamp == 2 then
		return 1857, 3115;
	end

	return 1633, 3418;				  -- 发送错误，就无间道吧
end

function EncounterMap:AddMapTrap_S(nMapId, nPosX, nPosY, szScriptFile)
	if SubWorldID2Idx(nMapId) ~= -1 then
		AddMapTrap(nMapId, nPosX, nPosY, szScriptFile);
	end
end

function EncounterMap:Msg2Camp(nCamp, strMsg)
	if nCamp == nil then
		return nil;
	end

	if nCamp > 2 or nCamp < 1 then
		return nil;
	end

	if strMsg == nil then
		return nil;
	end

	local tbCampMembers = self.tbCamp[nCamp];
	local nCampNum	  = getn(tbCampMembers);

	for i = 1, nCampNum do
		local nPlayerIndex = SearchPlayer(tbCampMembers[i].szRoleName);
		if nPlayerIndex ~= nil and nPlayerIndex > 0 then
			CallPlayerFunction(nPlayerIndex, Msg2Player, strMsg);
		end
	end

	return 1;
end

-- 动态函数
function EncounterMap:CreateBattleNpc()
	DungeonGlobalData:CreateFightNpc(self.nMapId);
	return 1;
end

function EncounterMap:GetCampByName(szRoleName)
	if szRoleName == nil then
		return -1;
	end

	local nCamp1Num = getn(self.tbCamp[1]);
	local nCamp2Num = getn(self.tbCamp[2]);

	for i = 1, nCamp1Num do
		local tbPlayer = self.tbCamp[1][i];
		if tbPlayer.szRoleName == szRoleName then
			return 1;
		end
	end

	for i = 1, nCamp2Num do
		local tbPlayer = self.tbCamp[2][i];
		if tbPlayer.szRoleName == szRoleName then
			return 2;
		end
	end

	return -1;
end

function EncounterMap:GetPlayer(szRoleName)
	if szRoleName == nil then
		return nil;
	end

	local tbSongCamp = self.tbCamp[1];
	local nSongNum   = getn(tbSongCamp);
	for i = 1, nSongNum do
		if tbSongCamp[i].szRoleName == szRoleName then
			return tbSongCamp[i];
		end
	end

	local tbJinCamp = self.tbCamp[2];
	local nJinNum   = getn(tbJinCamp);
	for i = 1, nJinNum do
		if tbJinCamp[i].szRoleName == szRoleName then
			return tbJinCamp[i];
		end
	end

	return nil;
end

function EncounterMap:GetPlayerByCamp(nCamp, szRoleName)
	if szRoleName == nil then
		return nil;
	end

	local tbCamp = self.tbCamp[nCamp];
	local nCampNum = getn(tbCamp);

	for i = 1, nCampNum do
		if tbCamp[i].szRoleName == szRoleName then
			return tbCamp[i];
		end
	end
	return nil;
end

function EncounterMap:StartWait()
	-- 开始等待触发器
	local nNextTriggerTime = DungeonGlobalData.MAP_WAIT_TIME - DungeonGlobalData.MAP_WAIT_COUNT_SECOND;
	--local nNextTriggerTime = 1;

	if not self then
		print(">> Error : self is nil");
		return
	end

	self:AddTimer(nNextTriggerTime * 18, self.WaitTimer, {self});		   -- 等待触发器
	self:AddTimer(1 * 18, self.NoticeTimer, {self});						-- 消息触发器
	self:AddTimer(60 * 18, self.StopWhenNobodyTimer, {self});			   -- 没人结束比赛触发器
	self:AddTimer(50 * 18, self.SyncBattleTimer, {self});				   -- 定期向客户端同步
	return 1;
end

function EncounterMap:StartFight()
	local nNextTriggerTime = 120;										   -- 2分钟后触发

	if not self then
		print(">> Error : self is nil");
		return
	end

	self:AddTimer(nNextTriggerTime * 18, self.CeaseTimer, {self});

	return 1;
end

function EncounterMap:SyncBattleTimer()
	self:NotifyCurrentVSScore();
	return 45 * 18;
end

function EncounterMap:CeaseTimer()
	if not self then
		print(">> Error : self is nil")
		return
	end

	-- 每两分钟双方阵营各自增加1分(认为同一时刻把对方旗子杀死)
	self.tbCampScore[1] = self.tbCampScore[1] + 1;
	self.tbCampScore[2] = self.tbCampScore[2] + 1;

	self:NotifyCurrentVSScore();

	local strVSMsg = format("T� s� 甶觤 T鑞g Kim hi謓 t筰 c馻 2 b猲 l�: %d:%d", self.tbCampScore[1], self.tbCampScore[2]);
	Msg2Map(self.nMapId, "Phe Kim tng s� kh� th� h祇 h飊g, phe Kim nh薾 頲 1 甶觤.");
	Msg2Map(self.nMapId, "Phe T鑞g tng s� kh� th� h祇 h飊g, phe T鑞g nh薾 頲 1 甶觤.");
	Msg2Map(self.nMapId, strVSMsg);

	local nJudgeResult = self:JudgeWinnerWhenKillerPillar();
	if nJudgeResult > 0 then											-- 比赛结束
		self:ProcessWhenFinish(nJudgeResult);
		return 0;
	end

	-- 如果超过战斗时间，自然结束
	local nEndTime = self.nGameStartTime + DungeonGlobalData.MAP_WAIT_TIME + DungeonGlobalData.MAP_FIGHT_TIME;
	if GetCurrentTime() >= nEndTime then
		self:AddTimer(1 * 18, self.CeaseCountTimer, {self});
		return 0;
	end

	return 120 * 18;													-- 每2分钟触发一次
end

function EncounterMap:CeaseCountTimer()
	if not self then
		print(">> Error : self is nil");
		return
	end
	
	-- 倒数
	if DungeonGlobalData.MAP_WAIT_COUNT_SECOND == self.nCeaseCountSecond then
		local strMsg = "Ph� Li Xung чt Chi課 s緋 k誸 th骳, c竎 chi課 s� chu萵 b� ng鮪g chi課!";
		Msg2Map(self.nMapId, strMsg);
		strMsg = format("Th阨 gian c遪 %d gi﹜ k誸 th骳", self.nCeaseCountSecond);
		Msg2Map(self.nMapId, strMsg);
	elseif self.nCeaseCountSecond > 0 then
		local strMsg = format("Th阨 gian c遪 %d gi﹜ k誸 th骳", self.nCeaseCountSecond);
		Msg2Map(self.nMapId, strMsg);
	else
		local strMsg = "Tr阨  d莕 t鑙 甶, 2 b猲 產ng thu binh, sau n祔 u ti誴!";
		Msg2Map(self.nMapId, strMsg);
	end

	self.nCeaseCountSecond = self.nCeaseCountSecond - 1;
	if self.nCeaseCountSecond < 0 then
		local nJudgeResult = self:JudgeWinnerWhenTimeOut();
		self:ProcessWhenFinish(nJudgeResult);
		return 0;
	end

	return 1 * 18;
end

function EncounterMap:NoticeTimer()
	if not self then
		print(">> Error : self is nil");
		return
	end

	local strMsg = format("C遪 %d ph髏 Ph� Li Xung чt Chi課 s� kh雐 ng, m鋓 ngi h穣 chu萵 b�!", self.nNoticeCount);
	Msg2Map(self.nMapId, strMsg);

	self.nNoticeCount = self.nNoticeCount - 1;	
	if self.nNoticeCount <= 0 then
		return 0;
	end

	return 60 * 18;
end

function EncounterMap:WaitTimer()
	if not self then
		print(">> Error : self is nil");
		return
	end

	-- 倒数
	if DungeonGlobalData.MAP_WAIT_COUNT_SECOND == self.nCountSecond then
		local strMsg = "Ph� Li Xung чt Chi課 s緋 b総 u, m鋓 ngi h穣 chu萵 b�!";
		Msg2Map(self.nMapId, strMsg);
		strMsg = format("Th阨 gian chu萵 b� c遪 l筰 %d gi﹜", self.nCountSecond);
		Msg2Map(self.nMapId, strMsg);
	elseif self.nCountSecond > 0 then
		local strMsg = format("Th阨 gian chu萵 b� c遪 l筰 %d gi﹜", self.nCountSecond);
		Msg2Map(self.nMapId, strMsg);
	else
		local strMsg = "Ti課g tr鑞g  vang l猲, h靑 c竎 d騨g s� x玭g l猲!";
		self.nGameState = 2;
		self:AddTraps();
		self:CreateBattleNpc();
		Msg2Map(self.nMapId, strMsg);
	end

	self.nCountSecond = self.nCountSecond - 1;	
	if self.nCountSecond < 0 then
		self:StartFight();
		return 0;
	end

	return 1 * 18;
end

function EncounterMap:GetPlayerNumInGameByCamp(nCamp)
	if nCamp == nil or nCamp < 1 or nCamp > 2 then
		return nil;
	end

	local nPlayerInGameNum = 0;
	for i = 1, getn(self.tbCamp[nCamp]) do
		local tbPlayer = self.tbCamp[nCamp][i];
		if tbPlayer.nPlayerInMap == 1 then
			nPlayerInGameNum = nPlayerInGameNum + 1;
		end
	end

	return nPlayerInGameNum;
end

function EncounterMap:KickOutAllPlayer()
	local tbSongCamp = self.tbCamp[1];
	local tbJinCamp  = self.tbCamp[2];

	for i = 1, getn(tbSongCamp) do
		local tbPlayer = tbSongCamp[i];
		if tbPlayer ~= nil then
			local szRoleName   = tbPlayer.szRoleName;
			local nPlayerIndex = SearchPlayer(szRoleName);
			if nPlayerIndex ~= nil and nPlayerIndex > 0 then
				local nPlayerMapId = CallPlayerFunction(nPlayerIndex, GetWorldPos);
				-- 清空所有任务变量
				CallPlayerFunction(nPlayerIndex, tbPlayer.ClearAllTaskValue, tbPlayer);
				if nPlayerMapId ~= nil and nPlayerMapId == self.nMapId then
					CallPlayerFunction(nPlayerIndex, NewWorld, 325, 1540, 3177);
				end
			end
		end
	end

	for i = 1, getn(tbJinCamp) do
		local tbPlayer = tbJinCamp[i];
		if tbPlayer ~= nil then
			local szRoleName   = tbPlayer.szRoleName;
			local nPlayerIndex = SearchPlayer(szRoleName);
			if nPlayerIndex ~= nil and nPlayerIndex > 0 then
				local nPlayerMapId = CallPlayerFunction(nPlayerIndex, GetWorldPos);
				-- 清空所有任务变量
				CallPlayerFunction(nPlayerIndex, tbPlayer.ClearAllTaskValue, tbPlayer);
				if nPlayerMapId ~= nil and nPlayerMapId == self.nMapId then	
					CallPlayerFunction(nPlayerIndex, NewWorld, 325, 1570, 3085);
				end
			end
		end
	end
end

function EncounterMap:GiveAwardWhenBattleFinish(nCamp, nExploitBase)
	if nCamp == nil or nCamp < 1 or nCamp > 2 then
		return nil;
	end

	if nExploitBase == nil or nExploitBase < 0 then
		print(">> Error : nExploitBase is invalid!");
		return nil;
	end

	local tbCamp = self.tbCamp[nCamp];
	if tbCamp == nil then
		print(">> Error : tbCamp is invalid!");
		return nil;
	end

	for i = 1, getn(tbCamp) do
		local tbPlayer = tbCamp[i];
		if tbPlayer ~= nil then

			local szRoleName   = tbPlayer.szRoleName;
			local nPlayerIndex = SearchPlayer(szRoleName);

			if nPlayerIndex ~= nil and nPlayerIndex > 0 then

				local nPlayerMapId = CallPlayerFunction(nPlayerIndex, GetWorldPos);
				if nPlayerMapId ~= nil and nPlayerMapId == self.nMapId then

					if tbPlayer.nKillPlayerNum > 3 or tbPlayer.nKillSoldierNum > 15 or tbPlayer.nKillPillarNum > 1 then

						-- 功勋值
						local nFn = DungeonGlobalData:GetFnByTitle(tbPlayer.nTitleLv);
						local nGn = tbPlayer:IsDoubleScore();
						local nExploitValue = nExploitBase * (1 + nFn + nGn);

						local nCurrentExploit = CallPlayerFunction(
							nPlayerIndex,
							GetTask,
							DungeonGlobalData.PLAYER_EXPLOIT_TASK_VALUE
						);
						local nCurrentTotalExploit = CallPlayerFunction(
							nPlayerIndex,
							GetTask,
							DungeonGlobalData.PLAYER_HISTORY_EXPLOIT_TASK_VALUE
						);
						local nCurrentWeekExploit = CallPlayerFunction(
							nPlayerIndex,
							GetTask,
							DungeonGlobalData.PLAYER_EXPLOIT_PER_WEEK_TASK_VALUE
						);

						if nCurrentWeekExploit + nExploitValue > DungeonGlobalData.MAX_EXPLOIT_VALUE then
							local nAdd = DungeonGlobalData.MAX_EXPLOIT_VALUE - nCurrentWeekExploit;
							if nAdd < 0 then
								nAdd = 0;
							end
							nCurrentTotalExploit = nCurrentTotalExploit + nAdd;	 -- 历史总功勋
							nCurrentExploit	  = nCurrentExploit	  + nAdd;	 -- 玩家功勋
							nCurrentWeekExploit  = nCurrentWeekExploit  + nAdd;	 -- 每周获得的功勋
						else
							nCurrentTotalExploit = nCurrentTotalExploit + nExploitValue;
							nCurrentExploit	  = nCurrentExploit	  + nExploitValue;
							nCurrentWeekExploit  = nCurrentWeekExploit  + nExploitValue;
						end
						
						
						CallPlayerFunction(
							nPlayerIndex,
							Msg2Player,
							format("Tr薾 Ph� Li Xung чt Chi課 n祔 ngi nh薾 頲 %d 甶觤 c玭g hu﹏ T鑞g Kim ", nExploitValue)
						);

						CallPlayerFunction(
							nPlayerIndex,
							Msg2Player,
							format("Ph� Li Xung чt Chi課 tu莕 n祔 ngi nh薾 頲 %d 甶觤 t輈h l騳 c玭g hu﹏ T鑞g Kim ", nCurrentWeekExploit)
						);

						CallPlayerFunction(
							nPlayerIndex,
							Msg2Player,
							format("C玭g hu﹏ T鑞g Kim hi謓 t筰 c� th� d飊g l� %d 甶觤", nCurrentExploit)
						);

						CallPlayerFunction(
							nPlayerIndex,
							Msg2Player,
							format("L辌h s� 甶觤 t輈h l騳 c玭g hu﹏ T鑞g Kim nh薾 頲 trong Ph� Li Xung чt Chi課 l� %d 甶觤", nCurrentTotalExploit)
						);

						CallPlayerFunction(
							nPlayerIndex,
							SetTask,
							DungeonGlobalData.PLAYER_EXPLOIT_TASK_VALUE,
							nCurrentExploit
						);
						
						CallPlayerFunction(
							nPlayerIndex,
							SetTask,
							DungeonGlobalData.PLAYER_HISTORY_EXPLOIT_TASK_VALUE,
							nCurrentTotalExploit
						);

						CallPlayerFunction(
							nPlayerIndex,
							SetTask,
							DungeonGlobalData.PLAYER_EXPLOIT_PER_WEEK_TASK_VALUE,
							nCurrentWeekExploit
						);

						CallPlayerFunction(
							nPlayerIndex,
							SetTask,
							DungeonGlobalData.PLAYER_WEEK_EXPLOIT_TIME_TASK,
							tonumber(GetLocalDate("%W"))
						);

						-- 积分值
						local nCurrentPoint = CallPlayerFunction(
								nPlayerIndex,
								GetTask,
								DungeonGlobalData.PLAYER_POINTS_TASK_VALUE
						);
						if (self.nResult == 2 and tbPlayer.nCamp == 1) or	   -- 宋方获胜
						   (self.nResult == 3 and tbPlayer.nCamp == 2) then	 -- 金方获胜

							local nPointValue = tbPlayer.nEncounterScore;
							nCurrentPoint = nCurrentPoint + nPointValue;
							CallPlayerFunction(
								nPlayerIndex,
								Msg2Player,
								format("Tr薾 Ph� Li Xung чt Chi課 n祔 ngi nh薾 頲 甶觤 t輈h l騳 T鑞g Kim l� %d 甶觤.", nPointValue)
							);

							CallPlayerFunction(
								nPlayerIndex,
								Msg2Player,
								format("Tu莕 n祔 Ph� Li Xung чt Chi課 甶觤 t輈h l騳 T鑞g Kim nh薾 頲 l� %d 甶觤.", nCurrentPoint)
							);

							CallPlayerFunction(
								nPlayerIndex,
								SetTask,
								DungeonGlobalData.PLAYER_POINTS_TASK_VALUE,
								nCurrentPoint
							);
							tbPlayer.nCurrentPoint = nCurrentPoint;
						else
							CallPlayerFunction(
								nPlayerIndex,
								Msg2Player,
								format("Tr薾 Ph� Li Xung чt Chi課 n祔 ngi th� hi謓 kh玭g t鑤, kh玭g nh薾 頲 甶觤 t輈h l騳 T鑞g Kim.", nCurrentPoint)
							);
							tbPlayer.nCurrentPoint = nCurrentPoint;
						end -- if self.nResult == 2 then
					else
						CallPlayerFunction(
							nPlayerIndex,
							Msg2Player,
							format("Tr薾 Ph� Li Xung чt Chi課 n祔 ngi th� hi謓 kh玭g t鑤, kh玭g nh薾 頲 甶觤 t輈h l騳 T鑞g Kim.", nCurrentPoint)
						);
					end -- if tbPlayer.nKillPlayerNum > 3 or tbPlayer.nKillSoldierNum > 15 or tbPlayer.nKillPillarNum > 1 then
				end -- if nPlayerMapId ~= nil and nPlayerMapId == self.nMapId then
			end -- if nPlayerIndex ~= nil and nPlayerIndex > 0 then
		end -- if tbPlayer ~= nil then
	end -- for i = 1, getn(tbCamp) do
end

function EncounterMap:StopWhenNobodyTimer()
	local nSongPlayerInGameNum = self:GetPlayerNumInGameByCamp(1);
	local nJinPlayerInGameNum  = self:GetPlayerNumInGameByCamp(2);

	-- 等待时候没人，弹出玩家，结束战斗
	if (GetCurrentTime() - self.nGameStartTime <= DungeonGlobalData.MAP_WAIT_TIME or self.nGameState == 1) and 
	   (nSongPlayerInGameNum <= 0 or nJinPlayerInGameNum <= 0)then

		-- 先刷信息，再弹出玩家
		Msg2Map(self.nMapId, "цi phng nh chi課, mau ch鉵g n chi課 trng m韎.");
		self:KickOutAllPlayer();
		self:free();						-- 释放资源
		self:NotifyRelayGameFinish();
		return 0;
	end

	if GetCurrentTime() - self.nGameStartTime <= DungeonGlobalData.MAP_WAIT_TIME then
		return 60 * 18;
	end

	-- 没人，走正常流程结束比赛
	if nSongPlayerInGameNum <= 0 and nJinPlayerInGameNum <= 0 then
		local strMsg = "2 b猲 nh chi課, tr薾 n祔 hu�!";
		Msg2Map(self.nMapId, strMsg);
		self:ProcessWhenFinish(1);
		return 0;
	elseif nSongPlayerInGameNum <= 0 and nJinPlayerInGameNum > 0 then
		local strMsg = "Phe T鑞g nh chi課, phe Kim th緉g!";
		Msg2Map(self.nMapId, strMsg);
		self:ProcessWhenFinish(3);
		return 0;
	elseif nSongPlayerInGameNum > 0 and nJinPlayerInGameNum <= 0 then
		local strMsg = "Phe Kim nh chi課, phe T鑞g th緉g!";
		Msg2Map(self.nMapId, strMsg);
		self:ProcessWhenFinish(2);
		return 0;
	end

	return 60 * 18;
end

function EncounterMap:AddTraps()
	self:AddTrap_Song();
	self:AddTrap_Jin();
end

function EncounterMap:AddTrap_Song()
	-- 后营到前营
	local szTrapFile   = "\\settings\\missions\\miniencounter\\trap_song_back2front.txt";
	local szTrapScript = "\\script\\missions\\miniencounter\\trap_song_back2front.lua";
	TabFile_Load(szTrapFile, szTrapFile);
	local nHeight = TabFile_GetRowCount(szTrapFile);

	for i = 2, nHeight do
		local nX = TabFile_GetCell(szTrapFile, i, 1);
		local nY = TabFile_GetCell(szTrapFile, i, 2);
		--print (">> Debug : nX = "..nX);
		--print (">> Debug : nY = "..nY);
		self:AddMapTrap_S(self.nMapId, nX, nY, szTrapScript);
	end
	TabFile_UnLoad(szTrapFile);
	
	-- 前营到后营
	szTrapFile = "\\settings\\missions\\miniencounter\\trap_song_front2back.txt";
	szTrapScript = "\\script\\missions\\miniencounter\\trap_song_front2back.lua";
	TabFile_Load(szTrapFile, szTrapFile);
	nHeight = TabFile_GetRowCount(szTrapFile);

	for i = 2, nHeight do
		local nX = TabFile_GetCell(szTrapFile, i, 1);
		local nY = TabFile_GetCell(szTrapFile, i, 2);
		self:AddMapTrap_S(self.nMapId, nX, nY, szTrapScript);
	end
	TabFile_UnLoad(szTrapFile);
end

function EncounterMap:AddTrap_Jin()
	-- 后营到前营
	local szTrapFile   = "\\settings\\missions\\miniencounter\\trap_jin_back2front.txt";
	local szTrapScript = "\\script\\missions\\miniencounter\\trap_jin_back2front.lua";
	TabFile_Load(szTrapFile, szTrapFile);
	local nHeight = TabFile_GetRowCount(szTrapFile);

	for i = 2, nHeight do
		local nX = TabFile_GetCell(szTrapFile, i, 1);
		local nY = TabFile_GetCell(szTrapFile, i, 2);
		--print (">> Debug : nX = "..nX);
		--print (">> Debug : nY = "..nY);
		self:AddMapTrap_S(self.nMapId, nX, nY, szTrapScript);
	end
	TabFile_UnLoad(szTrapFile);
	
	-- 前营到后营
	szTrapFile = "\\settings\\missions\\miniencounter\\trap_jin_front2back.txt";
	szTrapScript = "\\script\\missions\\miniencounter\\trap_jin_front2back.lua";
	TabFile_Load(szTrapFile, szTrapFile);
	nHeight = TabFile_GetRowCount(szTrapFile);

	for i = 2, nHeight do
		local nX = TabFile_GetCell(szTrapFile, i, 1);
		local nY = TabFile_GetCell(szTrapFile, i, 2);
		self:AddMapTrap_S(self.nMapId, nX, nY, szTrapScript);
	end
	TabFile_UnLoad(szTrapFile);
end

function EncounterMap:IsInMap(szRoleName)
	for i = 1, getn(self.tbCamp[1]) do
		if self.tbCamp[1][i].szRoleName == szRoleName then
			return 1;
		end
	end

	for i = 1, getn(self.tbCamp[2]) do
		if self.tbCamp[2][i].szRoleName == szRoleName then
			return 1;
		end
	end

	return nil;
end

function EncounterMap:AddToCamp(nCamp, tbPlayer)
	local tbCamp = self.tbCamp[nCamp];
	local nPlayerNum = getn(tbCamp);
	tbCamp[nPlayerNum + 1] = tbPlayer;
	tbPlayer.nCamp = nCamp;
	return 1;
end

function EncounterMap:OnEnterMap()
	print("[Function Stack] - EncounterMap:OnEnterMap - map.lua");

	SetPunish(0);			   -- 惩罚关闭，0表示不受任何惩罚
	SetPKFlag(1);			   -- 打开PK开关
	--SetLogoutRV(1);			 -- 设置重生点
	SetCreateTeam(0);		   -- 关闭组队功能
	SetFightState(0);		   -- 设置战斗状态
	SetDeathType(-1);		   -- 死亡立刻重生 

	ForbitTrade(0);				-- 允许交易
	ForbidEnmity(1);			-- 禁止仇杀
	ForbidChangePK(1);		  -- 禁止改变PK标记
	
	DisabledStall(1);			-- 禁止摆摊
	DisabledUseTownP(1);		-- 禁止使用回城
	DisabledUseHeart(1);		-- 禁止使用心心相印符

	LeaveTeam();				-- 离开队伍

	-- 设置死亡脚本
	SetDeathScript("\\script\\missions\\miniencounter\\playerdeath.lua");

	local szRoleName = GetName();
	local tbPlayer = self:GetPlayer(szRoleName);
	local nCamp = GetTask(DungeonGlobalData.TASK_BATTLE_PLAYER_CAMP);
		
	if not tbPlayer then	--这是第一次进入
		tbPlayer = EncounterPlayer:new(szRoleName);
		self:AddToCamp(nCamp, tbPlayer)
		tbPlayer.nTitleLv = 1
	end

	SetTmpCamp(nCamp)
	SetCurCamp(nCamp)
	
	self.tbCurPlayerNum[nCamp] = self.tbCurPlayerNum[nCamp] + 1
	tbPlayer:RestoreAllTaskValue()
	tbPlayer.nPlayerInMap = 1

	local nX, nY = self:GetNewWorldPos(tbPlayer.nCamp)
	SetTempRevPos(self.nMapId, nX * 32, nY * 32)
	
	-- 第一次参赛领奖
	if GetTask(3999) ~= 2 then
		SetTask(3999, 1);
	end

	tbPlayer:AddTitle(tbPlayer.nCamp, tbPlayer.nTitleLv);

	-- 第一次进入也会同步
	self:NotifyCurrentVSScore();
	self:SendFuLiTopTenData2Client();
end

function EncounterMap:OnLeaveMap()

	SetPunish(1);			   -- 惩罚打开
	SetPKFlag(0);			   -- 关闭PK开关
	SetCreateTeam(1);		   -- 打开组队功能
	SetFightState(0);		   -- 设置战斗状态
	SetDeathType(0);
	
	ForbitTrade(0);				-- 允许交易
	ForbidEnmity(0);			-- 允许仇杀
	ForbitStamina(0);
	ForbidChangePK(0);		  -- 可以改变PK标记

	DisabledStall(0);			-- 可以摆摊
	DisabledUseTownP(0);		-- 可以使用回城
	DisabledUseHeart(0);		-- 可以使用心心相印符

	SetTmpCamp(0);
	SetCurCamp(GetCamp())
	LeaveTeam();				-- 离开队伍
	SetDeathScript("");

	-- 清除Title
	local szRoleName = GetName();
	local tbPlayer   = self:GetPlayer(szRoleName);
	if tbPlayer and tbPlayer.nPlayerInMap ~= -1 then
		tbPlayer:DelTitle(tbPlayer.nCamp, tbPlayer.nTitleLv);		-- 清除Title
		tbPlayer:ClearAllSkillState();	-- 清除Buff
		tbPlayer:ClearAllTaskValue();		-- 离开地图，清空任务变量
		tbPlayer.nPlayerInMap = -1;		-- 设置角色离开状态
	end

	if tbPlayer then
		self.tbCurPlayerNum[tbPlayer.nCamp] = self.tbCurPlayerNum[tbPlayer.nCamp] - 1;
		if self.tbCurPlayerNum[tbPlayer.nCamp] < 0 then
			self.tbCurPlayerNum[tbPlayer.nCamp] = 0;
		end

		self:NotifyCurrentVSScore();
	end
end

-- 返回值：0 比赛中，1 平局，2 宋方胜利，3 金方胜利
function EncounterMap:JudgeWinnerWhenKillerPillar()
	local nSongScore = self.tbCampScore[1];
	local nJinScore  = self.tbCampScore[2];
	
	local strMsg = "Phe %s t 頲 %d 甶觤 trc, nh薾 ph莕 th緉g tr薾 n祔!";
	if nSongScore >= DungeonGlobalData.MAP_WIN_SCORE and nJinScore >= DungeonGlobalData.MAP_WIN_SCORE then
		return 1;
	end

	if nSongScore >= DungeonGlobalData.MAP_WIN_SCORE and nJinScore < DungeonGlobalData.MAP_WIN_SCORE then
		strMsg = format(strMsg, DungeonGlobalData.tbCampName[1], DungeonGlobalData.MAP_WIN_SCORE);
		Msg2Map(self.nMapId, strMsg);
		return 2;
	end

	if nSongScore < DungeonGlobalData.MAP_WIN_SCORE and nJinScore >= DungeonGlobalData.MAP_WIN_SCORE then
		strMsg = format(strMsg, DungeonGlobalData.tbCampName[2], DungeonGlobalData.MAP_WIN_SCORE);
		Msg2Map(self.nMapId, strMsg);
		return 3;
	end

	return 0;
end

-- 30分钟比赛正常结束判断胜利
-- 返回值：1 平局，2 宋方胜利，3 金方胜利
function EncounterMap:JudgeWinnerWhenTimeOut()
	local nSongScore = self.tbCampScore[1];
	local nJinScore  = self.tbCampScore[2];

	local strMsg = "Chi課 u ng祔 m, t� s� 2 b猲 T鑞g Kim l� %d:%d, phe %s nh薾 ph莕 th緉g!";
	if nSongScore > nJinScore then
		strMsg = format(strMsg, nSongScore, nJinScore,DungeonGlobalData.tbCampName[1]);
		Msg2Map(self.nMapId, strMsg);
		return 2;
	end

	if nSongScore < nJinScore then
		strMsg = format(strMsg, nSongScore, nJinScore,DungeonGlobalData.tbCampName[2]);
		Msg2Map(self.nMapId, strMsg);
		return 3;
	end

	return 1;
end

function EncounterMap:ProcessWhenFinish(nResult)
	-- 防止多次释放
	if self.nGameState == 3 then
		return nil;
	end
	self.nGameState = 3;

	self.nResult = nResult;

	-- 关闭GS上的地图
	self:close();
end

-- 比赛结束处理：self:close() 中调用
function EncounterMap:OnClose()

	-- 结果结算
	local nSongExploitValueBase = 0;
	local nJinExploitValueBase  = 0;

	if self.nResult == 2 then							   -- 宋方胜利，
		Msg2Map(self.nMapId, "L莕 giao tranh n祔 phe T鑞g d騨g m穘h gi誸 ch, nh薾 頲 ph莕 th緉g!");
		nSongExploitValueBase = DungeonGlobalData.WINNER_EXPLOIT_VALUE_BASE;
		nJinExploitValueBase  = DungeonGlobalData.LOSER_EXPLOIT_VALUE_BASE;
	elseif self.nResult == 3 then						   -- 金方胜利
		Msg2Map(self.nMapId, "L莕 giao tranh n祔 phe Kim d騨g m穘h gi誸 ch, nh薾 頲 ph莕 th緉g!");
		nJinExploitValueBase  = DungeonGlobalData.WINNER_EXPLOIT_VALUE_BASE;
		nSongExploitValueBase = DungeonGlobalData.LOSER_EXPLOIT_VALUE_BASE;
	else													-- 平局
		Msg2Map(self.nMapId, "L莕 giao tranh n祔 2 b猲 kh玭g ph﹏ cao th蕄, k誸 qu� hu�!");
		local nExploitBase = (DungeonGlobalData.WINNER_EXPLOIT_VALUE_BASE + DungeonGlobalData.LOSER_EXPLOIT_VALUE_BASE) / 2;
		nSongExploitValueBase = nExploitBase;
		nJinExploitValueBase  = nExploitBase;
	end

	-- 结算奖励
	self:GiveAwardWhenBattleFinish(1, nSongExploitValueBase);
	self:GiveAwardWhenBattleFinish(2, nJinExploitValueBase);

	-- 更新排名数据
	self:SendRankData2Relay();
	
	-- 踢出所有玩家
	self:KickOutAllPlayer();

	-- 通知relay删除地图，然后通知gs删除地图信息
	self:NotifyRelayGameFinish();
end

function EncounterMap:free()
	if self._timer_ then
		for nTimerId, tb in self._timer_ do
			DelTimer(nTimerId);
		end

		self._timer_ = nil;
	end

	DungeonList[self.nMapId] = nil;
	if self.nTemplateMapId then
		ApplyDelDungeonMap(self.nTemplateMapId, self.nMapId);				   -- 删除副本地图，让所有资源释放
	end
end

-- gs传过去的一场比赛的数据格式为
-- {
--		 [szName] = nScore,
--		 ......
--		 [szName] = nScore,
-- };
function EncounterMap:SendRankData2Relay()
	local tbData = {}

	-- 宋方数据
	for i = 1, getn(self.tbCamp[1]) do
		local tbPlayer = self.tbCamp[1][i]
		tbData[tbPlayer.szRoleName] = tbPlayer.nCurrentPoint
	end
	
	-- 金方数据
	for i = 1, getn(self.tbCamp[2]) do
		local tbPlayer = self.tbCamp[2][i]
		tbData[tbPlayer.szRoleName] = tbPlayer.nCurrentPoint
	end

	-- 若要排名，在这里把数据发到RELAY
	local hObject = OB_Create()
	ObjBuffer:PushObject(hObject, tbData)
	RemoteExecute("\\script\\missions\\miniencounter\\weekly_rank.lua", "tbMiniEncounterRank:RecordResult", hObject)
	OB_Release(hObject)
end

function EncounterMap:NotifyRelayGameFinish()

	 --通知relay比赛结束，删除地图
	local hObject = OB_Create();							-- 创建一个对象
	ObjBuffer:PushObject(hObject, self.nMapId);
	RemoteExecute("\\script\\missions\\miniencounter\\protocol.lua", "game_finish", hObject);
	OB_Release(hObject);
end

function EncounterMap:PrintInfo()
	print("\n\n[Function Stack] - EncounterMap:PrintInfo - map.lua");
	print(">> Debug : nMapId = "..self.nMapId);
	print(">> Debug : nGameStartTime = "..self.nGameStartTime);
	print(">> Debug : nGameState = "..self.nGameState);
	print(">> Debug : tbCampScore[1] = "..self.tbCampScore[1]);
	print(">> Debug : tbCampScore[2] = "..self.tbCampScore[2]);
	print(">> Debug : Players in Camp 1:");
	for i = 1, getn(self.tbCamp[1]) do
		print (self.tbCamp[1][i].szRoleName, " ");
	end

	print(">> Debug : Players in Camp 2:");
	for i = 1, getn(self.tbCamp[2]) do
		print (self.tbCamp[2][i].szRoleName, " ");
	end
end

function EncounterMap:NotifyCurrentVSScore()
	local tbSongCamp = self.tbCamp[1];
	local tbJinCamp  = self.tbCamp[2];
	local nSongNum   = getn(tbSongCamp);
	local nJinNum	= getn(tbJinCamp);
	local nBattleLeftSecond = self.nGameStartTime + DungeonGlobalData.MAP_WAIT_TIME + DungeonGlobalData.MAP_FIGHT_TIME - GetCurrentTime();
	if nBattleLeftSecond < 0 then
		nBattleLeftSecond = 0;
	end
	

	for i = 1, nSongNum do
		local tbPlayer = tbSongCamp[i];
		if tbPlayer and tbPlayer.nPlayerInMap ~= -1 then
			tbPlayer:SetTaskValue(DungeonGlobalData.TASK_BATTLE_SONG_NUM   , self.tbCurPlayerNum[1]);	-- 宋人数
			tbPlayer:SetTaskValue(DungeonGlobalData.TASK_BATTLE_JIN_NUM	, self.tbCurPlayerNum[2]);	-- 金人数
			tbPlayer:SetTaskValue(DungeonGlobalData.TASK_BATTLE_SONG_SCORE , self.tbCampScore[1]);	   -- 宋得分
			tbPlayer:SetTaskValue(DungeonGlobalData.TASK_BATTLE_JIN_SCORE  , self.tbCampScore[2]);	   -- 金得分
			tbPlayer:SetTaskValue(DungeonGlobalData.TASK_BATTLE_FINISH_TIME, nBattleLeftSecond);		 -- 时间同步
		end
	end

	for i = 1, nJinNum do
		local tbPlayer = tbJinCamp[i];
		if tbPlayer and tbPlayer.nPlayerInMap ~= -1 then
			tbPlayer:SetTaskValue(DungeonGlobalData.TASK_BATTLE_SONG_NUM   , self.tbCurPlayerNum[1]);
			tbPlayer:SetTaskValue(DungeonGlobalData.TASK_BATTLE_JIN_NUM	, self.tbCurPlayerNum[2]);
			tbPlayer:SetTaskValue(DungeonGlobalData.TASK_BATTLE_SONG_SCORE , self.tbCampScore[1]);
			tbPlayer:SetTaskValue(DungeonGlobalData.TASK_BATTLE_JIN_SCORE  , self.tbCampScore[2]);
			tbPlayer:SetTaskValue(DungeonGlobalData.TASK_BATTLE_FINISH_TIME, nBattleLeftSecond);		 -- 时间同步
		end
	end
end

function EncounterMap:SendData(tbData)
	local hObject = OB_Create()
	ObjBuffer:PushByType(hObject, OBJTYPE_TABLE, tbData)
	ScriptProtocol:SendData("emSCRIPT_PROTOCOL_FULI_REPORT", hObject)
	OB_Release(hObject)
end

function EncounterMap:SendFuLiTopTenData2Client()
	if self.tbCurPlayerNum[1] == 0 or self.tbCurPlayerNum[2] == 0 then
		return nil;
	end

	local tbTopTen = {};
	local tbTotalPlayer = {};

	for i = 1, getn(self.tbCamp[1]) do
		tinsert(tbTotalPlayer, self.tbCamp[1][i])
	end

	for i = 1, getn(self.tbCamp[2]) do
		tinsert(tbTotalPlayer, self.tbCamp[2][i])
	end

	-- 排序
	sort(tbTotalPlayer, function(a, b) return a.nEncounterScore > b.nEncounterScore end)

	-- 截取前十个玩家
	local nMax = getn(tbTotalPlayer);
	if nMax > 10 then
		nMax = 10
	end
	
	for i = 1, nMax do
		local tbPlayer = tbTotalPlayer[i];
		local tbRecord = {};
		tbRecord[1] = tbPlayer.nCamp;
		tbRecord[2] = tbPlayer.szRoleName;
		tbRecord[3] = tbPlayer.nEncounterScore;
		tbRecord[4] = tbPlayer.nKillEnemyNum;
		tbRecord[5] = tbPlayer.nKillMiddlePillarNum;
		tbRecord[6] = tbPlayer.nKillEnemyPillarNum;
		tbRecord[7] = tbPlayer.nMaxKillComboNum;
		print(format("%s = %d", tbRecord[2], tbRecord[3]))
		tinsert(tbTopTen, tbRecord)
	end

	-- 发送给玩家
	for i = 1, getn(tbTotalPlayer) do
		local szRoleName   = tbTotalPlayer[i].szRoleName;
		local nPlayerIndex = SearchPlayer(szRoleName);
		if nPlayerIndex and nPlayerIndex > 0 then
			CallPlayerFunction(nPlayerIndex, self.SendData, self, tbTopTen)
		end
	end
end

-------------------------------------------- [此部分不可缺少] --------------------------------------------
local init_map = function ()
	PreApplyDungeonMap(%EncounterMap.nTemplateMapID, 0, 0);
end

AutoFunctions:Add(init_map);
-------------------------------------------- [此部分不可缺少] --------------------------------------------

-- 禁止心心相映符
DynamicExecute("\\script\\item\\heart_head.lua", "add_forbit_templatemap", EncounterMap.nTemplateMapID);


