Include("\\script\\missions\\miniencounter\\mapmanager.lua");

function main(sel)
	local tbTargetPos = 
	{
		[1] = {1663, 3381},
		[2] = {1667, 3385},
		[3] = {1671, 3392},
		[4] = {1667, 3397},
		[5] = {1659, 3394},
		[6] = {1653, 3392},
		[7] = {1654, 3383},
		[8] = {1659, 3396},
	};

	SetTmpCamp(1);
	SetCurCamp(1);

	local nTargetPosNum = getn(tbTargetPos);
	local nRandom = random(1, nTargetPosNum);

	local nMapId = GetWorldPos();
	local tbMap  = EncounterMapManager:FindInMapList(nMapId);

	if tbMap then
		local tbPlayer = tbMap:GetPlayer(GetName());
		local nCurrentTime = GetCurrentTime();

		-- 比赛未到时间给信息
		if nCurrentTime - tbMap.nGameStartTime <= DungeonGlobalData.MAP_WAIT_TIME or
		   tbMap.nGameState <= 1 then
			Msg2Player("Tr薾 chi課 v蒼 ch璦 b総 u. Xin i trong gi﹜ l竧!");
			return nil;
		end

		if nCurrentTime >= tbPlayer.nLastDeadTime + DungeonGlobalData.MAP_REBORN_TIME then
			SetFightState(1);		   -- 设置战斗状态
			SetPos(tbTargetPos[nRandom][1], tbTargetPos[nRandom][2]);
		else
			Msg2Player("Ngi  b� tr鋘g thng, ngh� ng琲 t� 甶!");
		end
	end
end
