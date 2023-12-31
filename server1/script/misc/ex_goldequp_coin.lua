-- ====================== 文件信息 ======================

-- 剑侠情缘网络版越南版 - 黄金装备牌子兑换黄金装备
-- 文件名　：ex_goldequp_coin.lua
-- 创建者　：子非魚
-- 创建时间：2009-05-21 13:59:02

-- ======================================================

Include("\\script\\lib\\composelistclass.lua")
IncludeLib("LEAGUE")

local tbGoldEquip_Coin = {
	[1] = {
		nFreeItemCellLimit = 12,
		tbMaterial = {{szName = "K� Nghi謕 Kim B礽", tbProp = {6,1,2075,1,0,0}, nCount = 100}},
		tbProduct = {szName = "K� Nghi謕 Huy襫 V� Ho祅g Kim Kh秈", nQuality = 1, tbProp = {0,22}},
	},
	[2] = {
		nFreeItemCellLimit = 12,
		tbMaterial = {{szName = "M閚g Long Kim B礽", tbProp = {6,1,2076,1,0,0}, nCount = 100}},
		tbProduct = {szName = "M閚g Long Huy襫 Ti Ph竧 i", nQuality = 1, tbProp = {0,3}},
	},
	[3] = {
		nFreeItemCellLimit = 12,
		tbMaterial = {{szName = "Minh 秓 Kim B礽", tbProp = {6,1,2077,1,0,0}, nCount = 100}},
		tbProduct = {szName = "Minh 秓 U чc 竚 Y", nQuality = 1, tbProp = {0,62}},
	},
	[4] = {
		nFreeItemCellLimit = 12,
		tbMaterial = {{szName = "мa Ph竎h Kim B礽", tbProp = {6,1,2078,1,0,0}, nCount = 100}},
		tbProduct = {szName = "мa Ph竎h Ng� h祅h Li猲 Ho祅 Qu竛", nQuality = 1, tbProp = {0,86}},
	},
	[5] = {
		nFreeItemCellLimit = 12,
		tbMaterial = {{szName = "V� Tr莕 Kim B礽", tbProp = {6,1,2079,1,0,0}, nCount = 100}},
		tbProduct = {szName = "V� Tr莕 Ng鋍 N� T� T﹎ qu竛", nQuality = 1, tbProp = {0,41}},
	},
	[6] = {
		nFreeItemCellLimit = 12,
		tbMaterial = {{szName = "B輈h H秈 Kim B礽", tbProp = {6,1,2080,1,0,0}, nCount = 100}},
		tbProduct = {szName = "B輈h H秈 H錸g Linh Kim Ti i", nQuality = 1, tbProp = {0,53}},
	},
	[7] = {
		nFreeItemCellLimit = 12,
		tbMaterial = {{szName = "V� 秓 Kim B礽", tbProp = {6,1,2081,1,0,0}, nCount = 100}},
		tbProduct = {szName = "V� 秓 Tung Phong Tuy誸 秐h ngoa", nQuality = 1, tbProp = {0,140}},
	},
	[8] = {
		nFreeItemCellLimit = 12,
		tbMaterial = {{szName = "Ma Th� Kim B礽", tbProp = {6,1,2082,1,0,0}, nCount = 100}},
		tbProduct = {szName = "Ma Th� Huy誸 Ng鋍 Th蕋 S竧 B閕", nQuality = 1, tbProp = {0,114}},
	},
	[9] = {
		nFreeItemCellLimit = 12,
		tbMaterial = {{szName = "T╪g m穙 kim b礽", tbProp = {6,1,2203,1,0,0}, nCount = 100}},
		tbProduct =
		{
			szName = "M閚g Long Ch輓h H錸g T╪g M穙",
			[1]	= {szName = "M閚g Long Ch輓h H錸g T╪g M穙", nQuality = 1, tbProp = {0,1}},
			[2] = 
			{
				pFun = function (self, nCount, szLogTilte)
					szAllNews = format("Ch骳 m鮪g cao th� %s  nh薾 頲 <color=yellow>M閚g Long Ch輓h H錸g T╪g M穙<color>", GetName());
					AddGlobalNews(szAllNews);
					LG_ApplyDoScript(1, "", "", "\\script\\event\\msg2allworld.lua", "battle_msg2allworld", szAllNews , "", "")
				end
			}
		},
			
	},
	[10] = {
		nFreeItemCellLimit = 12,
		tbMaterial = {{szName = "U lung kim b礽", tbProp = {6,1,2204,1,0,0}, nCount = 100}},
		tbProduct =
		{
			szName = "U Lung X輈h Y誸 M藅 trang",
			[1]	= {szName = "U Lung X輈h Y誸 M藅 trang", nQuality = 1, tbProp = {0,57}},
			[2] = 
			{
				pFun = function (self, nCount, szLogTilte)
					szAllNews = format("Ch骳 m鮪g cao th� %s  nh薾 頲 <color=yellow>U Lung X輈h Y誸 M藅 Trang<color>", GetName());
					AddGlobalNews(szAllNews);
					LG_ApplyDoScript(1, "", "", "\\script\\event\\msg2allworld.lua", "battle_msg2allworld", szAllNews , "", "")
				end
			},
		},
	},
	[11] = {
		nFreeItemCellLimit = 12,
		tbMaterial = {{szName = "Ma s竧 kim b礽", tbProp = {6,1,2205,1,0,0}, nCount = 100}},
		tbProduct =
		{
			szName = "Ma S竧 C� H醓 Li猽 Thi猲 Ho祅",
			[1]	= {szName = "Ma S竧 C� H醓 Li猽 Thi猲 Ho祅", nQuality = 1, tbProp = {0,104}},
			[2] = 
			{
				pFun = function (self, nCount, szLogTilte)
					szAllNews = format("Ch骳 m鮪g cao th� %s  nh薾 頲 <color=yellow>Ma S竧 C� H醓 Li猽 Thi猲 Uy觧<color>", GetName());
					AddGlobalNews(szAllNews);
					LG_ApplyDoScript(1, "", "", "\\script\\event\\msg2allworld.lua", "battle_msg2allworld", szAllNews , "", "")
				end
			},
		}
	},
	[12] = {
		nFreeItemCellLimit = 12,
		tbMaterial = {{szName = "мch kh竔 kim b礽", tbProp = {6,1,2206,1,0,0}, nCount = 100}},
		tbProduct =
		{
			szName = "мch Kh竔 Tri襫 M穘g y猽 i",
			[1]	= {szName = "мch Kh竔 Tri襫 M穘g y猽 i", nQuality = 1, tbProp = {0,98}},
			[2] = 
			{
				pFun = function (self, nCount, szLogTilte)
					szAllNews = format("Ch骳 m鮪g cao th� %s  nh薾 頲 <color=yellow>мch  Kh竔 Tri襫 M穘g Y猽 Цi<color>", GetName());
					AddGlobalNews(szAllNews);
					LG_ApplyDoScript(1, "", "", "\\script\\event\\msg2allworld.lua", "battle_msg2allworld", szAllNews , "", "")
				end
			}
		},
	},

}

