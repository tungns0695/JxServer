-- 炎帝宝藏
-- by 小浪多多
-- 2007.10.24
-- 我..
-- 正在尝试着..
-- 寻找着属于我的天地..
Include("\\script\\missions\\yandibaozang\\npc.lua")
Include("\\script\\missions\\yandibaozang\\include.lua")
Include("\\script\\missions\\yandibaozang\\saizi.lua")
Include("\\script\\missions\\yandibaozang\\readymap\\include.lua")
Include("\\script\\activitysys\\g_activity.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\missions\\yandibaozang\\doubleexp.lua")
Include("\\script\\misc\\eventsys\\type\\func.lua")
--Phong V﹏ L謓h B礽 t� i h� tr� t﹏ th� - Modified By DinhHQ - 20110916
Include("\\script\\activitysys\\config\\1005\\partysupport.lua")

function YDBZ_award(index,ntype,nplayindex)
	local x, y, world = GetNpcPos(index);
	for x1,y1 in YDBZ_tbaward_item[ntype] do
		for i=1,y1[2] do
			local p = random(1,100)
			if p <= y1[1] then
				if y1[4] == 0 then
					DropItem(world, x, y, -1, y1[3][1], y1[3][2], y1[3][3], y1[3][4], y1[3][5], y1[3][6], 0, 0, 0, 0, 0, 0);
				elseif y1[4] == 1 then
						local idx= 0
						local pidx,nj
						
						local oldplayer = PlayerIndex
						PlayerIndex = nplayindex
						YDBZ_DiceDice(y1[3][1],y1[3][2],y1[3][3],20,y1[6])
						PlayerIndex = oldplayer	
				end
			end
		end
	end
end

function YDBZ_fun_award_byCount(nCount, szMsg)
	nCount = nCount or 0
	if nCount <= 0 then
		return 
	end
	local tbAward = {}
	tbAward[1] = YDBZ_tbaward_item_ex[1]
	
	szMsg = szMsg or ""
	local szLogTitle = format("%s award",szMsg)
	tbAwardTemplet:Give(tbAward, nCount, {"YDBZ", szLogTitle})
end

-- 2011.03.23 闯一关获得1炎帝宝箱
function YDBZ_fun_award_ydmibao(camp, nnpcway)
	--Phong V﹏ L謓h B礽 t� i h� tr� t﹏ th� - Modified By DinhHQ - 20110916
	local tbAllPlayers = {}
	
	local idx= 0
	local nCount = 1
	local pidx,nj, nTeamSize = GetTeamSize()
	for nj = 1, 10 do
		idx , pidx = GetNextPlayer(YDBZ_MISSION_MATCH, idx,camp );
		if (pidx > 0 and nCount >= 1) then
			local sMsg = format("Vt qua 秈 th� %d",nnpcway)
			G_ACTIVITY:OnMessage("YDBZguoguan", pidx, nnpcway);
			EventSys:GetType("YanDiBaoZang"):OnPlayerEvent("OnPass", pidx, nnpcway)
			-- C� qua 秈 2,4,6,8,10 s� nh薾 頲 1 B秓 rng vi猰  - Modified - by AnhHH 20110724
			if (mod(nnpcway,2) == 0) then
				CallPlayerFunction(pidx,YDBZ_fun_award_byCount, nCount, sMsg)
			end
			
			--Phong V﹏ L謓h B礽 t� i h� tr� t﹏ th� - Modified By DinhHQ - 20110916
			tbAllPlayers[getn(tbAllPlayers) + 1] = pidx
			
		end
		if (idx == 0) then
			break
		end
	end
	
	--Phong V﹏ L謓h B礽 t� i h� tr� t﹏ th� - Modified By DinhHQ - 20110916
	tbPVLB_PtSpprt:YDBZAward(nnpcway, tbAllPlayers)
end

