Include("\\script\\activitysys\\config\\1021\\variables.lua")
Include("\\script\\activitysys\\config\\1021\\awardlist.lua")
Include("\\script\\activitysys\\config\\1021\\extend.lua")
Include("\\script\\vng_lib\\bittask_lib.lua")
tbConfig = {}
tbConfig[1] = --一个细节
{
	nId = 1,
	szMessageType = "ServerStart",
	szName = "server start",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"ThisActivity:Init",	{nil} },
	},
}
tbConfig[2] = --一个细节
{
	nId = 2,
	szMessageType = "ClickNpc",
	szName = "click shijianzongguan",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"T鎛g Qu秐 S� Ki謓"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"H頿 th祅h ph莕 thng",3} },		
		{"AddDialogOpt",	{"Nh薾 thng t m鑓 s� d鬾g",23} },
		{"SetDialogTitle",	{"<npc>Tng truy襫 nghe giang h� n r籲g, c� th� 甶襲 ch� 產n dc   th玭g K� Kinh B竧 M筩h, ngi th祅h c玭g s� c� hi謚 qu� b蕋 ng�.\n<color=green>C竎 h� c� th� mang 5 lo筰 nguy猲 li謚 sau  n y cho ta, ta s� t苙g thng cho c竎 h� ph莕 thng qu� b竨.<color>\n<color=yellow>Л琻g Quy: <color> Цnh 畊鎖 cng o  nh薾 頲.\n<color=yellow>X� Hng: <color> Mua t筰 h祅g Rong.\n<color=yellow>Tr莕 B�: <color>Tham gia m閠 s� t輓h n╪g s� nh薾 頲.\n<color=yellow>Li T﹎ Th秓 :<color>Thu th藀 t筰 c竎 Th玭 trang.\n<color=yellow>Dc Vng жnh: <color>Mua trong K� Tr﹏ C竎."} },
	},
}
tbConfig[3] = --一个细节
{
	nId = 3,
	szMessageType = "CreateDialog",
	szName = "compose dialog",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Xin Ch祇! C竎 h� mu鑞 i Ph莕 thng n祇?",0},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
	},
	tbActition = 
	{
		{"AddDialogOpt",	{ITEM_AWARD1.szName,4} },
		{"AddDialogOpt",	{ITEM_AWARD2.szName,5} },
		{"AddDialogOpt",	{ITEM_AWARD3.szName,6} },
	},
}
tbConfig[4] = --一个细节
{
	nId = 4,
	szMessageType = "CreateCompose",
	szName = "compose award1",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {ITEM_AWARD1.szName,1,1,1,0.02,0,250},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"AddOneMaterial",	{ITEM_MATERIAL_1.szName,ITEM_MATERIAL_1,1} },
		{"AddOneMaterial",	{ITEM_MATERIAL_2.szName,ITEM_MATERIAL_2,1} },
		{"AddOneMaterial",	{ITEM_MATERIAL_3.szName,ITEM_MATERIAL_3,1} },
		{"AddOneMaterial",	{ITEM_MATERIAL_4.szName,ITEM_MATERIAL_4,1} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_AWARD1,1,EVENT_LOG_TITLE,"DoiHoKeDon"} },
	},
}
tbConfig[5] = --一个细节
{
	nId = 5,
	szMessageType = "CreateCompose",
	szName = "compose award2",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {ITEM_AWARD2.szName,1,1,1,0.02,0,250},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"AddOneMaterial",	{ITEM_MATERIAL_1.szName,ITEM_MATERIAL_1,1} },
		-- {"AddOneMaterial",	{ITEM_MATERIAL_2.szName,ITEM_MATERIAL_2,2} },
		-- {"AddOneMaterial",	{ITEM_MATERIAL_3.szName,ITEM_MATERIAL_3,1} },
		{"AddOneMaterial",	{ITEM_MATERIAL_4.szName,ITEM_MATERIAL_4,1} },
		{"AddOneMaterial",	{ITEM_MATERIAL_5.szName,ITEM_MATERIAL_5,1} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_AWARD2,1,EVENT_LOG_TITLE,"DoiSuBiDon"} },
	},
}
tbConfig[6] = --一个细节
{
	nId = 6,
	szMessageType = "CreateCompose",
	szName = "compose award3",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {ITEM_AWARD3.szName,1,1,1,0.02,0,250},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"AddOneMaterial",	{ITEM_MATERIAL_1.szName,ITEM_MATERIAL_1,1} },
		-- {"AddOneMaterial",	{ITEM_MATERIAL_2.szName,ITEM_MATERIAL_2,2} },
		-- {"AddOneMaterial",	{ITEM_MATERIAL_3.szName,ITEM_MATERIAL_3,1} },
		{"AddOneMaterial",	{ITEM_MATERIAL_4.szName,ITEM_MATERIAL_4,1} },
		{"AddOneMaterial",	{ITEM_MATERIAL_5.szName,ITEM_MATERIAL_5,1} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_AWARD3,1,EVENT_LOG_TITLE,"DoiChanLongDon"} },
	},
}
tbConfig[7] = --一个细节
{
	nId = 7,
	szMessageType = "NpcOnDeath",
	szName = "kill monster at field",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"NpcFunLib:CheckInMap",	{"321,322,340,75,225,226,227"} },
	},
	tbActition = 
	{
		{"NpcFunLib:DropSingleItem",	{ITEM_MATERIAL_1,1,"8"} },
	},
}

