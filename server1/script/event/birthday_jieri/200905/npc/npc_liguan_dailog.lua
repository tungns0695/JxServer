-- ====================== 文件信息 ======================

-- 剑侠情缘网络版越南版 - 雄霸天下礼官NPC对话
-- 文件名　：npc_dailog.lua
-- 创建者　：子非魚
-- 创建时间：2009-05-20 18:30:39

-- ======================================================

Include("\\script\\event\\birthday_jieri\\200905\\class.lua");
Include("\\script\\lib\\compose_jinnang.lua");
Include("\\script\\task\\system\\task_string.lua");

tbZhuHe = 
{
	[1] = 
	{
		szComposeTitle =  "фi",
		nFreeItemCellLimit = 1,
		tbMaterial = 
		{
			{szName = "H飊g", tbProp = {6,1,2062,1}},
			{szName = "B�", tbProp = {6,1,2063,1}},
			{szName = "Thi猲", tbProp = {6,1,2064,1}},
			{szName = "H�", tbProp = {6,1,2065,1}},
			{szName = "уng C�", tbProp = {6,1,2067,1}},
		},
		tbProduct = 
		{szName = "T﹏ B秐 C�", tbProp = {6,1,2068,1,0,0}, nExpiredTime = tbBirthday0905.tbTask.item_expiredtime2},
	},
	
	[2] = 
	{
		szComposeTitle =  "фi",
		nFreeItemCellLimit = 1,
		tbMaterial = 
		{
			{szName = "H飊g", tbProp = {6,1,2062,1}},
			{szName = "B�", tbProp = {6,1,2063,1}},
			{szName = "Thi猲", tbProp = {6,1,2064,1}},
			{szName = "H�", tbProp = {6,1,2065,1}},
			{szName = "Ho祅g K�", tbProp = {6,1,2066,1}},
		},
		tbProduct = 
		{szName = "T﹏ B秐 K�", tbProp = {6,1,2069,1,0,0}, nExpiredTime = tbBirthday0905.tbTask.item_expiredtime2},
	},
}


