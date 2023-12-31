-- 随机宝箱物品（随机获得一样物品）
-- By: Wangjingjun(2011-02-17)

Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\vng_event\\change_request_baoruong\\exp_award.lua")
Include("\\script\\lib\\objbuffer_head.lua")
Include("\\script\\task\\metempsychosis\\translife_6.lua")

local  _Message =  function (nItemIndex)
	local handle = OB_Create()
	local msg = format("<color=green>Ch骳 m鮪g cao th� <color=yellow>%s<color=green>  nh薾 頲 <color=yellow><%s><color=green> t� <color=yellow><T鑞g Kim B� B秓><color>" ,GetName(),GetItemName(nItemIndex))
	ObjBuffer:PushObject(handle, msg)
	RemoteExecute("\\script\\event\\msg2allworld.lua", "broadcast", handle)
	OB_Release(handle)
end

tbSJ_Key_Require = {
	["chiakhoanhuy"] = {6, 1, 2744},
	["chiakhoavang"] = {6, 1, 30191},
}
tbSJNewAward = 
{	
	["chiakhoanhuy"] = 
	{
		{szName="觤 kinh nghi謒 1", 
					pFun = function (tbItem, nItemCount, szLogTitle)
						%tbvng_ChestExpAward:ExpAward(1000000, "T鑞g Kim B� B秓")
					end,
					nRate = 52,
		},
		{szName="觤 kinh nghi謒 2", 
					pFun = function (tbItem, nItemCount, szLogTitle)
						%tbvng_ChestExpAward:ExpAward(2000000, "T鑞g Kim B� B秓")
					end,
					nRate = 30,
		},
		{szName="觤 kinh nghi謒 3", 
					pFun = function (tbItem, nItemCount, szLogTitle)
						%tbvng_ChestExpAward:ExpAward(3000000, "T鑞g Kim B� B秓")
					end,
					nRate = 10,
		},
		{szName="觤 kinh nghi謒 4", 
					pFun = function (tbItem, nItemCount, szLogTitle)
						%tbvng_ChestExpAward:ExpAward(4000000, "T鑞g Kim B� B秓")
					end,
					nRate = 5,
		},
		{szName="觤 kinh nghi謒 5", 
					pFun = function (tbItem, nItemCount, szLogTitle)
						%tbvng_ChestExpAward:ExpAward(5000000, "T鑞g Kim B� B秓")
					end,
					nRate = 3,
		},		
	},	
	-- Thay i ph莕 thng s� d鬾g T鑞g Kim B� B秓  -Modifiled by ThanhLD - 20130417	
	["chiakhoavang"] = 
	{
		-- {szName="X輈h L﹏ L謓h",tbProp={6,1,3393,1,0,0},nCount=1,nRate=0.05},
		-- {szName="M秐h X輈h L﹏",tbProp={6,1,3391,1,0,0},nCount=1,nRate=0.2},
		-- {szName="X輈h L﹏ Kim B礽",tbProp={6,1,3392,1,0,0},nCount=1,nRate=0.1},
		-- {szName="X輈h L﹏ Tr秓",tbProp={6,1,3394,1,0,0},nCount=1,nRate=0.7},
		-- {szName="X輈h L﹏ Gi竎",tbProp={6,1,3395,1,0,0},nCount=1,nRate=0.3},
		-- {szName="X輈h L﹏ T譶h",tbProp={6,1,3396,1,0,0},nCount=1,nRate=0.1},
		-- {szName="B筩h H� Ph竧 Qu竛 - T� ch鋘 h� ph竔",tbProp={6,1,30242,1,0,0},nCount=1,nRate=0.016,tbParam={2,0,0,0,0,0}},
		-- {szName="B筩h H� Kim Kh秈 - T� ch鋘 h� ph竔",tbProp={6,1,30242,1,0,0},nCount=1,nRate=0.006,tbParam={6,0,0,0,0,0}},
		-- {szName="B筩h H� Y猽 Цi - T� ch鋘 h� ph竔",tbProp={6,1,30242,1,0,0},nCount=1,nRate=0.018,tbParam={5,0,0,0,0,0}},
		-- {szName="B筩h H� H筺g Li猲 - T� ch鋘 h� ph竔",tbProp={6,1,30242,1,0,0},nCount=1,nRate=0.016,tbParam={1,0,0,0,0,0}},
		-- {szName="B筩h H� Ng鋍 B閕 - T� ch鋘 h� ph竔",tbProp={6,1,30242,1,0,0},nCount=1,nRate=0.016,tbParam={9,0,0,0,0,0}},
		-- {szName="B筩h H� H礽 - T� ch鋘 h� ph竔",tbProp={6,1,30242,1,0,0},nCount=1,nRate=0.016,tbParam={8,0,0,0,0,0}},
		-- {szName="B筩h H� H� Uy觧 - T� ch鋘 h� ph竔",tbProp={6,1,30242,1,0,0},nCount=1,nRate=0.016,tbParam={4,0,0,0,0,0}},
		-- {szName="B筩h H� Thng Gi韎 Ch� - T� ch鋘 h� ph竔",tbProp={6,1,30242,1,0,0},nCount=1,nRate=0.016,tbParam={3,0,0,0,0,0}},
		-- {szName="B筩h H� H� Gi韎 Ch� - T� ch鋘 h� ph竔",tbProp={6,1,30242,1,0,0},nCount=1,nRate=0.016,tbParam={10,0,0,0,0,0}},
		-- {szName="B筩h H� Kh� Gi韎 - T� ch鋘 h� ph竔",tbProp={6,1,30242,1,0,0},nCount=1,nRate=0.006,tbParam={7,0,0,0,0,0}},
		-- {szName="Ch﹏ Nguy猲 Кn (trung)",tbProp={6,1,30228,1,0,0},nCount=1,nRate=10,nBindState=-2},
		-- {szName="lng",nJxb=1000000,nCount=1,nRate=4},
		-- {szName="lng",nJxb=500000,nCount=1,nRate=10},
		-- {szName="T鑓 Hi謚 B筩h C﹗ Ho祅 c蕄 150",tbProp={6,1,2975,1,0,0},nCount=1,nRate=3,nExpiredTime=10080,},
		-- {szName="X輈h L﹏ Ph竧 Qu竛 - T� ch鋘 h� ph竔",tbProp={6,1,30386,1,0,0},nCount=1,nRate=0.002,tbParam={2,0,0,0,0,0}},
		-- {szName="X輈h L﹏ Kim Kh秈 - T� ch鋘 h� ph竔",tbProp={6,1,30386,1,0,0},nCount=1,nRate=0.001,tbParam={6,0,0,0,0,0}},
		-- {szName="X輈h L﹏ Y猽 Цi - T� ch鋘 h� ph竔",tbProp={6,1,30386,1,0,0},nCount=1,nRate=0.002,tbParam={5,0,0,0,0,0}},
		-- {szName="X輈h L﹏ H筺g Li猲 - T� ch鋘 h� ph竔",tbProp={6,1,30386,1,0,0},nCount=1,nRate=0.002,tbParam={1,0,0,0,0,0}},
		-- {szName="X輈h L﹏ Ng鋍 B閕 - T� ch鋘 h� ph竔",tbProp={6,1,30386,1,0,0},nCount=1,nRate=0.002,tbParam={9,0,0,0,0,0}},
		-- {szName="X輈h L﹏ H礽 - T� ch鋘 h� ph竔",tbProp={6,1,30386,1,0,0},nCount=1,nRate=0.002,tbParam={8,0,0,0,0,0}},
		-- {szName="X輈h L﹏ H� Uy觧 - T� ch鋘 h� ph竔",tbProp={6,1,30386,1,0,0},nCount=1,nRate=0.002,tbParam={4,0,0,0,0,0}},
		-- {szName="X輈h L﹏ Thng Gi韎 Ch� - T� ch鋘 h� ph竔",tbProp={6,1,30386,1,0,0},nCount=1,nRate=0.002,tbParam={3,0,0,0,0,0}},
		-- {szName="X輈h L﹏ H� Gi韎 Ch� - T� ch鋘 h� ph竔",tbProp={6,1,30386,1,0,0},nCount=1,nRate=0.002,tbParam={10,0,0,0,0,0}},
		-- {szName="X輈h L﹏ Kh� Gi韎 - T� ch鋘 h� ph竔",tbProp={6,1,30386,1,0,0},nCount=1,nRate=0.008,tbParam={7,0,0,0,0,0}},
		-- {szName="C祅 Kh玭 Song Tuy謙 B閕",tbProp={6,1,2219,1,0,0},nCount=1,nRate=0.05,nExpiredTime=43200},
		-- {szName="Phi phong Ng� Phong (X竎 su蕋 h鉧 gi秈 s竧 thng)",tbProp={0,3474},nCount=1,nRate=0.04,nQuality = 1,nExpiredTime=10080,},
		-- {szName="Phi phong Ng� Phong (Tr鋘g k輈h)",tbProp={0,3475},nCount=1,nRate=0.04,nQuality = 1,nExpiredTime=10080,},
		-- {szName="Phi phong Ng� Phong (D辌h chuy觧 t鴆 th阨 )",tbProp={0,3473},nCount=1,nRate=0.04,nQuality = 1,nExpiredTime=10080,},
		-- {szName="Phong V﹏ Chi猽 Binh L� Bao",tbProp={6,1,30084,1,0,0},nCount=1,nRate=5,nExpiredTime=20160},
		-- {szName="Anh H飊g Thi誴",tbProp={6,1,1604,1,0,0},nCount=1,nRate=1.5,nExpiredTime=43200},
		-- {szName="M苩 n� - Anh h飊g chi課 trng",tbProp={0,11,482,1,0,0},nCount=1,nRate=0.1,nExpiredTime=10080,nUsageTime = 60},
		-- {szName="Vi猰 д L謓h",tbProp={6,1,1617,1,0,0},nCount=1,nRate=0.6,nExpiredTime=20160},
		-- {szName="Long Huy誸 Ho祅",tbProp={6,1,2117,1,0,0},nCount=1,nRate=0.6,nExpiredTime=20160},
		-- {szName="L謓h B礽 Th駓 T芻",tbProp={6,1,2745,1,0,0},nCount=1,nRate=0.6,nExpiredTime=20160},
		-- {szName="H錳 thi猲 t竔 t筼 l� bao",tbProp={6,1,2527,1,0,0},nCount=1,nRate=0.5,nExpiredTime=20160},
		-- {szName="Tr� L鵦 Ho祅 L� Bao",tbProp={6,1,30161,1,0,0},nCount=1,nRate=0.5,nExpiredTime=20160},
		-- {szName="Ho箃 Huy誸 Кn L� Bao",tbProp={6,1,30160,1,0,0},nCount=1,nRate=0.5,nExpiredTime=20160},
		-- {szName="Чi l鵦 ho祅 l� bao",tbProp={6,1,2517,1,0,0},nCount=1,nRate=0.5,nExpiredTime=20160},
		-- {szName="Phi t鑓 ho祅 l� bao",tbProp={6,1,2520,1,0,0},nCount=1,nRate=0.5,nExpiredTime=20160},
		-- {szName="Ph� Qu� C萴 H筽",tbProp={6,1,2402,1,0,0},nCount=1,nRate=1,nExpiredTime=1440},
		{szName="4.000.000 Exp", 
			pFun = function (tbItem, nItemCount, szLogTitle)
				%tbvng_ChestExpAward:ExpAward(4000000, "T鑞g Kim B� B秓")
			end,
			nRate = 28.313,
		},
		{szName="5.000.000 Exp", 
			pFun = function (tbItem, nItemCount, szLogTitle)
				%tbvng_ChestExpAward:ExpAward(5000000, "T鑞g Kim B� B秓")
			end,
			nRate = 18,
		},
		{szName="6.000.000 Exp", 
			pFun = function (tbItem, nItemCount, szLogTitle)
				%tbvng_ChestExpAward:ExpAward(6000000, "T鑞g Kim B� B秓")
			end,
			nRate = 7,
		},
		{szName="8.000.000 Exp", 
			pFun = function (tbItem, nItemCount, szLogTitle)
				%tbvng_ChestExpAward:ExpAward(8000000, "T鑞g Kim B� B秓")
			end,
			nRate = 4,
		},
		{szName="10.000.000 Exp", 
			pFun = function (tbItem, nItemCount, szLogTitle)
				%tbvng_ChestExpAward:ExpAward(10000000, "T鑞g Kim B� B秓")
			end,
			nRate = 2,
		},
	},	
}

