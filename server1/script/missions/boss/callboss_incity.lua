Include("\\script\\lib\\basic.lua");
Include("\\script\\lib\\file.lua")
Include("\\script\\config.lua")
IncludeLib("LEAGUE")
QY_GOLDBOSS_DPOS_INFO = {
					[739]	= {"V­¬ng T¸ ",		1716,3131, 	95,	78,	0,	"\\settings\\maps\\¶«±±Çø\\Ä®±±²ÝÔ­\\wangzuoboss.txt"},
					[740]	= {"HuyÒn Gi¸c §¹i S­ ", 	1601,3019, 	95,	78, 	0, 	"\\settings\\maps\\¶«±±Çø\\³¤°×É½Â´\\xuanjuedashiboss.txt"},
					[741]	= {"§­êng BÊt NhiÔm", 	1515,2927, 	95, 78, 	1, 	"\\settings\\maps\\ÖÐÔ­±±Çø\\·çÁê¶ÉÄÏ°¶\\herenwoboss.txt"},
					[742]	= {"B¹ch Doanh Doanh", 	1450,2982, 	95, 78,	1, 	"\\settings\\maps\\ÖÐÔ­±±Çø\\·çÁê¶É±±°¶\\baiyingyingboss.txt"},
					[743]	= {"Thanh TuyÖt S­ Th¸i", 	1425,3103, 	95, 78, 	2, 	"\\settings\\maps\\¶«±±Çø\\Ä®±±²ÝÔ­\\qingxiaoshitaiboss.txt"},
					[744]	= {"Yªn HiÓu Tr¸i", 	1325,3129, 	95, 78, 	2, 	"\\settings\\maps\\ÖÐÔ­±±Çø\\·çÁê¶É±±°¶\\yanxiaoqianboss.txt"},
					[745]	= {"Hµ Nh©n Ng· ", 	1346,3252, 	95, 78, 	3, 	"\\settings\\maps\\¶«±±Çø\\³¤°×É½Â´\\xuanjiziboss.txt"},
					[746]	= {"§¬n T­ Nam", 	1308,3355, 	95, 78, 	4, 	"\\settings\\maps\\¶«±±Çø\\Ä®±±²ÝÔ­\\shansinanboss.txt"},
					[747]	= {"TuyÒn C¬ Tö ", 	1319,3457, 	95, 78, 	4, 	"\\settings\\maps\\Î÷±±±±Çø\\Äª¸ß¿ß\\tangburanboss.txt"},
					[748]	= {"Hµn M«ng", 		1479,3454, 	95, 78, 	1, 	"\\settings\\maps\\½­ÄÏÇø\\Î÷É½Óì\\hanmengboss.txt"},
					[565]	= {"§oan Méc DuÖ ",	1526,3508, 	95, 78, 	3,	"\\settings\\maps\\Î÷±±±±Çø\\É³Ä®ÃÔ¹¬\\duanmuruiboss.txt"},
					[582]	= {"Lam Y Y", 	1654,3541, 	95, 78, 	1,	"\\settings\\maps\\½­ÄÏÇø\\Á½Ë®¶´ÃÔ¹¬\\lanyiyiboss.txt"},
					[567]	= {"Chung Linh Tó ", 	1669,3440, 	95, 78, 	2,	"\\settings\\maps\\½­ÄÏÇø\\Á½Ë®¶´ÃÔ¹¬\\zhonglingxiuboss.txt"},
					[583]	= {"M¹nh Th­¬ng L­¬ng", 	1695,3358, 	95, 78, 	3,	"\\settings\\maps\\¶«±±Çø\\Ä®±±²ÝÔ­\\wangzuoboss.txt"},
					[1365]	= {"HuyÒn Nan §¹i S­", 	1744,3296, 	95, 78, 	0, 	"\\settings\\maps\\½­ÄÏÇø\\Î÷É½Óì\\big_goldboss.txt"},
					[1368]	= {"Thanh Liªn Tö", 	1822,3286, 	95, 78, 	4,	"\\settings\\maps\\Î÷±±±±Çø\\É³Ä®ÃÔ¹¬\\qinglianziboss.txt"},
					[1366]	= {"§­êng Phi YÕn", 	1814,3203, 	95, 78, 	1, 	"\\settings\\maps\\½­ÄÏÇø\\Î÷É½Óì\\big_goldboss.txt"},
					[1367]	= {"Tõ §¹i Nh¹c", 	1771,3170,	95, 78,	4, 	"\\settings\\maps\\½­ÄÏÇø\\Î÷É½Óì\\big_goldboss.txt"},
}
---------------------------------------------------------------------------------------------
function QY_MakeBoss_RandInCity(bossid, bosslvl, series, mapid, posx, posy, bossname, str)
	local mapidx = SubWorldID2Idx(mapid)
	if (mapidx < 0) then
		return
	end
	local npcindex = AddNpcEx(bossid, bosslvl, series, mapidx, posx*32, posy*32, 1, bossname, 1)
	if (npcindex > 0) then
		SetNpcDeathScript(npcindex, "\\script\\missions\\boss\\bossdeath.lua");
		WriteLog(date("%H:%M")..","..bossid..","..bosslvl..","..series..","..SubWorldIdx2ID(mapidx)..","..posx..","..posy..","..bossname)
		AddGlobalNews(str)

		local nHour = tonumber(GetLocalDate("%H"));
		if (nHour == 19) then
			-- »Æ½ðBOSS¼ÆÊý
			SetNpcParam(npcindex, 1, 1); -- ÊÇ·ñÊÇ19:30µÄ»Æ½ðBOSS
			RemoteExecute("\\script\\mission\\boss\\bigboss.lua", "AddGoldBossCount", 0);
		end
	end
	