function YDBZ_fun_award_exp(camp,ns)
	local idx= 0
	local pidx,nj
	local oldplayer = PlayerIndex
	for nj = 1, 10 do
		idx , pidx = GetNextPlayer(YDBZ_MISSION_MATCH, idx,camp );
		if (pidx > 0) then
				PlayerIndex = pidx
				if ns == 1 then
					local nexp = YDBZ_AWARD_EXP
					local szdstr = ""
					if YDBZ_sdl_getTaskByte(YDBZ_ITEM_YANDILING,1) == 1 then
						 nexp = YDBZ_AWARD_EXP * 2 
						 szdstr = "<color=yellow>[Vi猰 д L謓h c� hi謚 l鵦]<color>"
					end
					nexp = YDBZ_checkdoubleexp(nexp)
					AddOwnExp(nexp)
					Msg2Player(format("%s ch骳 m鮪g vt 秈 th� nh蕋, thu 頲 <color=yellow>%s<color> kinh nghi謒",szdstr,nexp))
				elseif ns == 2 then
					local nexp = YDBZ_Faninl_AWARD_EXP
					local szdstr = ""
					if YDBZ_sdl_getTaskByte(YDBZ_ITEM_YANDILING,1) == 1 then
						 nexp = YDBZ_Faninl_AWARD_EXP * 2 
						 szdstr = "<color=yellow>[Vi猰 д L謓h c� hi謚 l鵦]<color>"
					end
					nexp = YDBZ_checkdoubleexp(nexp)
					AddOwnExp(nexp)
					Msg2Player(format("%s ch骳 m鮪g t� i  gi誸 th祅h c玭g 1 boss c� n� kh�, thu 頲 <color=yellow>%s<color> kinh nghi謒",szdstr,nexp))					
				end
		end
		if (idx == 0) then
			break;
		end;
	end
	PlayerIndex = oldplayer
end
--排行榜
function YDBZ_savepaihang(camp)
	
	local teamname = GetMissionS(camp)
	local nstate = GetMissionV(YDBZ_VARV_STATE)
	local laddertime = YDBZ_LIMIT_FINISH - ( ((nstate-4)* YDBZ_LIMIT_BOARDTIME) + floor(GetMSRestTime(YDBZ_MISSION_MATCH,YDBZ_TIMER_MATCH)/18) )
	local bfind = 0
	--print("排行榜:"..laddertime.." state:"..nstate.."relast:"..GetMSRestTime(YDBZ_MISSION_MATCH,YDBZ_TIMER_MATCH))
	local nteamsum = GetMissionV(YDBZ_TEAM_SUM)
	if nteamsum < 3 then
		return laddertime
	end
	if (laddertime > YDBZ_LIMIT_FINISH or laddertime < 0) then
		return laddertime
	end
	for i = 1, 10 do 
		name , value = Ladder_GetLadderInfo(YDBZ_PAIHANG_ID, i)
		if (name  == teamname) then
			bfind = 1
			if ( laddertime > value) then
				Ladder_NewLadder(YDBZ_PAIHANG_ID, teamname, laddertime,1)
				break
			end
		end
	end
	
	if (bfind == 0) then
		Ladder_NewLadder(YDBZ_PAIHANG_ID, teamname, laddertime, 1)
	end
	return laddertime
end

-- todo
-- 将40个炎帝秘宝随机分配，发给队伍里的人
function YDBZ_award_finalboss_ex(camp, nTotalCount)
	local nNum = {}
	local nSize = GetMSPlayerCount(YDBZ_MISSION_MATCH, camp)
	for i = 1, nSize do
		nNum[i] = 1
	end
	
	for i = nSize + 1, nTotalCount do                     
		local p = random(1,nSize)
		nNum[p] = nNum[p] + 1
	end
	print("Nh﹏ S� i ng� =" .. nSize)
	local idx, pidx
	for nj = 1, nSize do
		idx , pidx = GetNextPlayer(YDBZ_MISSION_MATCH, idx, camp );
		if (pidx > 0 and nNum[nj] >= 1) then
			local szMsg = format("Vt qua 秈 cu鑙 c飊g")
			print(format("pidx = %d, nNum[nj] = %d", pidx, nNum[nj]))
			CallPlayerFunction(pidx,YDBZ_fun_award_byCount, nNum[nj], szMsg)
		end
		if (idx == 0) then
			break
		end
	end
	
