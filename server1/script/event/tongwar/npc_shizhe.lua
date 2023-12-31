--武林第一帮使者
-- 九月天下第一帮 第一名帮会帮主可以登记自己的队友

Include("\\script\\event\\tongwar\\head.lua");		--天下第一帮头文件
Include("\\script\\task\\system\\task_string.lua");	--对话界面头文件
Include("\\script\\global\\titlefuncs.lua");		-- 称号

Include("\\script\\vng_event\\give_support_item.lua")
Include("\\script\\vng_feature\\thdnb\\baodanh.lua")
SZONETONG_LGNAME	=	"ONETONG_ONETONG";
ONETONG_LGTYPE		=	541;
ONETONG_ACC_LGTYPE	=	542;
_TB_ONETONG_MEMLIST	=	{-1, {}};
local SZTONGNAME_ONETONG = "BC";
local N_TTITLE_ID = 199;

ONETONG_START_SIGNUP	= 20130415						-- 天下第一帮开始登记时间
ONETONG_ENDLE_SIGNUP	= 20130421						-- 天下第一帮结束登记时间

ONETONG_START_TITLE		= 20100118						-- 天下一帮领取头衔开始时间
ONETONG_ENDLE_TITLE		= 20100214						-- 天下一帮领取头衔结束时间

ONETONG_MAX_SIGNMEM		= 74

function main()
	local nDate = tonumber(GetLocalDate("%Y%m%d"));
	if (nDate >= ONETONG_START_SIGNUP and nDate <= ONETONG_ENDLE_SIGNUP) then
		if (getn(_TONGWAR_ARRRANK) == 0) then
			tongwar_create()
			tongwar_cityrank();
		end;
		CreateTaskSay({"<dec><npc>Ho箃 ng ng k� chi課 i Thi猲 H� е Nh蕋 Bang 產ng ti課 h祅h, ngi t譵 ta c� vi謈 g�: ",
					"Xem danh s竎h th祅h vi猲/onetong_showlistmem",
					"B竜 danh tham gia Thi猲 H� е Nh蕋 Bang/onetong_signupmem",
					"Giao n閜 v藅 ph萴 h� tr� T鑞g Kim/#GiveSupportItem:OpenUI()",
					"B竜 danh Thi猲 H� е Nh蕋 Bang d祅h cho bang t top n閜 l謓h b礽/#tbTHDNBReg:AddDialog()",
					"K誸 th骳 i tho筰/OnCancel"});
		
	elseif (nDate >= ONETONG_START_TITLE and nDate <= ONETONG_ENDLE_TITLE) then
		
		CreateTaskSay({format("<dec><npc>T筰 h� ph� tr竎h t苙g danh hi謚 %s cho bang %s. Ngi t譵 ta c� vi謈 g�?", "Cao C蕄 е Nh蕋 Bang", %SZTONGNAME_ONETONG ),
					format("Ta l� th祅h vi猲 c馻 bang %s./onetong_awardtitle", %SZTONGNAME_ONETONG),
					"K誸 th骳 i tho筰/OnCancel"});
	else
		CreateTaskSay({format("<dec><npc>Ch祇 %s!", GetName()), "K誸 th骳 i tho筰/OnCancel" });
	end;
	
end;

function onetong_showlistmem()
	local n_lid = tongwar_check_ownerright(1);
	if (FALSE(n_lid)) then
		CreateTaskSay({"<dec><npc>Ch� c� bang ch� V� L﹎ е Nh蕋 Bang l莕 11 m韎 c� th� th鵦 hi謓 thao t竎 n祔.", "K誸 th骳 i tho筰/OnCancel"});
		return 0;
	end;
	
	local szLeagueName = LG_GetLeagueInfo(n_lid);
	if (szLeagueName ~= _TONGWAR_ARRRANK[1][1]) then
		CreateTaskSay({"<dec><npc>Ch� c� bang ch� V� L﹎ е Nh蕋 Bang l莕 11 m韎 c� th� th鵦 hi謓 thao t竎 n祔.", "K誸 th骳 i tho筰/OnCancel"});
		return 0;
	end;
	
	if (_TB_ONETONG_MEMLIST[1] == -1) then
		onetong_createlist();	--重载名单
	end;
	
	if (_TB_ONETONG_MEMLIST[1] == 0) then
		CreateTaskSay({"<dec><npc>Hi謓 kh玭g c� th祅h vi猲 n祇 trong danh s竎h.", "K誸 th骳 i tho筰/OnCancel"});
		return 1;
	end;
	
	local tbOpp = onetong_selfinfo2next(0);
	tinsert(tbOpp, 1, "<dec><npc>Danh s竎h th祅h vi猲: ")
	CreateTaskSay(tbOpp);
	