end

function CallBossDown_Outter(bossid, str)
	local mapid = QY_GOLDBOSS_DPOS_INFO[bossid][4]
	mapidx = SubWorldID2Idx(mapid)
	if (mapidx < 0) then
		return
	end
	local bossname = QY_GOLDBOSS_DPOS_INFO[bossid][1]
	local bosslvl = QY_GOLDBOSS_DPOS_INFO[bossid][3]
	local series = QY_GOLDBOSS_DPOS_INFO[bossid][5]
	local filepos = QY_GOLDBOSS_DPOS_INFO[bossid][6]
	posx, posy = getadata(filepos)
	local npcindex = AddNpcEx(bossid, bosslvl, series, mapidx, posx*32, posy*32, 1, bossname, 1)
	SetNpcDeathScript(npcindex, "\\script\\missions\\boss\\bossdeath.lua");
	AddGlobalNews(str)
	WriteLog(date("%H:%M")..","..bossid..","..bosslvl..","..series..","..SubWorldIdx2ID(mapidx)..","..posx..","..posy..","..bossname)
	local nHour = tonumber(date("%H"));
	if (nHour == 19 and npcindex > 0) then
		-- »Æ½ðBOSS¼ÆÊý
		SetNpcParam(npcindex, 1, 1); -- ÊÇ·ñÊÇ19:30µÄ»Æ½ðBOSS
		RemoteExecute("\\script\\mission\\boss\\bigboss.lua", "AddGoldBossCount", 0);
	end
end