tbBirthday0905.tbZhuHe = tbComposeListForJinNang:new("tbBirthday0905_Compose", tbZhuHe)
tbXinwu =
{
	[1] =
	{
		szFailMsg = "S� lng kh玭g , t藀 h頿 cho  r錳 quay l筰 nh�!",
		tbMaterial = 
		{
			[1]	= {szName = "H飊g T﹎ Ki誱", tbProp = {6, 1, 2070, 1, 0, 0},	nCount = 1},
		},
		tbProduct = 
		{
			szName="50 v筺 EXP (1 H飊g T﹎ Ki誱)",
			[1]	= {nExp = 500000},
			[2] = 
			{
				pFun = function (self, nCount, szLogTilte)
					SetTask(tbBirthday0905.tbTask.tsk_toll_explmt, 500000 + GetTask(tbBirthday0905.tbTask.tsk_toll_explmt));
				end
			}
		},
		pLimitFun = function (self, nCount)
			if (GetTask(tbBirthday0905.tbTask.tsk_toll_explmt) + 500000 > 1000000000) then
				Msg2Player("Чi hi謕  nh薾 頲 kinh nghi謒 gi韎 h筺 cao nh蕋 r錳, kh玭g th� ti誴 t鬰 nh薾 th猰 n鱝!");
				return 0;
			else
				return 1;
			end
			
		end
	},
	[2] =
	{
		szFailMsg = "S� lng kh玭g , t藀 h頿 cho  r錳 quay l筰 nh�!",
		tbMaterial = 
		{
			[1]	= {szName = "B� Vng Thng", tbProp = {6, 1, 2071, 1, 0, 0},	nCount = 1},
		},
		tbProduct = 
		{
			szName="200 v筺 EXP (1 B� Vng Thng)",
			[1]	= {nExp = 2000000},
			[2] = 
			{
				pFun = function (self, nCount, szLogTilte)
					SetTask(tbBirthday0905.tbTask.tsk_toll_explmt, 2000000 + GetTask(tbBirthday0905.tbTask.tsk_toll_explmt));
				end
			}
		},
		pLimitFun = function (self, nCount)
			if (GetTask(tbBirthday0905.tbTask.tsk_toll_explmt) + 2000000 > 1000000000) then
				Msg2Player("Чi hi謕  nh薾 頲 kinh nghi謒 gi韎 h筺 cao nh蕋 r錳, kh玭g th� ti誴 t鬰 nh薾 th猰 n鱝!");
				return 0;
			else
				return 1;
			end
			
		end
	},
	[3] =
	{
		szFailMsg = "S� lng kh玭g , t藀 h頿 cho  r錳 quay l筰 nh�!",
		tbMaterial = 
		{
			[1]	= {szName = "Thi猲 T祅 o", tbProp = {6, 1, 2072, 1, 0, 0},	nCount = 1},
			
		},
		tbProduct = 
		{
			szName="200 v筺 EXP (1 Thi猲 T祅 o)",
			[1]	= {nExp = 2000000},
			[2] = 
			{
				pFun = function (self, nCount, szLogTilte)
					SetTask(tbBirthday0905.tbTask.tsk_toll_explmt, 2000000 + GetTask(tbBirthday0905.tbTask.tsk_toll_explmt));
				end
			}
		},
		pLimitFun = function (self, nCount)
			if (GetTask(tbBirthday0905.tbTask.tsk_toll_explmt) + 2000000 > 1000000000) then
				Msg2Player("Чi hi謕  nh薾 頲 kinh nghi謒 gi韎 h筺 cao nh蕋 r錳, kh玭g th� ti誴 t鬰 nh薾 th猰 n鱝!");
				return 0;
			else
				return 1;
			end
			
		end
	},
	[4] =
	{
		szFailMsg = "S� lng kh玭g , t藀 h頿 cho  r錳 quay l筰 nh�!",
		tbMaterial = 
		{
			[1]	= {szName = "H� Nh藅 Cung", tbProp = {6, 1, 2073, 1, 0, 0},	nCount = 1},
			
		},
		tbProduct = 
		{
			szName="300 v筺 EXP (1 H� Nh藅 Cung)",
			[1]	= {nExp = 3000000},
			[2] = 
			{
				pFun = function (self, nCount, szLogTilte)
					SetTask(tbBirthday0905.tbTask.tsk_toll_explmt, 3000000 + GetTask(tbBirthday0905.tbTask.tsk_toll_explmt));
				end
			}
		},
		pLimitFun = function (self, nCount)
			if (GetTask(tbBirthday0905.tbTask.tsk_toll_explmt) + 3000000 > 1000000000) then
				Msg2Player("Чi hi謕  nh薾 頲 kinh nghi謒 gi韎 h筺 cao nh蕋 r錳, kh玭g th� ti誴 t鬰 nh薾 th猰 n鱝!");
				return 0
			else
				return 1
			end
			
		end
	},
	[5] =
	{
		szFailMsg = "S� lng kh玭g , t藀 h頿 cho  r錳 quay l筰 nh�!",
		tbMaterial = 
		{
			[1]	= {szName = "H飊g T﹎ Ki誱", tbProp = {6, 1, 2070, 1, 0, 0}, nCount = 5},
			[2]	= {szName = "B� Vng Thng", tbProp = {6, 1, 2071, 1, 0, 0}, nCount = 2},
			
		},
		tbProduct = 
		{
			szName="800 v筺 EXP (5 H飊g T﹎ Ki誱 + 2 B� Vng Thng)",
			[1]	= {nExp = 8000000},
			[2] = 
			{
				pFun = function (self, nCount, szLogTilte)
					SetTask(tbBirthday0905.tbTask.tsk_toll_explmt, 8000000 + GetTask(tbBirthday0905.tbTask.tsk_toll_explmt));
				end
			}
		},
		pLimitFun = function (self, nCount)
			if (GetTask(tbBirthday0905.tbTask.tsk_toll_explmt) + 8000000 > 1000000000) then
				Msg2Player("Чi hi謕  nh薾 頲 kinh nghi謒 gi韎 h筺 cao nh蕋 r錳, kh玭g th� ti誴 t鬰 nh薾 th猰 n鱝!");
				return 0;
			else
				return 1;
			end
			
		end
	},
	[6] =
	{
		szFailMsg = "S� lng kh玭g , t藀 h頿 cho  r錳 quay l筰 nh�!",
		tbMaterial = 
		{
			[1]	= {szName = "H飊g T﹎ Ki誱", tbProp = {6, 1, 2070, 1, 0, 0}, nCount = 5},
			[2]	= {szName = "B� Vng Thng", tbProp = {6, 1, 2071, 1, 0, 0}, nCount = 2},
			[3]	= {szName = "Thi猲 T祅 o", tbProp = {6, 1, 2072, 1, 0, 0}, nCount = 1},
		},
		tbProduct = 
		{
			szName="1200 v筺 EXP (5 H飊g T﹎ Ki誱 + 2 B� Vng Thng + 1 Thi猲 T祅 o)",
			[1]	= {nExp = 12000000},
			[2] = 
			{
				pFun = function (self, nCount, szLogTilte)
					SetTask(tbBirthday0905.tbTask.tsk_toll_explmt, 12000000 + GetTask(tbBirthday0905.tbTask.tsk_toll_explmt));
				end
			}
		},
		pLimitFun = function (self, nCount)
			if (GetTask(tbBirthday0905.tbTask.tsk_toll_explmt) + 12000000 > 1000000000) then
				Msg2Player("Чi hi謕  nh薾 頲 kinh nghi謒 gi韎 h筺 cao nh蕋 r錳, kh玭g th� ti誴 t鬰 nh薾 th猰 n鱝!");
				return 0;
			else
				return 1;
			end
			
		end
	},
	[7] =
	{
		szFailMsg = "S� lng kh玭g , t藀 h頿 cho  r錳 quay l筰 nh�!",
		tbMaterial = 
		{
			[1]	= {szName = "H飊g T﹎ Ki誱", tbProp = {6, 1, 2070, 1, 0, 0}, nCount = 5},
			[2]	= {szName = "B� Vng Thng", tbProp = {6, 1, 2071, 1, 0, 0}, nCount = 2},
			[3]	= {szName = "Thi猲 T祅 o", tbProp = {6, 1, 2072, 1, 0, 0}, nCount = 1},
			[4]	= {szName = "H� Nh藅 Cung", tbProp = {6, 1, 2073, 1, 0, 0}, nCount = 1},
			
		},
		tbProduct = 
		{
			szName="2000 v筺 EXP (5 H飊g T﹎ Ki誱+2 B� Vng Thng+1 Thi猲 T祅 o+1 H� Nh藅 Cung)",
			[1]	= {nExp = 20000000},
			[2] = 
			{
				pFun = function (self, nCount, szLogTilte)
					SetTask(tbBirthday0905.tbTask.tsk_toll_explmt, 20000000 + GetTask(tbBirthday0905.tbTask.tsk_toll_explmt));
				end
			}
		},
		pLimitFun = function (self, nCount)
			if (GetTask(tbBirthday0905.tbTask.tsk_toll_explmt) + 20000000 > 1000000000) then
				Msg2Player("Чi hi謕  nh薾 頲 kinh nghi謒 gi韎 h筺 cao nh蕋 r錳, kh玭g th� ti誴 t鬰 nh薾 th猰 n鱝!");
				return 0;
			else
				return 1;
			end
			
		end
	},	
}

