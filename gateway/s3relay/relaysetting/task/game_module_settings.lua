-- 定时向一组服务器的所有Gameserver发系统公告
Include("\\script\\gb_modulefuncs.lua")
tab_GameSetting = 
{
"Ho箃 ng xu﹏ 2006",--年兽
"OpenShop",--商城
"Thi謕 th玭g b竜 ch骳 m鮪g m祏",--Msg2SubWorld
"Thi謕 cu閚",--AddLocalNews
"Ph骳 duy猲 ph竜 hoa", 
"Truy襫 c玭g",
"L� v藅 t譶h nh﹏",--AddLocalNews and AddGift
"YANDIBAOZANG",
"YANDIBAOZANG_TALK",
"SWITH_DAIYITOUSHI",
"chunjie2009_dangboss",
}

function TaskShedule()
	TaskName("Thi誸 k� h� th鑞g tr� ch琲 ");
	TaskInterval(1000000);
	TaskCountLimit(0);
	OutputMsg("Kh雐 ng h� th鑞g ng m� c竎 ch鴆 n╪g trong tr� ch琲...");
end

function TaskContent()
	for i = 1, getn(tab_GameSetting) do 
		gb_AutoStartModule(tab_GameSetting[i])
	end
end

function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end
