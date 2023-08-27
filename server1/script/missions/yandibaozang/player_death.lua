-- 炎帝宝藏
-- by 小浪多多
-- 2007.10.24
-- 我..
-- 正在尝试着..
-- 寻找着属于我的天地..


Include("\\script\\missions\\yandibaozang\\include.lua")
Include("\\script\\missions\\yandibaozang\\npc_death.lua")
Include("\\script\\missions\\yandibaozang\\doubleexp.lua")
Include("\\script\\activitysys\\playerfunlib.lua")

function OnDeath(index)
	local oldsubworld = SubWorld
	local nteams = GetCurCamp()
	local szname1 = GetName()
	local szplayname1 = GetMissionS(YDBZ_TEAM_NAME[nteams])
	--print(nteams, szname1, "OnDeath")
	local nidx = NpcIdx2PIdx(index);
	if nidx > 0 then
		local oldplayindex = PlayerIndex
		PlayerIndex = nidx
		local nkills = GetTask(YDBZ_TEAMS_TASKID)
		local nteams2 = GetCurCamp()
		local szplayname2 = GetMissionS(YDBZ_TEAM_NAME[nteams2])
		local szname2 = GetName()
		SetTask(YDBZ_TEAMS_TASKID,(nkills + 1))
		local nexp = YDBZ_KILLPLAYER_EXP
		local szdstr = ""
		if YDBZ_sdl_getTaskByte(YDBZ_ITEM_YANDILING,1) == 1 then
			nexp = YDBZ_KILLPLAYER_EXP * 2
			szdstr = "<color=yellow>[Vi猰 д L謓h c� hi謚 l鵦]<color>"
		end
		nexp = YDBZ_checkdoubleexp(nexp)
		AddOwnExp(nexp)
		--Msg2Player(format("%s你获得了<color=yellow>%s<color>经验。",szdstr,nexp))
		local szstr = format("<color=yellow>%s<color> th祅h vi猲<color=yellow>%s<color> nh tr鋘g thng <color=yellow>%s<color>  c馻 t� i<color=yellow>%s<color>, s� ngi PK t╪g l猲 <color=yellow>%s<color>, %s thu 頲 <color=yellow>%s<color> kinh nghi謒.",szplayname2,szname2,szplayname1,szname1,(nkills + 1),szdstr,nexp)
		Msg2MSAll(YDBZ_MISSION_MATCH,szstr)
		PlayerIndex = oldplayindex
	end


	local g = YDBZ_ZUANYONG_ITEM[1][2]
	local d = YDBZ_ZUANYONG_ITEM[1][3]
	local p = YDBZ_ZUANYONG_ITEM[1][4]
	local numzimu = CalcItemCount(-1,g,d,p,-1)
	--local numbeibao = CalcItemCount(23,g,d,p,-1)
	
	if (numzimu >= 1) then
			Msg2Player(format("Tr猲 h祅h trang i hi謕 c� <color=yellow>%s<color>, c� th� h錳 sinh 頲 1 l莕. T筰 n琲 xu蕋 ph竧 c馻 b秓 t祅g b蕀 h錳 sinh.",YDBZ_ZUANYONG_ITEM[1][1]))
			ConsumeItem(-1,1,g,d,p,-1)
			if GetMissionV(YDBZ_STATE_SIGN) == 2 or GetMissionV(YDBZ_STATE_SIGN) == 3 then
				local nlimittime = GetMSRestTime(YDBZ_MISSION_MATCH,YDBZ_TIMER_FIGHTSTATE)
				if nlimittime <= 1 then
					StopMissionTimer(YDBZ_MISSION_MATCH,YDBZ_TIMER_FIGHTSTATE)
					StartMissionTimer(YDBZ_MISSION_MATCH,YDBZ_TIMER_FIGHTSTATE,YDBZ_LIMIT_SETFIGHTSTATE*18)
				end
			end
			return
	end
	local world = GetMissionV(YDBZ_SIGNUP_WORLD);
	local pos_x = GetMissionV(YDBZ_SIGNUP_POSX);
	local pos_y = GetMissionV(YDBZ_SIGNUP_POSY); 
	DelMSPlayer(YDBZ_MISSION_MATCH,PlayerIndex,nteams)
	SubWorld = oldsubworld
	local szteamnametalk = {}
	local szteamlast = {}
	local szstr = format("<color=blue>T� i %s<color> c� th祅h vi猲<color=blue>%s<color>  t� tr薾.",szplayname1,szname1)
	Msg2Player(szstr)
	Msg2MSAll(YDBZ_MISSION_MATCH,szstr);
	szstr = "<color=yellow>T譶h h譶h t� i: <color>\n"
	for i=1,3 do
			szteamnametalk[i] = GetMissionS(YDBZ_TEAM_NAME[i])
			szteamlast[i]	 = GetMSPlayerCount(YDBZ_MISSION_MATCH,i)
			local szyellow = ""
			if i == 1 then
				szyellow = "gold"
			elseif i == 2 then
				szyellow = "pink"
			elseif i == 3 then
				szyellow = "green"
			end
			if szteamnametalk[i] ~= "" then
				szstr = szstr .. format("\t\t<color=%s>T� i %s c遪 l筰 th祅h vi猲: %s ngi<color>\n",szyellow,szteamnametalk[i],szteamlast[i])
			end
	end
	Msg2MSAll(YDBZ_MISSION_MATCH,szstr);
	--DelMSPlayer(YDBZ_MISSION_MATCH,nteams);
	NewWorld(world, pos_x, pos_y);
	SetLogoutRV(0);
	--SubWorld = oldsubworld
	--YDBZ_restore(PlayerIndex,YDBZ_MISSION_MATCH,nteams)
--	SubWorld = oldsubworld
--	if GetMSPlayerCount(YDBZ_MISSION_MATCH,nteams) == 0 then
--		local pname = GetMissionS(YDBZ_TEAM_NAME[nteams])
--		--broadcast(format("%s的队伍，在炎帝宝藏中不小心全部阵亡了。",nteams))
--		Msg2MSAll(YDBZ_MISSION_MATCH,format("<color=yellow>%s<color>的队伍，在炎帝宝藏中不小心全部阵亡了。",pname))
--		SetMissionS(YDBZ_TEAM_NAME[nteams],"")
--		local nteamscount = GetMissionV(YDBZ_TEAM_COUNT)
--		print(nteamscount,SubWorld)
--		SetMissionV(YDBZ_TEAM_COUNT,(nteamscount-1))
--	end
--	if GetMissionV(YDBZ_TEAM_COUNT) == 1 and GetMissionV(YDBZ_STATE_SIGN) == 1 then
--		local nidx = NpcIdx2PIdx(index);
--		local world,x,y;
--		if nidx > 0 then 
--			PlayerIndex = nidx
--			world,x,y = GetWorldPos();
--			x = x * 32
--			y = y * 32 
--			print(world)
--		else
--			x, y, world = GetNpcPos(index);
--			print("NPC")
--		end
--		print(x,y,world)
--		YDBZ_add_final_npc(world,x,y)
--		Msg2MSAll(YDBZ_MISSION_MATCH,"炎帝宝藏最深处的<color=yellow>梁媚儿<color>被召唤出来了")
--		SetMissionV(YDBZ_STATE_SIGN,2)
--	end
end