tbConfig[8] = --一个细节
{
	nId = 8,
	szMessageType = "FinishSongJin",
	szName = "songjin mark>=1500 and <3000",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {-2,"3"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTask",	{"751",3000,"","<"} },
		{"PlayerFunLib:CheckTask",	{"751",1500,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_MATERIAL_3,10,EVENT_LOG_TITLE,"TongKim1000"} },
	},
}
tbConfig[9] = --一个细节
{
	nId = 9,
	szMessageType = "FinishSongJin",
	szName = "songjin mark>=3000",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {-2,"3"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTask",	{"751",3000,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_MATERIAL_3,15,EVENT_LOG_TITLE,"TongKim3000"} },
	},
}
tbConfig[10] = --一个细节
{
	nId = 10,
	szMessageType = "YDBZguoguan",
	szName = "YanDi",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_MATERIAL_3,2,EVENT_LOG_TITLE,"QuaAiViemDe"} },
	},
}
tbConfig[11] = --一个细节
{
	nId = 11,
	szMessageType = "YDBZguoguan",
	szName = "YanDi 10",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {10},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_MATERIAL_3,6,EVENT_LOG_TITLE,"QuaAi10ViemDe"} },
	},
}
tbConfig[12] = --一个细节
{
	nId = 12,
	szMessageType = "Chuanguan",
	szName = "chuangguan_17",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"17"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_MATERIAL_3,10,EVENT_LOG_TITLE,"VuotAi17"} },
	},
}
tbConfig[13] = --一个细节
{
	nId = 13,
	szMessageType = "Chuanguan",
	szName = "chuangguan_28",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"28"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_MATERIAL_3,10,EVENT_LOG_TITLE,"VuotAi28"} },
	},
}
tbConfig[14] = --一个细节
{
	nId = 14,
	szMessageType = "NpcOnDeath",
	szName = "kill_boat_boss",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"NpcFunLib:CheckBoatBoss",	{nil} },		
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_MATERIAL_3,10,EVENT_LOG_TITLE,"TieuDietThuyTacDauLinh"} },
	},
}
tbConfig[15] = --一个细节
{
	nId = 15,
	szMessageType = "NpcOnDeath",
	szName = "kill_boat_big_boss",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"NpcFunLib:CheckId",	{"1692"} },
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_MATERIAL_3,20,EVENT_LOG_TITLE,"TieuDietThuyTacDaiDauLinh"} },
	},
}
tbConfig[16] = --Kill Boss ST 90
{
	nId = 16,
	szMessageType = "NpcOnDeath",
	szName = "killer boss",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"NpcFunLib:CheckKillerdBoss",	{90} },
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_MATERIAL_3,6,EVENT_LOG_TITLE,"HoanThanhBossST90"} },
	},
}
tbConfig[17] = --Kill World Boss 
{
	nId = 17,
	szMessageType = "NpcOnDeath",
	szName = "Ti猽 di謙 boss Ho祅g Kim",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"NpcFunLib:CheckWorldBoss",	{nil} },	
		{"PlayerFunLib:CheckFreeBagCell",	{1,"nomsg"} },	
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_MATERIAL_3,25,EVENT_LOG_TITLE,"KillBossHKNhanNguyenLieu"} },
	},
}
--Hang Rong
tbConfig[18] = --一个细节
{
	nId = 18,
	szMessageType = "ClickNpc",
	szName = "click lingfan",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"H祅g rong"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"AddDialogOpt",	{format("Mua %s",ITEM_MATERIAL_2.szName),19} },
	},
}
tbConfig[19] = --一个细节
{
	nId = 19,
	szMessageType = "CreateCompose",
	szName = "buy material2",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {ITEM_MATERIAL_2.szName,1,1,1,0.02,0,250},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"AddOneMaterial",	{MONEY.szName,MONEY,20000} }, --Old Server price 2 van
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_MATERIAL_2,1,EVENT_LOG_TITLE,"MuaXaHuongTaiHangRong"} },
	},
}
--Use Item
tbConfig[20] = --一个细节
{
	nId = 20,
	szMessageType = "ItemScript",
	szName = "use award1",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {ITEM_AWARD1},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"PlayerFunLib:CheckCashLimit",	{1900000000,"default"} },		
		{"tbVNG_BitTask_Lib:CheckBitTaskValue", {tbBITTSK_LIMIT_1, MAX_USE_AWARD1, MSG_LIMITED_USE, "<"}},		
	},
	tbActition = 
	{
		{"tbVNG_BitTask_Lib:addTask", {tbBITTSK_LIMIT_1, 1}},
		{"PlayerFunLib:AddExp",	{2e6,0,EVENT_LOG_TITLE,"SuDungHoKeDon"} },
		{"ThisActivity:WriteLogPoint",	{tbBITTSK_LIMIT_1,ITEM_AWARD1.szName} },
	},
}
tbConfig[21] = --一个细节
{
	nId = 21,
	szMessageType = "ItemScript",
	szName = "use award2",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {ITEM_AWARD2},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"PlayerFunLib:CheckCashLimit",	{1900000000,"default"} },
		{"tbVNG_BitTask_Lib:CheckBitTaskValue", {tbBITTSK_LIMIT_2, MAX_USE_AWARD2_3, MSG_LIMITED_USE, "<"}},
		{"PlayerFunLib:CheckFreeBagCellWH",	{2,4,1,"default"} },
	},
	tbActition = 
	{
		{"tbVNG_BitTask_Lib:addTask", {tbBITTSK_LIMIT_2_COUNT, 1}},
		{"ThisActivity:UseAward2",	{nil} },
		{"ThisActivity:WriteLogPoint",	{tbBITTSK_LIMIT_2_COUNT,ITEM_AWARD2.szName} },
	},
}
tbConfig[22] = --一个细节
{
	nId = 22,
	szMessageType = "ItemScript",
	szName = "use award3",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {ITEM_AWARD3},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },		
		{"tbVNG_BitTask_Lib:CheckBitTaskValue", {tbBITTSK_LIMIT_3, MAX_USE_AWARD2_3, MSG_LIMITED_USE, "<"}},		
	},
	tbActition = 
	{	
		{"tbVNG_BitTask_Lib:addTask", {tbBITTSK_LIMIT_3_COUNT, 1}},		
		{"ThisActivity:UseAwardGetExp",	{tbUseAward3_Exp, tbBITTSK_LIMIT_3, ITEM_AWARD3.szName} },
		{"ThisActivity:WriteLogPoint",	{tbBITTSK_LIMIT_3_COUNT,ITEM_AWARD3.szName} },
	},
}tbConfig[23] = --一个细节
{
	nId = 23,
	szMessageType = "CreateDialog",
	szName = "compose dialog",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>S� d鬾g <color=yellow>S� B� Кn<color>  t t鎛g s� 500, 1000, 2000 s� nh薾 頲 ph莕 thng c bi謙, Hi謓 t筰 c竎 h�  s� d鬾g 頲: <color=yellow><lua GetBitTask(3015, 17, 12) /><color> c竔"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"Nh薾 thng m鑓 500",24} },
		{"AddDialogOpt",	{"Nh薾 thng m鑓 1000",25} },
		{"AddDialogOpt",	{"Nh薾 thng m鑓 2000",26} },
	},
}
tbConfig[24] = 
{
	nId = 24,
	szMessageType = "nil",
	szName = "Thng t m鑓 500 ",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{			
		{"tbVNG_BitTask_Lib:CheckBitTaskValue",	{tbBITTSK_LIMIT_2_COUNT,500,"Y猽 c莡 s� d鬾g t鎛g <color=yellow>S� B� Кn<color>:<color=red> 500<color> l莕 tr� l猲 m韎 nh薾 頲 ph莕 thng n祔.",">="} },
		{"tbVNG_BitTask_Lib:CheckBitTaskValue",	{tbTSK_INFO_1,0,"Ngi  nh薾 ph莕 thng n祔 r錳","=="} },
		{"PlayerFunLib:CheckFreeBagCellWH",	{2,4,1,"default"} },
	},
	tbActition = 
	{		
		{"tbVNG_BitTask_Lib:setBitTask",	{tbTSK_INFO_1,1} },
		{"PlayerFunLib:GetItem",	{tbAward_Limit_Old["500"],1,EVENT_LOG_TITLE,"NhanThuongSuDung500Lan"} },
	},
}
tbConfig[25] = 
{
	nId = 25,
	szMessageType = "nil",
	szName = "Thng t m鑓 1000 ",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{			
		{"tbVNG_BitTask_Lib:CheckBitTaskValue",	{tbBITTSK_LIMIT_2_COUNT,1000,"Y猽 c莡 s� d鬾g t鎛g <color=yellow>S� B� Кn <color>:<color=red>1000<color> l莕 tr� l猲 m韎 nh薾 頲 ph莕 thng n祔.",">="} },
		{"tbVNG_BitTask_Lib:CheckBitTaskValue",	{tbTSK_INFO_2,0,"Ngi  nh薾 ph莕 thng n祔 r錳","=="} },
		{"PlayerFunLib:CheckFreeBagCellWH",	{2,4,1,"default"} },
	},
	tbActition = 
	{		
		{"tbVNG_BitTask_Lib:setBitTask",	{tbTSK_INFO_2,1} },
		{"PlayerFunLib:GetItem",	{tbAward_Limit_Old["1000"],1,EVENT_LOG_TITLE,"NhanThuongSuDung1000Lan"} },
	},
}
tbConfig[26] = 
{
	nId = 26,
	szMessageType = "nil",
	szName = "Thng t m鑓 2000 ",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{			
		{"tbVNG_BitTask_Lib:CheckBitTaskValue",	{tbBITTSK_LIMIT_2_COUNT,2000,"Y猽 c莡 s� d鬾g t鎛g <color=yellow>S� B� Кn<color>:<color=red>2000<color> l莕 tr� l猲 m韎 nh薾 頲 ph莕 thng n祔.",">="} },
		{"tbVNG_BitTask_Lib:CheckBitTaskValue",	{tbTSK_INFO_3,0,"Ngi  nh薾 ph莕 thng n祔 r錳","=="} },
		{"PlayerFunLib:CheckFreeBagCellWH",	{2,4,1,"default"} },
	},
	tbActition = 
	{		
		{"tbVNG_BitTask_Lib:setBitTask",	{tbTSK_INFO_3,1} },
		{"PlayerFunLib:GetItem",	{tbAward_Limit_Old["2000"],1,EVENT_LOG_TITLE,"NhanThuongSuDung2000Lan"} },
	},
}