QY_NEWBOSS_FIXURE_INFO = {
	[1] = {
					---Name					ID,LEVEL,SERVERS,MAPID,X,Y,	NORMALX,NORMALY,SZMSG
					{"ÂÒÊÀÓ¢ºÀ¤²",	1194,95,0,	1745,3437*174,	1613,3025*174,"Cao thñ ThiÕu L©m - Lo¹n ThÕ Anh Hµo - xuÊt hiÖn t¹i Long TuyÒn Th«n!"},
					{"×·Ãü¾ÓÊ¿",			1195,95,1,	1482,2987*174,1429,3136*174,"Cao thñ §­êng M«n - Truy MÖnh C­ Sü - xuÊt hiÖn t¹i Long TuyÒn Th«n!"},
					{"ºûµû±´±´",			1198,95,2,	1409,3248*174,1502,3213*174,	"Cao thñ Thóy Yªn -Hå §iÖp Bèi Bèi - xuÊt hiÖn t¹i Long TuyÒn Th«n!"},
					{"Óñº£Â¥¤ÎÎðÍüÎÒ",1199,95,3,	1406,3370*174,	1414,3461*174,"Cao thñ C¸i Bang - Ngäc H¶i Väng Ng· - xuÊt hiÖn t¹i Long TuyÒn Th«n!"},
					{"¹ÅµÀ·ç",				1201,95,4,	 1454,3464*174,	1492,3403*174,"Cao thñ Vâ §ang - Cæ §¹o Phong - xuÊt hiÖn t¹i Long TuyÒn Th«n!"},
									},
	[2] = {
					{"ÈÇ»ðµÄÅ®ÈË",		1202,95,4,	 1577,3424*174,1668,3417*174,	"Cao thñ C«n Lu©n - Nh· Háa N÷ Nh©n - xuÊt hiÖn t¹i Long TuyÒn Th«n!"},
					{"¡áÇåÏã¡©¡ºÌìÈÌ¡»",1200,95,3,  1688,3312*174,1714,3203*174,	"Cao thñ Thiªn NhÉn - Hoa PhÊn Thanh H­¬ng - xuÊt hiÖn t¹i Long TuyÒn Th«n!"},
					{"¶ìÕ½Ñª",				1197,95,2,	  1688,3090*174,	1761,2991*174,"Cao thñ Nga Mi - Nga ChiÕn HuyÕt - xuÊt hiÖn t¹i Long TuyÒn Th«n!"},
					{"ÉñÏÉÒ²²»¹ýÈç´Ë",1196,95,1,	 1791,3117*174,	1771,3221*174,"Cao thñ Ngò §éc - ThÇn Tiªn - xuÊt hiÖn t¹i TiÕn Cóc §éng!"},
					{"%ÌìÍõ%",				1193,95,0,	 1637,3110*174,1646,3025*174,"Cao thñ Thiªn V­¬ng - Thiªn V­¬ng QuÇn Anh - xuÊt hiÖn t¹i Long TuyÒn Th«n!"},
									},

}
QY_NORMALBOSS_INFO	=
{
	[1]	= {n_level = 90, 	n_series = 1,	n_npcid = 523,	tb_coords = {{SubWorldID2Idx(174),1437,3160,"Long TuyÒn Th«n"}},	sz_name = "LiÔu Thanh Thanh"},
	[2]	= {n_level = 90, 	n_series = 2, 	n_npcid = 513,	tb_coords = {{SubWorldID2Idx(174),1492,3256,"Long TuyÒn Th«n"}},	sz_name = "DiÖu Nh­ "},
	[3]	= {n_level = 90, 	n_series = 4, 	n_npcid = 511,	tb_coords = {{SubWorldID2Idx(174),1488,3120,"Long TuyÒn Th«n"}},	sz_name = "Tr­¬ng T«ng ChÝnh"},

};



function CallBossDown_Fixure()
	for i = 1, getn(QY_NORMALBOSS_INFO) do
		local nlvl, nseries, nid, tb_coords, szname	= 	QY_NORMALBOSS_INFO[i].n_level, QY_NORMALBOSS_INFO[i].n_series,
																QY_NORMALBOSS_INFO[i].n_npcid,
																QY_NORMALBOSS_INFO[i].tb_coords, QY_NORMALBOSS_INFO[i].sz_name;
		--local nworldidx = SubWorldID2Idx(nmap);
		 
		--if (nworldidx >= 0) then
			local nIdx		= random(getn(tb_coords));
			local nworldidx, nx, ny, nmaps	= tb_coords[nIdx][1], tb_coords[nIdx][2] * 32, tb_coords[nIdx][3]  * 32, tb_coords[nIdx][4];
			--local nx, ny	= tb_coords[nIdx][1] * 8 * 32, tb_coords[nIdx][2] * 16 * 32;
		if (nworldidx >= 0) then
			local nNpcIndex = AddNpcEx(nid, nlvl, nseries, nworldidx, nx, ny, 1, szname, 1);
			SetNpcScript(nNpcIndex,"\\script\\missions\\boss\\bosstieu.lua")
			SetNpcTimer(nNpcIndex, 60*60*18);
			WriteBossLog(format("%s:%s,%s,%d,%d", "BOSS tiÓu Hoµng Kim", szname, nmaps, nx, ny));
			
			local szNews = format("Boss tiÓu Hoµng Kim:<color=yellow>" ..szname.. "<color> ®· xuÊt hiÖn t¹i <color=green>"..nmaps.."<color>")
	        LG_ApplyDoScript(1, "", "", "\\script\\event\\msg2allworld.lua", "battle_msg2allworld", szNews , "", "");
			
		end
	end
	SubWorld = nOldSubWorld;
end;

function WriteBossLog(szLog)
	WriteLog("[CALLBOSS FIXURE]\t"..GetLocalDate("%Y-%m-%d %H:%M:%S\t")..szLog);
end;

------------ »¹ÊÇ·Ö¸îÏß----------------------------------------------
function getadata(file)
	local totalcount = GetTabFileHeight(file);
	id = random(totalcount);
	x = GetTabFileData(file, id + 1, 1);
	y = GetTabFileData(file, id + 1, 2);
	return x,y
end

function GetIniFileData(mapfile, sect, key)
	if (IniFile_Load(mapfile, mapfile) == 0) then 
		print("Load IniFile Error!"..mapfile)
		return ""
	else
		return IniFile_GetData(mapfile, sect, key)	
	end
end