end

function YDBZ_award_finalboss(camp)
	local idx= 0
	local pidx,nj
	local nplaynum = 0
	
	-- Gi誸 Boss cu鑙 t輓h n╪g vi猰  - Modified - by DinhHQ 20120314
	local tbAward = YDBZ_tbaward_item[4]
	local szLogTitle = "GietBossCuoiTinhNangViemDe"
	local oldplayer = PlayerIndex
	for nj = 1, 10 do
		idx , pidx = GetNextPlayer(YDBZ_MISSION_MATCH, idx,camp );
		if (pidx > 0) then
			PlayerIndex = pidx
			tbAwardTemplet:Give(tbAward, 1, {"YDBZ", szLogTitle})
			nexp = YDBZ_checkdoubleexp(20e6)
			AddOwnExp(nexp)
			Msg2Player(format("<color=yellow>Ch骳 m鮪g ho祅 th祅h vt 秈 vi猰 , thu 頲 <color>%s kinh nghi謒<color=yellow>.<color>",nexp))
		end
		if (idx == 0) then
			break;
		end;
	end
	PlayerIndex = oldplayer
--	local oldplayer = PlayerIndex
--	for nj = 1, 10 do
--		idx , pidx = GetNextPlayer(YDBZ_MISSION_MATCH, idx,camp );
--		if (pidx > 0) then
--				PlayerIndex = pidx
--				nplaynum = nplaynum + 1
--				--AddOwnExp(YDBZ_AWARD_EXP)
--				local tbawarditem = {}
--				local y = YDBZ_tbaward_item[4]
--				local nitem = 0
--				for nx,ny in y do 
--					local ncount = 0
--					for i=1,ny[2] do
--						local p = random(1,100)
--						if p <= ny[1] then
--							nitem = nitem + 1
--							local ndoubel = 1
--							if ny[6] == 1 then 
--								if YDBZ_sdl_getTaskByte(YDBZ_ITEM_YANDILING,1) == 1 then
--									ndoubel = 2 
--								end
--							end
--							for nx =1 ,ndoubel do
--								local nidx = AddItem(ny[3][1], ny[3][2], ny[3][3], ny[3][4], ny[3][5], ny[3][6]);
--								YDBZ_sdl_writeLog("Vt 秈 b秓 t祅g vi猰 ",format("L骳 vt 秈 thu 頲 1 %s",GetItemName(nidx)))
--							end
--							ncount = ncount + ndoubel
--							--tbawarditem[nx]={}
--							--tbawarditem[nx][1] = ny[5]
--						end
--					end
--					if ncount > 0 then
--						tbawarditem[nitem] = {}
--						tbawarditem[nitem][1] = ny[5]
--						tbawarditem[nitem][2] = ncount
--					end
--					
--				end
--				local szstr = ", <color=yellow> thu 頲 <color>"
--				for nx,ny in tbawarditem do
--					szstr = szstr .. ny[2] .."c竔"..ny[1]
--					if nx ~= getn(tbawarditem) then
--						szstr = szstr .."<color=yellow>, <color>" 
--					end
--				end
--				local nexp = YDBZ_KILLLASTBOSS_EXP
--				local szdstr = ""
--				if YDBZ_sdl_getTaskByte(YDBZ_ITEM_YANDILING,1) == 1 then
--							nexp = YDBZ_KILLLASTBOSS_EXP * 2 
--							szdstr = "<color=yellow>[Vi猰 д L謓h c� hi謚 l鵦]<color>"
--				end
		--		nexp = YDBZ_checkdoubleexp(nexp)