function tbBirthday0905:OnDailogMain2(nItemIndex, szDescLink)
	if (self:IsActDate() ~= 1) then
		return Talk(1, "", "Ho箃 ng  k誸 th骳.");
	end
	
	self.tbTask:reset_task();
	
	local nItemIndex  = nItemIndex or -1
	szDescLink = szDescLink or "<npc>"
	
--	if not self.tbZhuHe then
--		
--	end

	local szTitle = format("Ho箃 ng 揅h祇 m鮪g phi猲 b秐 m韎� di詎 ra t� %s n %s. Ngi mu鑞 t譵 hi觰 ho箃 ng n祇?", "19/06/2009", "19/07/2009");
	
	local tbSay = self.tbZhuHe:MakeOptByProductName("T筰 h� mu鑞 i", nItemIndex, szDescLink)
	tinsert(tbSay, 1, "<dec>"..szDescLink..szTitle)
	tinsert(tbSay, "K誸 th骳 i tho筰/OnCancel")
	CreateTaskSay(tbSay)
end

tbBirthday0905.tbXinwu = tbComposeListForJinNang:new("tbBirthday0905_Compose_chuangguan", tbXinwu)
function tbBirthday0905:OnDailogMain3(nItemIndex, szDescLink)
	if (self:IsActDate() ~= 1) then
		return Talk(1, "", "Ho箃 ng  k誸 th骳.");
	end
	
	self.tbTask:reset_task();
	
	local nItemIndex  = nItemIndex or -1
	szDescLink = szDescLink or "<npc>"
	
