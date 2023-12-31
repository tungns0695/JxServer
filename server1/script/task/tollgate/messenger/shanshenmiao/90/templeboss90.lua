-------------------------------------------------------------------------
-- FileName		:	templeboss90.lua
-- Author		:	xiaoyang
-- CreateTime	:	2005-04-18 14:13:14
-- Desc			:   山神庙关卡的标志boss脚本[90以上级]
-------------------------------------------------------------------------
IncludeLib( "FILESYS" );
Include("\\script\\task\\tollgate\\messenger\\shanshenmiao\\enemy_temboss.lua") 
Include("\\script\\task\\newtask\\newtask_head.lua") --调用 nt_getTask 同步变量到客户端的类
Include("\\script\\task\\tollgate\\messenger\\messenger_losetask.lua")  --取消任务
Include("\\script\\task\\tollgate\\messenger\\messenger_timeer.lua")    --调用计时器
Include("\\script\\tagnewplayer\\head.lua");
TabFile_Load( "\\settings\\task\\tollgate\\messenger\\messenger_tollprize.txt" , "tollprize");	 --获得同伴修练的表格

NPC_PARAM_ID = 1;        --用在boss死亡后刷出怪物的特殊事件中，增加npc的时候作为GetNpcParam的第二位，意思是该函数取出的是代表目前死亡bossID的数字   
TEMBOSS_RELIVE=120        --每个标志的重生时间
TEMBOSS_EXP=tonumber( TabFile_GetCell( "tollprize" ,7 ,"boss_exp"))  --小怪经验
TEMBOSS_MAPID=392        --当前玩家所在地图风之骑的地图编号？？是多少？？
TEMBOSS_MESSENGEREXP= tonumber( TabFile_GetCell( "tollprize" ,7 ,"boss_jifen"))  --小怪经验

templeboss3=
{
--刀妖兄弟90级以上
{840,100,392,1520,2625,1,"o Y猽 Huynh е Уm T� ",1,"\\script\\task\\tollgate\\messenger\\shanshenmiao\\90\\templebro90.lua",1},
{840,100,392,1519,2718,1,"o Y猽 Huynh е Tng M玭 Nh﹏",1,"\\script\\task\\tollgate\\messenger\\shanshenmiao\\90\\templebro90.lua",2},
{840,100,392,1465,2795,1,"o Y猽 Huynh е Уm T譶h",1,"\\script\\task\\tollgate\\messenger\\shanshenmiao\\90\\templebro90.lua",3},
{840,100,392,1436,2955,1,"o Y猽 Huynh е Уm Nh� Th藀 Tam",1,"\\script\\task\\tollgate\\messenger\\shanshenmiao\\90\\templebro90.lua",4},
{840,100,392,1379,3056,1,"o Y猽 Huynh е Уm T� Lang",1,"\\script\\task\\tollgate\\messenger\\shanshenmiao\\90\\templebro90.lua",5},
{840,100,392,1412,3091,1,"o Y猽 Huynh е Уm T� N� ",1,"\\script\\task\\tollgate\\messenger\\shanshenmiao\\90\\templebro90.lua",6},
{840,100,392,1499,2996,1,"o Y猽 Huynh е Уm T鑞g",1,"\\script\\task\\tollgate\\messenger\\shanshenmiao\\90\\templebro90.lua",7},
{840,100,392,1530,2836,1,"o Y猽 Huynh е Уm Tu蕁",1,"\\script\\task\\tollgate\\messenger\\shanshenmiao\\90\\templebro90.lua",8},
{840,100,392,1581,2701,1,"o Y猽 Huynh е Уm Th駓",1,"\\script\\task\\tollgate\\messenger\\shanshenmiao\\90\\templebro90.lua",9},
{840,100,392,1360,2979,1,"o Y猽 Huynh е Уm V﹏",1,"\\script\\task\\tollgate\\messenger\\shanshenmiao\\90\\templebro90.lua",10},
{840,100,392,1404,2810,1,"o Y猽 Huynh е Уm Phi",1,"\\script\\task\\tollgate\\messenger\\shanshenmiao\\90\\templebro90.lua",11},
{840,100,392,1404,2688,1,"o Y猽 Huynh е Уm Th� Tr� ",1,"\\script\\task\\tollgate\\messenger\\shanshenmiao\\90\\templebro90.lua",12},
{840,100,392,1463,2706,1,"o Y猽 Huynh е Уm S竔 S竔",1,"\\script\\task\\tollgate\\messenger\\shanshenmiao\\90\\templebro90.lua",13},
{840,100,392,1465,3136,1,"o Y猽 Huynh е Уm S� ",1,"\\script\\task\\tollgate\\messenger\\shanshenmiao\\90\\templebro90.lua",14},
{840,100,392,1558,3151,1,"o Y猽 Huynh е Уm H錳",1,"\\script\\task\\tollgate\\messenger\\shanshenmiao\\90\\templebro90.lua",15},
{840,100,392,1572,3000,1,"o Y猽 Huynh е Уm мa",1,"\\script\\task\\tollgate\\messenger\\shanshenmiao\\90\\templebro90.lua",16},
{840,100,392,1572,2843,1,"o Y猽 Huynh е Уm C� ",1,"\\script\\task\\tollgate\\messenger\\shanshenmiao\\90\\templebro90.lua",17},
{840,100,392,1333,2774,1,"o Y猽 Huynh е Уm u",1,"\\script\\task\\tollgate\\messenger\\shanshenmiao\\90\\templebro90.lua",18},
{840,100,392,1344,2669,1,"o Y猽 Huynh е Уm 觤 觤",1,"\\script\\task\\tollgate\\messenger\\shanshenmiao\\90\\templebro90.lua",19},
{840,100,392,1485,2625,1,"o Y猽 Huynh е Уm T飝",1,"\\script\\task\\tollgate\\messenger\\shanshenmiao\\90\\templebro90.lua",20},

}

function OnDeath(NpcIndex)
	local name = GetName()
	if (GetTask(Task_IsQuest)==2 and GetTask(Task_lag_TskID)==4) then
		if (GetTask(Task_KillNPC) < 5) then
			SetTask(Task_KillNPC, GetTask(Task_KillNPC) + 1)
			Msg2Player(format("Чi hi謕  ti猽 di謙 頲 %d t猲 o Y猽", GetTask(Task_KillNPC)))
		else
		Msg2Player("Чi hi謕  ho祅 th祅h nhi謒 v� ti猽 di謙 o Y猽, H穣 n Chi課 t﹎ T玭 Gi� ho祅 th祅h nhi謒 v�")
		end
	end
	
	if (  messenger_middletime() == 10 ) then --玩家在地图中的时间
		Msg2Player("Xin l鏸! "..name.."! B筺  h誸 th阨 gian th鵦 hi謓 nhi謒 v� T輓 s�! Nhi謒 v� th蕋 b筰!.")
		losemessengertask()
	else
		Msg2Player("B筺 th祅h c玭g h� t猲 o Y猽.")
		messenger_templego(NpcIndex)
	end
end

