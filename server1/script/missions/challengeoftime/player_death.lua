-- description	: 玩家死亡
-- author		: wangbin
-- datetime		: 2005-06-06

Include("\\script\\missions\\challengeoftime\\include.lua")

function OnDeath(index)
	-- 修改玩家人数
	local count = GetMSPlayerCount(MISSION_MATCH) - 1;
	if (count < 0) then
		count = 0;
	end
	SetMissionV(VARV_PLAYER_COUNT, count);

	if (GetMissionV(VARV_NPC_COUNT) ~= 0) then
		-- 是否队长阵亡
		local name = GetMissionS(VARS_TEAM_NAME);
		if (name == GetName()) then
			broadcast(name .. "чi trng i ng� t� vong!");
		end
		
		-- 是否全军覆灭
		if (count == 0) then
			broadcast(name .. "To祅 i t� vong h誸!");
		end
	end

	DelMSPlayer(MISSION_MATCH, 1);
	-- 在mission内通告玩家死亡
	Msg2MSAll(MISSION_MATCH, GetName() .. "Kh玭g may t筰 tr薾 t� vong!");	
	SetLogoutRV(0)	
	NewWorld(11,3207,4978)
	
end