end;

function onetong_createlist()
	local n_lid = LG_GetLeagueObj(ONETONG_LGTYPE, SZONETONG_LGNAME);
	if (FALSE(n_lid)) then
		local nLeagueID = LG_CreateLeagueObj()
		LG_SetLeagueInfo(nLeagueID, ONETONG_LGTYPE, SZONETONG_LGNAME)
		local ret = LG_ApplyAddLeague(nLeagueID, "", "")
		LG_FreeLeagueObj(nLeagueID);
		_TB_ONETONG_MEMLIST[1] = 0;
		if (ret == 1) then
			onetong_applyaddmem(ONETONG_LGTYPE, SZONETONG_LGNAME, GetName());
			LG_ApplySetMemberTask(ONETONG_LGTYPE, SZONETONG_LGNAME, GetName(), 1, 1);
			onetong_addacclist(GetName())
			_TB_ONETONG_MEMLIST[1] = 1;
			tinsert(_TB_ONETONG_MEMLIST[2], GetName())
			--_TB_ONETONG_MEMLIST[2][getn(_TB_ONETONG_MEMLIST[2]) + 1] = GetName();
		end;
		return 1;
	end;
	_TB_ONETONG_MEMLIST[1] = LG_GetMemberCount(n_lid);
	for i = 0, _TB_ONETONG_MEMLIST[1]-1 do
		local sz_pl = LG_GetMemberInfo(n_lid, i);
		tinsert(_TB_ONETONG_MEMLIST[2], sz_pl)
		--_TB_ONETONG_MEMLIST[2][i + 1] = sz_pl;
	end;
	return 1;
end;

function OnCancel()
end;

function onetong_managemem(szmem, npos)
	CreateTaskSay({format("<dec><npc>Th祅h vi猲 mu鑞 xem: <enter>%s", szmem), 
			format("Lo筰 b� th祅h vi猲/#onetong_delonemem([[%s]], %d)",szmem, npos),
			"K誸 th骳 i tho筰/OnCancel"		});
end;

function onetong_delonemem(szmem, npos)
	local n_lid = LG_GetLeagueObjByRole(ONETONG_LGTYPE, szmem);
	if (FALSE(n_lid)) then
		return
	end;
	CreateTaskSay({format("<dec><npc>X竎 nh薾 mu鑞 lo筰 b� th祅h vi猲:<enter>%s",szmem),
			format("уng �!/#onetong_suredelmem([[%s]], %d)",szmem, npos),
			"H駓 b� /OnCancel"});
end;