nWidth = 1
nHeight = 1
nFreeItemCellLimit = 1

function main(nIndexItem)
	local tbKey1 = tbSJ_Key_Require["chiakhoanhuy"]
	local tbKey2 = tbSJ_Key_Require["chiakhoavang"]
	local nCount1 = CalcItemCount(3, tbKey1[1], tbKey1[2], tbKey1[3], -1) 
	local nCount2 = CalcItemCount(3, tbKey2[1], tbKey2[2], tbKey2[3], -1) 
	if nCount1 == 0 and nCount2 == 0 then
		Say("C莕 ph秈 c� Ch譨 Kh鉧 V祅g ho芻 Ch譨 Kh鉧 Nh� � m韎 c� th� m� 頲 T鑞g Kim B� B秓", 1, "сng/no")
		return 1
	end

	if CountFreeRoomByWH(nWidth, nHeight, nFreeItemCellLimit) < nFreeItemCellLimit then
		Say(format("в b秓 m t礽 s秐 c馻 i hi謕, xin h穣  tr鑞g %d %dx%d h祅h trang", nFreeItemCellLimit, nWidth, nHeight))
		return 1
	end	
	local tbOpt = {}
	if nCount1 ~= 0 then
		tinsert(tbOpt,format("S� d鬾g Ch譨 kh鉧 nh� �/#VnSJBoxNewAward(%d, '%s')", nIndexItem, "chiakhoanhuy"))
	end
	if nCount2 ~= 0 then
		tinsert(tbOpt,format("S� d鬾g Ch譨 kh鉧 v祅g/#VnSJBoxNewAward(%d, '%s')", nIndexItem, "chiakhoavang"))
	end
	if getn(tbOpt) > 0 then
		tinsert(tbOpt, "сng/Oncancel")
		Say("S� d鬾g ch譨 kh鉧  m� rng:", getn(tbOpt), tbOpt)
	end
	return 1	
end
function Oncancel()end

function VnSJBoxNewAward(nItemIdx, strKeyType)
	local tbKey = tbSJ_Key_Require[strKeyType]
	local tbAward = tbSJNewAward[strKeyType]
	if not tbKey or not tbAward then
		return
	end
	if ConsumeItem(3, 1, tbKey[1], tbKey[2], tbKey[3], -1) ~= 1 then
		Say("C莕 ph秈 c� Ch譨 Kh鉧 V祅g ho芻 Ch譨 Kh鉧 Nh� � m韎 c� th� m� 頲 T鑞g Kim B� B秓", 1, "сng/no")
		return
	end
	
	if ConsumeItem(3, 1, 6, 1, 2741, -1) ~= 1 then
		Say("Kh玭g t譵 th蕐 T鑞g Kim B� B秓", 1, "сng/no")
		return
	end
	
	if strKeyType == "chiakhoavang" then
		%TransLife6:OnFinishEvent(%TASK_ID_BOX)
	end
	
	tbAwardTemplet:Give(tbAward, 1, {"SongJin", "use songjingmibao"})	
	AddStatData("baoxiangxiaohao_kaisongjinmibao", 1)	
end