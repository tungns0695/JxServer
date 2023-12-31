Include("\\script\\mission\\boss\\bigboss.lua")

function TaskShedule()
	-- 设置方案名称
	TaskName( "MAKE BIG BOSS 9:15" );
	TaskInterval( 1440 );
	TaskTime( 9, 15 );
	TaskCountLimit( 0 );
	-- 输出启动消息
	OutputMsg( "MAKE BIG BOSS AT :  9:15" );
	OutputMsg( format("GOLD BOSS COUNT :  %d", BigBoss.gold_boss_count) );
end

function TaskContent()
	if (GetProductRegion() ~= "vn") then
		return 0;
	end;
	
	BigBoss.isBigBossDead = 0;
	OutputMsg( format("GOLD BOSS COUNT :  %d", BigBoss.gold_boss_count) );
	if (BigBoss.gold_boss_count == 0) then
		local bossname = "чc C� Thi猲 Phong";
		local series = random(0, 4);
		local bossid = BigBoss.BIG_BOSS_SER[series];
		local bosslvl = 95;
	
		local nPosIdx = random(1,getn(BigBoss.BIG_BOSS_POS));
		local nPosIdx2 = random(1,getn(BigBoss.BIG_BOSS_POS[nPosIdx][2]));
		local worldname = BigBoss.BIG_BOSS_POS[nPosIdx][3];
		local world = BigBoss.BIG_BOSS_POS[nPosIdx][1];
		local posx = BigBoss.BIG_BOSS_POS[nPosIdx][2][nPosIdx2][1];
		local posy = BigBoss.BIG_BOSS_POS[nPosIdx][2][nPosIdx2][2];
		local str = format("Giang h� truy襫 r籲g tuy謙 th� cao th� <color=yellow>%s<color>   xu蕋 hi謓 � <color=yellow>%s<color> ! Giang h� 総 s� c� m閠 tr薾 m m竨!", bossname, worldname);
		GlobalExecute(format("dwf \\script\\missions\\boss\\call_big_boss.lua BigBoss:Make_Big_Boss(%d, %d, %d, %d, %d, %d, [[%s]], [[%s]] )",bossid, bosslvl, series, world, posx, posy, bossname, str ));
		OutputMsg("Create Boss "..bossname..","..bossid..","..bosslvl..","..world..","..posx..","..posy..","..series..date("----%Y%m%d%H%M"))
                                   local toadox = floor(posx/8);
                                   local toadoy = floor(posy/16);
                                   local szNews = format("<color=yellow>" ..bossname.. "<color>  xu蕋 hi謓 t筰 <color=green>"..worldname.."<color> "..toadox.."/"..toadoy.."")
	                  LG_ApplyDoScript(1, "", "", "\\script\\event\\msg2allworld.lua", "battle_msg2allworld", szNews , "", "");
	else
		
	end
end

function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end