local tbGoldEquip_Coin_2 = {
		[1] = {
		nFreeItemCellLimit = 12,
		tbMaterial = {{szName = "H竚 Thi猲 Kim B礽", tbProp = {6,1,2237,1,0,0}, nCount = 100}},
		tbProduct =
		{
			szName = "H竚 Thi猲 H� u Kh萵 Th骳 Uy觧",
			[1]	= {szName = "H竚 Thi猲 H� u Kh萵 Th骳 Uy觧", nQuality = 1, tbProp = {0,19}},
			[2] = 
			{
				pFun = function (self, nCount, szLogTilte)
					szAllNews = format("Ch骳 m鮪g cao th� %s  nh薾 頲 <color=yellow>H竚 Thi猲 H� u Kh萵 Th骳 Uy觧<color>", GetName());
					AddGlobalNews(szAllNews);
					LG_ApplyDoScript(1, "", "", "\\script\\event\\msg2allworld.lua", "battle_msg2allworld", szAllNews , "", "")
				end
			}
		},
	},
	[2] = {
		nFreeItemCellLimit = 12,
		tbMaterial = {{szName = "Thi猲 Quang Kim B礽", tbProp = {6,1,2238,1,0,0}, nCount = 100}},
		tbProduct =
		{
			szName = "Thi猲 Quang Th骳 Thi猲 Phc мa Ho祅",
			[1]	= {szName = "Thi猲 Quang Th骳 Thi猲 Phc мa Ho祅", nQuality = 1, tbProp = {0,80}},
			[2] = 
			{
				pFun = function (self, nCount, szLogTilte)
					szAllNews = format("Ch骳 m鮪g cao th� %s  nh薾 頲 <color=yellow>Thi猲 Quang Th骳 Thi猲 Phc мa Ho祅<color>", GetName());
					AddGlobalNews(szAllNews);
					LG_ApplyDoScript(1, "", "", "\\script\\event\\msg2allworld.lua", "battle_msg2allworld", szAllNews , "", "")
				end
			}
		},
	},
	[3] = {
		nFreeItemCellLimit = 12,
		tbMaterial = {{szName = "B輈h H秈 Kim B礽", tbProp = {6,1,2239,1,0,0}, nCount = 100}},
		tbProduct =
		{
			szName = "B輈h H秈 H錸g L╪g Ba",
			[1]	= {szName = "B輈h H秈 H錸g L╪g Ba", nQuality = 1, tbProp = {0,54}},
			[2] = 
			{
				pFun = function (self, nCount, szLogTilte)
					szAllNews = format("Ch骳 m鮪g cao th� %s  nh薾 頲 <color=yellow>B輈h H秈 H錸g L╪g Ba<color>", GetName());
					AddGlobalNews(szAllNews);
					LG_ApplyDoScript(1, "", "", "\\script\\event\\msg2allworld.lua", "battle_msg2allworld", szAllNews , "", "")
				end
			}
		},
	},
	[4] = {
		nFreeItemCellLimit = 12,
		tbMaterial = {{szName = "V� Ma Kim B礽", tbProp = {6,1,2240,1,0,0}, nCount = 100}},
		tbProduct =
		{
			szName = "V� Ma B╪g Tinh Ch� Ho祅",
			[1]	= {szName = "V� Ma B╪g Tinh Ch� Ho祅", nQuality = 1, tbProp = {0,38}},
			[2] = 
			{
				pFun = function (self, nCount, szLogTilte)
					szAllNews = format("Ch骳 m鮪g cao th� %s  nh薾 頲 <color=yellow>V� Ma B╪g Tinh Ch� Ho祅<color>", GetName());
					AddGlobalNews(szAllNews);
					LG_ApplyDoScript(1, "", "", "\\script\\event\\msg2allworld.lua", "battle_msg2allworld", szAllNews , "", "")
				end
			}
		},
	},
	[5] = {
		nFreeItemCellLimit = 12,
		tbMaterial = {{szName = "L╪g Nh筩 Kim B礽", tbProp = {6,1,2241,1,0,0}, nCount = 100}},
		tbProduct =
		{
			szName = "L╪g Nh筩 Thi猲 мa Huy襫 Ho祅g gi韎",
			[1]	= {szName = "L╪g Nh筩 Thi猲 мa Huy襫 Ho祅g gi韎", nQuality = 1, tbProp = {0,120}},
			[2] = 
			{
				pFun = function (self, nCount, szLogTilte)
					szAllNews = format("Ch骳 m鮪g cao th� %s  nh薾 頲 <color=yellow>L╪g Nh筩 Thi猲 мa Huy襫 Ho祅g Gi韎<color>", GetName());
					AddGlobalNews(szAllNews);
					LG_ApplyDoScript(1, "", "", "\\script\\event\\msg2allworld.lua", "battle_msg2allworld", szAllNews , "", "")
				end
			}
		},
	},
	[6] = {
		nFreeItemCellLimit = 12,
		tbMaterial = {{szName = "Sng Tinh Kim B礽", tbProp = {6,1,2242,1,0,0}, nCount = 100}},
		tbProduct =
		{
			szName = "Sng Tinh Phong B筼 ch� ho祅",
			[1]	= {szName = "Sng Tinh Phong B筼 ch� ho祅", nQuality = 1, tbProp = {0,130}},
			[2] = 
			{
				pFun = function (self, nCount, szLogTilte)
					szAllNews = format("Ch骳 m鮪g cao th� %s  nh薾 頲 <color=yellow>Sng Tinh Phong B筼 Ch� Ho祅<color>", GetName());
					AddGlobalNews(szAllNews);
					LG_ApplyDoScript(1, "", "", "\\script\\event\\msg2allworld.lua", "battle_msg2allworld", szAllNews , "", "")
				end
			}
		},
	},
}
function ex_goldequp_coin()
	if not tbComposeGoldEquipCoin then
		tbComposeGoldEquipCoin = tbComposeListClass:new("tbComposeGoldEquipCoin", %tbGoldEquip_Coin);
	end
	
	local szTitle = "<dec><npc>".."C竎 h� mu鑞 i lo筰 l謓h b礽 n祇?";
		
	local tbSay = tbComposeGoldEquipCoin:MakeOptByProductName("фi");
	tinsert(tbSay, 1, szTitle);
	tinsert(tbSay, "K誸 th骳 i tho筰/OnCancel");
	
	CreateTaskSay(tbSay)
end

function ex_goldequp_coin_2()
	if not tbComposeGoldEquipCoin_b then
		tbComposeGoldEquipCoin_b = tbComposeListClass:new("tbComposeGoldEquipCoin_b", %tbGoldEquip_Coin_2);
	end
	
	local szTitle = "<dec><npc>".."C竎 h� mu鑞 i lo筰 l謓h b礽 n祇?";
		
	local tbSay = tbComposeGoldEquipCoin_b:MakeOptByProductName("фi");
	tinsert(tbSay, 1, szTitle);
	tinsert(tbSay, "K誸 th骳 i tho筰/OnCancel");
	
	CreateTaskSay(tbSay)
end