function onetong_suredelmem(szmem, npos)
	
	local n_lid = LG_GetLeagueObjByRole(ONETONG_LGTYPE, szmem);
	if (FALSE(n_lid)) then
		return
	end;
	if (LG_GetMemberTask(ONETONG_LGTYPE, SZONETONG_LGNAME, szmem, 1) == 1) then
		CreateTaskSay({"<dec><npc>Bang ch� Thi猲 H� е Nh蕋 Bang kh玭g th� b� lo筰 kh醝 danh s竎h.", "K誸 th骳 i tho筰/OnCancel"});
		return
	end;
	
	if (_TB_ONETONG_MEMLIST[2][npos] ~= szmem) then
		return
	end;
	
	local n_lid = tongwar_check_ownerright(1);
	if (FALSE(n_lid)) then
		CreateTaskSay({"<dec><npc>Ch� c� bang ch� V� L﹎ е Nh蕋 Bang l莕 11 m韎 c� th� th鵦 hi謓 thao t竎 n祔.", "K誸 th骳 i tho筰/OnCancel"});
		return 0;
	end;
	
	local szLeagueName = LG_GetLeagueInfo(n_lid);
	if (szLeagueName ~= _TONGWAR_ARRRANK[1][1]) then
		CreateTaskSay({"<dec><npc>Ch� c� bang ch� V� L﹎ е Nh蕋 Bang l莕 11 m韎 c� th� th鵦 hi謓 thao t竎 n祔.", "K誸 th骳 i tho筰/OnCancel"});
		return 0;
	end;
	
	LGM_ApplyRemoveMember(ONETONG_LGTYPE, SZONETONG_LGNAME, szmem, "", "", 0);
	tremove(_TB_ONETONG_MEMLIST[2], npos);
	_TB_ONETONG_MEMLIST[1] = getn(_TB_ONETONG_MEMLIST[2]);
	
	WriteLog(format("%s\tName:%s\tAccount:%s\tTongName:%s Delete OneTong Member %s",
					GetLocalDate("%d-%m-%Y %X"),
					GetName(),
					GetAccount(),
					GetTongName(),
					szmem
					));
	
	if (_TB_ONETONG_MEMLIST[1] == 0) then
		_TB_ONETONG_MEMLIST[1] = -1;
	end;
	CreateTaskSay({format("<dec><npc>Х lo筰 b� th祅h vi猲:<enter>%s", szmem), "K誸 th骳 i tho筰/OnCancel"});
end;

function onetong_selfinfo2next( num )
	local opp = {};
	--if ( getn(_TB_ONETONG_MEMLIST[2]) - num > 10 ) then
	if ( _TB_ONETONG_MEMLIST[2].n - num > 10 ) then
		for i = num+1, num+10 do
			opp[ getn(opp) + 1 ] = format("%s/#onetong_managemem([[%s]],%d)", _TB_ONETONG_MEMLIST[2][i],_TB_ONETONG_MEMLIST[2][i], i);
		end
		opp[getn(opp)+1] = format("Trang k� /#onetong_selfinfo2next(%d)", (num+10));
	else
		--for i = num+1, getn( _TB_ONETONG_MEMLIST[2] ) do
		for i = num+1, _TB_ONETONG_MEMLIST[2].n do
			opp[ getn(opp) + 1 ] = format("%s/#onetong_managemem([[%s]],%d)", _TB_ONETONG_MEMLIST[2][i],_TB_ONETONG_MEMLIST[2][i], i);
--			opp[getn(opp) + 1] = _TB_ONETONG_MEMLIST[2][i];
		end;
	end;
	opp[getn(opp)+1] = "сng/OnCancel";
	if( num == 0 ) then
		return opp;
	end;
	tinsert(opp, 1, "<dec><npc>Danh s竎h th祅h vi猲: ");
	CreateTaskSay(opp);
end