--				AddOwnExp(nexp)
--				Msg2Player(format("%s<color=yellow>ch骳 m鮪g ho祅 th祅h vt 秈 vi猰 , thu 頲 <color>%s kinh nghi謒 %s<color=yellow>.<color>",szdstr,nexp,szstr))
--				Msg2Player(format("Ch骳 m鮪g c竎 v� i hi謕 vt 秈 Vi猰 д th祅h c玭g, <color=yellow>30 gi﹜<color> sau s� y ra kh醝 b秐  b秓 t祅g."))
--		end
--		if (idx == 0) then
--			break;
--		end;
--	end
	SetMissionV(YDBZ_STATE_SIGN,4)
	local pname = GetMissionS(camp)
	local nmapid = SubWorldIdx2ID(SubWorld)
	broadcast(format("Ch骳 m鮪g t� i %s  vt 秈 vi猰  th祅h c玭g, thu 頲 ph莕 thng v� c飊g qu� gi�.",pname))
	local ntime = YDBZ_savepaihang(camp)
	--print(pname,nplaynum,nmapid,camp,ntime)
	local szstr = format("[Vt 秈 b秓 t祅g vi猰 ] th阨 gian %s, chi課 i %s c遪 l筰 s� ngi %s, s� hi謚 b秐  %s, tr薾 doanh l� %s gi誸 BOSS cu鑙, d� th阨 gian %s gi﹜",GetLocalDate("%y-%m-%d %H:%M:%S"),pname,nplaynum,nmapid,camp,ntime) 
	WriteLog(szstr)
--	PlayerIndex = oldplayer
	StopMissionTimer(YDBZ_MISSION_MATCH, YDBZ_TIMER_MATCH);	
	StartMissionTimer(YDBZ_MISSION_MATCH,YDBZ_TIMER_FIGHTSTATE,YDBZ_TIME_WAIT_STATE3 * 18)
	--
	--CloseMission(YDBZ_MISSION_MATCH)