--	if not self.tbXinwu then
--		
--	end

	local szTitle = "Ho箃 ng 揟輓 v藅 khai m玭� di詎 ra t� ng祔 19/06/2009 n 24:00 19/07/2009.Trong th阨 gian n祔 c竎 v� i hi謕 c� th� thu th藀 c竎 t輓 v藅 揌飊g T﹎ Ki誱�, 揃� Vng Thng�, 揟hi猲 T祅 o�, 揌� Nh藅 Cung� t� c竎 ho箃 ng vt 秈, t輓 s�.D飊g c竎 t輓 v藅 n祔  i l蕐 nhi襲 ph莕 thng h蕄 d蒼.";
	
	local tbSay = self.tbXinwu:MakeOptByProductName("", nItemIndex, szDescLink)
	tinsert(tbSay, 1, "<dec>"..szDescLink..szTitle)
	tinsert(tbSay, "K誸 th骳 i tho筰/OnCancel")
	CreateTaskSay(tbSay)
end

function tbBirthday0905:GetJinnang()
	if (self:IsActDate() ~= 1) then
		return Talk(1, "", "Ho箃 ng  k誸 th骳.");
	end
	
	local bRet, szFailMsg = self:IsPlayerEligible() 
	
	if bRet ~= 1 then
		Talk(2, "", szFailMsg, "Ngi ch璦  甶襲 ki謓  nh薾 v藅 ph萴 n祔")
		return
	end
	
	if self.tbTask:if_taked_jinnang() ~= 0 then
		Say("L� Quan"..":".."Ta nh� kh玭g nh莔 th� ngi  nh薾 r錳?",1, "Th藅 ng筰 qu�! T筰 h� qu猲 m蕋./OnCancel")
		return 
	end
	local tbItem = {szName="C萴 nang s� ki謓", tbProp={6, 1, 1833, 1, 0, 0}, nExpiredTime = self.tbTask.item_expiredtime1, tbParam = {self.tbTask.item_expiredtime1, 1000}}
	
	tbAwardTemplet:GiveAwardByList(tbItem, "get by Birthday0905")
	self.tbTask:set_task(self.tbTask.tsk_jinnangsj,1);
end


function tbBirthday0905:OnDailogMain4()
	if (self:IsActDate() ~= 1) then
		return Talk(1, "", "Ho箃 ng  k誸 th骳.");
	end
	local tbSay = {};
	local szTitle = format("Ho箃 ng {{s╪ b総 nh輒 b衞 ph讅} di詎 ra t� %s  n %s. Trong th阨 gian n祔 i hi謕 nh {{Nh輒 b衞 ph讅} s� c� th� nh薾 頲 nhi襲 ph莕 thng h蕄 d蒼. {{Nh輒 b衞 ph讅} xu蕋 hi謓 � 7 Чi th祅h th� v� 8 T﹏ th� th玭. M鏸 ng祔 i hi謕 ch� c� th� s╪ t鑙 產 20 {{Nh輒 b衞 ph讅}.", "19/06/2009", "19/07/2009");
	tinsert(tbSay, 1, "<dec><npc>"..szTitle)
	tinsert(tbSay, "K誸 th骳 i tho筰/OnCancel")
	CreateTaskSay(tbSay);
end


function tbBirthday0905:OnDailogMain5()
	if (self:IsActDate() ~= 1) then
		return Talk(1, "", "Ho箃 ng  k誸 th骳.");
	end
	local tbSay = {};
	local szTitle = format("Ho箃 ng {{h� tr� t﹏ th駗} di詎 ra t� %s n %s. Trong th阨 gian n祔 c竎 v� i hi謕 c� c蕄  trong kho秐g t� 1-79 c� th� t筰 8 t﹏ th� th玭 � NPC {{Chi課 T﹎ t玭 gi秨} g莕 L� Quan nh薾 {{H� tr� t﹏ th駗} v� tham gia ho箃 ng {{H� tr� t﹏ th駗}. Tham gia ho箃 ng h� tr� t﹏ th� th� c竎 v� i hi謕 s� g苝 nhi襲 thu薾 l頸 khi h祅h hi謕  tr猲 giang h�.", "19/06/2009", "19/07/2009");
	tinsert(tbSay, 1, "<dec><npc>"..szTitle)
	tinsert(tbSay, "K誸 th骳 i tho筰/OnCancel")
	CreateTaskSay(tbSay);
end