function onetong_signupmem()
	local n_lid = tongwar_check_ownerright(1);
	if (FALSE(n_lid)) then
		CreateTaskSay({"<dec><npc>Ch� c� bang ch� V� L﹎ е Nh蕋 Bang l莕 11 m韎 c� th� th鵦 hi謓 thao t竎 n祔.", "K誸 th骳 i tho筰/OnCancel"});
		return 0;
	end;
	
	local szLeagueName = LG_GetLeagueInfo(n_lid);
	if (szLeagueName ~= _TONGWAR_ARRRANK[1][1]) then
		CreateTaskSay({"<dec><npc>Ch� c� bang ch� V� L﹎ е Nh蕋 Bang l莕 11 m韎 c� th� th鵦 hi謓 thao t竎 n祔.", "K誸 th骳 i tho筰/OnCancel"});
		return 0;
	end;
	
	if (_TB_ONETONG_MEMLIST[1] == -1) then
		onetong_createlist();	--重载名单
	end;
	
	local szmastername = GetName();
	local n_size = GetTeamSize();
	
	if (n_size < 2) then
		CreateTaskSay({"<dec><npc>H穣 t� i v韎 th祅h vi猲 trc r錳 m韎 b竜 danh tham gia.", "K誸 th骳 i tho筰/OnCancel"});
		return
	elseif (n_size > 2) then
		CreateTaskSay({"<dec><npc>M鏸 l莕 b竜 danh c莕 t� i v韎 1 th祅h vi猲.", "K誸 th骳 i tho筰/OnCancel"});
		return
	end;
	
	if (IsCaptain() == 0) then
		CreateTaskSay({"<dec><npc>Ch� c� i trng m韎 c� th� ti課 h祅h b竜 danh.", "K誸 th骳 i tho筰/OnCancel"});
		return 0;
	end;
	
	local n_onetongid = LG_GetLeagueObj(ONETONG_LGTYPE, SZONETONG_LGNAME);
	local nCurMemCnt = LG_GetMemberCount(n_onetongid);
	if (nCurMemCnt < _TB_ONETONG_MEMLIST[1]) then
		nCurMemCnt = _TB_ONETONG_MEMLIST[1];
	end;
	if (nCurMemCnt >= ONETONG_MAX_SIGNMEM) then
		CreateTaskSay({"<dec><npc>Danh s竎h th祅h vi猲 Thi猲 H� е Nh蕋 Bang   s�, kh玭g th� ti誴 t鬰 b竜 danh.", "K誸 th骳 i tho筰/OnCancel"});
		return 0;
	end;
	
	local szmemname = "";
	local bp = 0;
	local nfact = -1;
	local oldPlayer = PlayerIndex;
	for i = 1, 2 do
		local nplayer = GetTeamMember(i);
		PlayerIndex = nplayer;
		
		if (GetName() ~= szmastername) then
			szmemname = GetName();
			if (FALSE(LG_GetLeagueObjByRole(ONETONG_LGTYPE, szmemname))) then
				bp = 1;
				nfact = GetLastFactionNumber();
			end;
			break
		end;
	end;
	PlayerIndex = oldPlayer;
	if (bp == 1) then
		if (nfact ~= -1) then
			CreateTaskSay({format("<dec><npc>Ngi x竎 nh薾 mu鑞 b竜 danh cho <color=yellow>%s<color> kh玭g?",szmemname), format("Ta ng �/#onetong_addmemlist([[%s]])", szmemname),"K誸 th骳 i tho筰/OnCancel"});
		else
			CreateTaskSay({"<dec><npc>Th祅h vi猲 ch� tr緉g kh玭g th� b竜 danh tham gia!", "K誸 th骳 i tho筰/OnCancel"});
		end;
	else
		CreateTaskSay({format("<dec><npc>Ngi ch琲 <color=yellow>%s<color> hi謓  c� t猲 trong danh s竎h!",szmemname), "K誸 th骳 i tho筰/OnCancel"});
	end;
end;

function onetong_addmemlist(szmemname)
	--Fix bug member disconnect while registrering - Modified by DinhHQ - 20110520
	local nPIndex = SearchPlayer(szmemname)
	if nPIndex <= 0 then
		CreateTaskSay({format("<dec><npc>Ngi ch琲 <color=yellow>%s<color> b竜 danh th蕋 b筰.", szmemname), "K誸 th骳 i tho筰/OnCancel"});
		return
	end
	
	if (FALSE(LG_GetLeagueObjByRole(ONETONG_LGTYPE, szmemname))) then
		
		nPIndex = SearchPlayer(szmemname)
		if nPIndex <= 0 then
		CreateTaskSay({format("<dec><npc>Ngi ch琲 <color=yellow>%s<color> b竜 danh th蕋 b筰.", szmemname), "K誸 th骳 i tho筰/OnCancel"});
		return
	end
		
		local ret = onetong_applyaddmem(ONETONG_LGTYPE, SZONETONG_LGNAME, szmemname);
		if (ret == 1 and onetong_addacclist(szmemname) == 1) then
			CreateTaskSay({format("<dec><npc>Ngi ch琲 <color=yellow>%s<color> b竜 danh th祅h c玭g!", szmemname), "K誸 th骳 i tho筰/OnCancel"});
			Msg2Team(format("Ngi ch琲 <color=yellow>%s<color> b竜 danh th祅h c玭g!", szmemname))
			_TB_ONETONG_MEMLIST[1] = _TB_ONETONG_MEMLIST[1] + 1;
			--_TB_ONETONG_MEMLIST[2][getn(_TB_ONETONG_MEMLIST[2]) + 1] = szmemname;
			tinsert(_TB_ONETONG_MEMLIST[2], szmemname);
			
			WriteLog(format("%s\tName:%s\tAccount:%s\tTongName:%s ApplyAdd OneTong Member %s",
					GetLocalDate("%d-%m-%Y %X"),
					GetName(),
					GetAccount(),
					GetTongName(),
					szmemname
					));
		else
			CreateTaskSay({format("<dec><npc>Ngi ch琲 <color=yellow>%s<color> b竜 danh th蕋 b筰.", szmemname), "K誸 th骳 i tho筰/OnCancel"});
		end;
	end;