end
--1	1 -10 A小关小Boss
--1 11-20 B小关小Boss
--1 21-30 C小关小Boss
--1 40		 争夺地10个boss
--1 50		 最终大boss
--2 1-10		 A各小关小怪
--2 11-20		 B各小关小怪
--2 21-30		 C各小关小怪
function OnDeath(index)
	local oldworld = SubWorld
	local x, y,world = GetNpcPos(index);
	SubWorld = world
	local nband = GetNpcParam(index,1)
	local nband2 = GetNpcParam(index,2)
	--print("mon npc dead! param:"..nband)
	--print("mon npc dead! param2:"..nband2)
	local npccount = 0
	if nband == 0 then												--小怪
		local nteam = floor((nband2-1)/10)+1		--队伍
		local npctype = nband2 - 10*(nteam-1)		--门派
		local npcallsum = 0
		--print(nteam,npctype,YDBZ_NPC_ATTRIDX_COUNT,world,YDBZ_NPC_COUNT[nteam])
		npcallsum = YDBZ_map_npc[npctype][1][YDBZ_NPC_ATTRIDX_COUNT]

		local npccount = GetMissionV(YDBZ_NPC_COUNT[nteam])
		local npcway = GetMissionV(YDBZ_NPC_WAY[nteam])

		--print(npcallsum,npccount,nteam)
		if npccount + 1 == npcallsum then
			SetMissionV(YDBZ_NPC_COUNT[nteam],0)
			local file = YDBZ_map_posfiles[1][nteam][npcway+1]
			YDBZ_add_npc(file,nteam,npcway+1,2)
			if npcway + 1 == 3 or npcway + 1 == 6 then
				YDBZ_add_npc(file,nteam,npcway+1,21)
				SetMissionV(YDBZ_NPC_COUNT[nteam],2)
			else
				SetMissionV(YDBZ_NPC_COUNT[nteam],1)
			end
		else
			SetMissionV(YDBZ_NPC_COUNT[nteam],(npccount + 1))
		end

	elseif nband >= 1 and nband <= 30 then	--前10小关的boss怪		
			local nteam = (floor((nband-1)/10))+1					--队伍
			local npcway = nband - 10*(nteam-1)			--关
			
			local nCount = GetMissionV(YDBZ_NPC_COUNT[nteam])
			if nCount == 1 then
				SetMissionV(YDBZ_NPC_COUNT[nteam], 0)
				SetMissionV(YDBZ_NPC_WAY[nteam],npcway)
			if npcway == 10 then
				if GetMissionV(YDNZ_STATE_SIGN) ~= 0 then
					Msg2MSAll(YDBZ_MISSION_MATCH,"Х bc v遖 giai 畂筺 tranh 畂箃, c鯽 秈  ng.")
					return 
					end
				end
			--print("teams:"..nteam.." way:"..npcway)
			local mapfile = YDBZ_mapfile_trap[nteam][4].."trap"..npcway..".txt"
			YDBZ_bt_clearzhangai(mapfile)
			YDBZ_fun_award_exp(nteam,1)
			
			YDBZ_fun_award_ydmibao(nteam,npcway)	-- 2011.03.23 炎帝调整
			YDBZ_award(index,2,PlayerIndex)
			local teamname = GetMissionS(YDBZ_TEAM_NAME[nteam])
			local szstr = format("<color=yellow>%s<color> th祅h c玭g vt 秈 <color=yellow>th� %s<color>.",teamname,npcway)
			if npcway == 10 then
				szstr = szstr .. "Ti課 v祇 n琲 s﹗ nh蕋 c馻 s琻 ng."	
				else				
					local file = YDBZ_map_posfiles[1][nteam][npcway+1]
					YDBZ_add_npc(file,nteam,npcway+1,1)
				end
				Msg2MSAll(YDBZ_MISSION_MATCH,szstr)
			else
				YDBZ_fun_award_exp(nteam,1)
				YDBZ_award(index,2,PlayerIndex)
				SetMissionV(YDBZ_NPC_COUNT[nteam], nCount-1) 
			end
			
	elseif nband == 40 then							--争夺地10个boss
			npccount = GetMissionV(YDBZ_NPC_BOSS_COUNT)
			local nteam = GetCurCamp()
			SetMissionV(YDBZ_NPC_BOSS_COUNT,npccount-1)
			YDBZ_award(index,3,PlayerIndex)
			YDBZ_fun_award_exp(nteam,2)
			if npccount-1 == 0 then
				Msg2MSAll(YDBZ_MISSION_MATCH,"Vt 秈 b秓 t祅g vi猰   ti課 v祇 <color=yellow>giai 畂筺 tranh 畂箃<color>, <color=yellow>10 gi﹜<color> sau s� tri謚 g鋓 t蕋 c� th祅h vi猲 trong t� i v祇 b秐  tranh 畂箃, ch� c遪 <color=yellow>1 t� i<color> m韎 c� th� tri謚 g鋓 BOSS cu鑙.")
				SetMissionV(YDBZ_STATE_SIGN,1)
				for i=1,3 do 
					local trapfile = YDBZ_mapfile_trap[i][4].."trap10.txt"
					YDBZ_bt_addZhangai(trapfile)
				end
				StartMissionTimer(YDBZ_MISSION_MATCH,YDBZ_TIMER_FIGHTSTATE,YDBZ_TIME_WAIT_STATE1*18)
			end

	elseif nband == 50 then							--最终大boss
			--local oldplayer = PlayerIndex 
			--PlayerIndex = index
			nteam = GetCurCamp()
			--print(nteam)
			YDBZ_award_finalboss(nteam)
			-- сng ph莕 thng Vi猰 д B秓 Rng khi k誸 th骳  Vi猰 д- Modified - by AnhHH 20110726
		--	YDBZ_award_finalboss_ex(nteam, 40)	-- 杀死最终boss，领取宝箱奖励，随机分配40炎帝秘宝
			G_ACTIVITY:OnMessage("YDBZ_KillMaxBoss", YDBZ_MISSION_MATCH, nteam);
		--	PlayerIndex = oldplayer
	end
	SubWorld = oldworld
end