end;

function onetong_addacclist(szmemname)
	local nPIdx = SearchPlayer(szmemname);
	if (nPIdx > 0) then	--角色在线
		local nOldPlayerIndex = PlayerIndex;
		PlayerIndex = nPIdx;
		local szmemacc = GetAccount();
		local n_lid = LG_GetLeagueObj(ONETONG_ACC_LGTYPE, szmemacc);
		if (FALSE(n_lid)) then
			local nLeagueID = LG_CreateLeagueObj();
			LG_SetLeagueInfo(nLeagueID, ONETONG_ACC_LGTYPE, szmemacc);
			local ret = LG_ApplyAddLeague(nLeagueID, "", "")
			LG_FreeLeagueObj(nLeagueID);
			if (ret == 1) then
				return onetong_applyaddmem(ONETONG_ACC_LGTYPE, szmemacc, szmemname);
			else
				return 0;
			end;
		end;
		return onetong_applyaddmem(ONETONG_ACC_LGTYPE, szmemacc, szmemname);
	else
		return 0;
	end;
end;

function onetong_applyaddmem(nlgtype, szlgname, szmemname)
	local n_lid = LG_GetLeagueObjByRole(nlgtype, szmemname);
	if (FALSE(n_lid)) then
		local nMemberID = LGM_CreateMemberObj();
		LGM_SetMemberInfo(nMemberID, szmemname, 0, nlgtype, szlgname) 
		local ret = LGM_ApplyAddMember(nMemberID, "", "");
		LGM_FreeMemberObj(nMemberID);
		return ret;
	end;
	return 1;
end;


function onetong_awardtitle()
	local szTongName, nTongID = GetTong();
	local n_title = %N_TTITLE_ID;
	local n_titletype = Title_GetTitleInfo(n_title);
	
	if((nTongID == 0 or nTongID == -1) or szTongName ~= %SZTONGNAME_ONETONG or n_titletype == 1 or GetJoinTongTime() < 10080) then
		CreateTaskSay({"<dec><npc>".."C竎 h� kh玭g ph� h頿 甶襲 ki謓 l躰h thng", "K誸 th骳 i tho筰/OnCancel"});
		return
	end
	
	--Remove h祇 quang VLMC n誹 c� trc khi add h祇 quang m韎 - Modified by DinhHQ - 20110524
	if Title_GetActiveTitle() == 3000 then
		Title_RemoveTitle(3000)		
	end
	if GetSkillState(1500) ~= -1 then
		RemoveSkillState(1500)
	end
	
	SetTask(TASK_ACTIVE_TITLE, n_title);
	Title_AddTitle(n_title, 1, 90 * 24 * 60 * 60 * 18);
	Title_ActiveTitle(n_title);
	
	local sz_title = Title_GetTitleName(n_title);
	
	CreateTaskSay({"<dec><npc>".."Ch骳 m鮪g, t筰 h� r蕋 ng 頲 ta k輓h ph鬰.", "K誸 th骳 i tho筰/OnCancel"});
	
	Msg2Player(format("Ch骳 m鮪g b筺  nh薾 頲 danh hi謚 <color=yellow>%s<color>", sz_title));
end
