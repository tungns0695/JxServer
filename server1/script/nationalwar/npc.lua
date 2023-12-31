-- 内阁尚书：天子系统入口
-- By: wangbin(2009-5-24)

Include("\\script\\nationalwar\\head.lua")
Include( "\\script\\lib\\say.lua" )
Include("\\script\\item\\tianziyuxi.lua")
IncludeLib("ITEM")
Include("\\script\\lib\\awardtemplet.lua")

function main()
	Say("N閕 c竎 thng th� h莡 ch�",
		7,
		"Thi猲 T� ng c�/nw_enthrone",
		"Thi猲 T� ng� ch�/nw_emperororder",
		"Qu鑓 Vng chi誹 th�/nw_kingorder",
		"L穘h ph莕 thng/nw_accept",
		"L遪g d﹏ l� c竛 c﹏ chu萵 m鵦/nw_comment",
		"Thi誸 b髏 tr鵦 th� (s� k�)/nw_history",
		"Ta ch� n ch琲/Cancel")
end

-- 天子登基
function nw_enthrone()
	if (NW_IsEmperor() == 1) then
		Say("L� ng c�  di詎 ra r錳, l� n祇 b� h� qu猲 r錳?")
		return
	end
	local result = NW_GetTask(NW_TASKNO_WARRESULT)
	if (result == 0 and NW_GetEmperorName() == "") then
		Say("V� anh h飊g n祔 c� ch� kh� h琻 ngi, nh璶g h穣 i th阨 c� .")
	elseif (result == 1 or result == 2) then
		local master = ""
		local side = 0
		if (result == 1) then
			-- 宋赢
			_, master = GetCityOwner(CITYIDX_LINAN)
			side = 1
		else
			-- 金赢
			_, master = GetCityOwner(CITYIDX_BIANJING)
			side = 0
		end
		if (GetName() ~= master) then
			Say("Л琻g kim Thi猲 T� kh玭g ph秈 ngi b譶h thng m 琻g 頲")
		else
			NW_Enthrone(side)
			NW_SetTask(NW_TASKNO_WARRESULT, 100 + result)
		end
	else
		Say("Л琻g kim Thi猲 T� anh minh, ngi h穣 ch蕄 nh薾 s� th藅 甶.")
	end
end

-- 天子谕旨
function nw_emperororder()
	Say("Thi猲 T� ng� ch�",
		7,
		"t qu鑓 hi謚/nw_emperororder_setnationtitle",
		"Kh緋 ch鑞 m鮪g vui/nw_emperororder_congratulate",
		"Чi x� thi猲 h�/nw_emperororder_absolve",
		"Thi猲 T� chi誹 th�/nw_emperororder_message",
		"Quy猲 ti襫/nw_emperororder_levy",
		"C蕀 n鉯/nw_emperororder_forbidtalkdlg",
		"Ta ch� n ch琲/Cancel")
end

-- 国王诏书
function nw_kingorder()
	Say("Ngi ng u m閠 nc, c� quy襫 h筺 cao nh蕋",
		3,
		"Phong i th莕/nw_kingorder_instate",
		"襲 ch豱h thu� su蕋/nw_kingorder_taxdlg",
		"Kh玭g l祄 g�./Cancel")
end

-- 领取
function nw_accept()
	Say("Tr竛g s� xu蕋 tr薾, gi誸 ch l藀 c玭g",
		5,
		"Nh薾 l謓h b礽 qu鑓 chi課/nw_accept_token",
		"Nh薾 ph莕 thng Ho祅g д/nw_accept_domainring",
		--New emperor award - Modified By DinhHQ - 20120726
		--"Nh薾 ph莕 thng Thi猲 T�/nw_accept_empirering",
		"Nh薾 ph莕 thng Thi猲 T�/VnEmperorNewAward",
		"Nh薾 thi猲 t� ng鋍 t�/nw_accept_empireseal",
		"Ta ch� gh� qua xem/Cancel")
end

-- 领取/国战令牌
function nw_accept_token()
	city = GetCityArea()
	if (city ~= CITYIDX_LINAN and city ~= CITYIDX_BIANJING) then
		Say("N琲 y l� n祇 kh玭g thu閏 khu v鵦 t鑞g kim?")
		return
	end
	tong, master = GetCityOwner(city)
	if (GetTong() ~= tong) then
		Say("Nh譶 ngi kh玭g gi鑞g nh� th莕 d﹏ nc ta, l� n祇 ngi l� gian t� c馻 ch?")
		return
	end
	if (master ~= GetName() and NW_GetDuty() == NWPOSITION_NONE) then
		Say("Ngi kh玭g li猲 quan kh玭g th� tham d� qu鑓 gia i s�!")
		return
	end
	local free = CalcFreeItemCellCount()
	if (free == 0) then
		Say("H祅h trang kh玭g  ch� tr鑞g, s緋 x誴 l筰 r錳 n nh薾 l筰.")
		return
	end
	local count = 10
	if (free < count) then
		count = free
	end
	local token = TAB_TOKEN[city]
	for i = 1, count do
		local item = AddItem(token[1], token[2], token[3], 1, 0, 0)
		if (item ~= 0) then
			local timeout = GetLocalTime() + SECONDS_ONEDAY
			ITEM_SetExpiredTime2(item, timeout)
			SyncItem(item)
		end
	end
	Say(format("Зy l� <color=red>%d<color> qu鑓 chi課 l謓h b礽. C� th� nh薾 th猰 n誹 mu鑞.", count))
end

-- 领取/领取帝皇奖励
function nw_accept_domainring()
		
	local nWeek = tonumber(GetLocalDate("%w"));	 
	local nTime = tonumber(GetLocalDate("%H%M%S"));
	local nHour = tonumber(GetLocalDate("%H"));	
	
	local nWiner = mod(NW_GetTask(NW_TASKNO_WARRESULT), 100);
	local city   = GetCityArea()

	if (city ~= CITYIDX_LINAN and city ~= CITYIDX_BIANJING) then
		Say("N琲 y l� n祇 kh玭g thu閏 khu v鵦 t鑞g kim?")
		return
	end
	
	if nWiner ~= 1 and nWiner ~= 2 then
		Say("V蒼 ch璦 nh 畂箃 頲 ai l� thi猲 t�")
		return
	end

	if nWiner == 1 and city ~= CITYIDX_BIANJING then
		Say("Ph莕 thng d祅h cho ngi c� h飊g t﹎ tr竛g ch� d祅h l筰 giang s琻, xin h穣 n th祅h th� c馻 m譶h  l躰h thng!")
		return
	end
	
	if nWiner == 2 and city ~= CITYIDX_LINAN then
		Say("Ph莕 thng d祅h cho ngi c� h飊g t﹎ tr竛g ch� d祅h l筰 giang s琻, xin h穣 n th祅h th� c馻 m譶h  l躰h thng!")
		return
	end
	
	tong, master = GetCityOwner(city)
	if (NW_IsEmperor() == 1) then
		Say("Thi猲 T� ng nh薾 <color=red>ph莕 thng Thi猲 T�<color>.")
	elseif (GetTong() ~= tong) then
		Say("Nh譶 b� d筺g l藀 l� c馻 ngi, h糿 l� l� gian t� c馻 ch?")
	elseif (master ~= GetName()) then
		Say("Ngi kh玭g li猲 quan kh玭g th� tham d� qu鑓 gia i s�!")
	elseif (NW_GetTask(NW_TASKNO_GETDOMAINRING) ~= 0) then
		Say("Qu鑓 ch�  nh薾 thng r錳.")
	elseif (nWeek == 1 and nTime >= 120000 and nTime <= 223000) then
		Say("Chi課 s� c蕄 b竜, xin m阨 b� h� ngh猲h chi課.")
	else
		local free = FindFreeRoomByWH(2, 3)
		if (free ~= 1) then
			Say("H祅h trang kh玭g  ch� tr鑞g, s緋 x誴 l筰 r錳 n nh薾 l筰.")
			return
		end
		
		local item = AddItem(0,10,7,1,0,0)
		if (item == 0) then
			WriteLog(format("[NW]Failed to give king-ring[AddItem(0,10,7,1,0,0)] to %s", GetName()))
			Say("C� 甶襲 g�  kh玭g 鎛, b秓 v藅 t筸 th阨 kh玭g th� giao cho ngi 頲.")
		else
			
			if nWeek == 0 then	nWeek = 7;	end
			if nWeek == 1 and	nHour < 21	then	nWeek = 8;	end
			local nExpiredDate = FormatTime2Date((8 - nWeek) * 24 * 60 *60 + GetCurServerTime());
		
			ITEM_SetExpiredTime(item, nExpiredDate, 120000)
			SyncItem(item)
			
			NW_SetTask(NW_TASKNO_GETDOMAINRING, 1)
			WriteLog(format("[NW]Give king-ring[AddItem(0,10,7,1,0,0)] to %s", GetName()))
			Say("Ph莕 thng l� <color=red>Phi猲 V�<color>, xin m阨 qu鑓 ch� nh薾 l蕐.")
		end
		
		
	end
end

-- 领取/领取天子奖励
function nw_accept_empirering()
	--Change emperor ring and horse award - modified By DinhHQ -  20120726
	do return end
	local nWeek = tonumber(GetLocalDate("%w"));	 
	local nTime = tonumber(GetLocalDate("%H%M%S"));
	local nHour = tonumber(GetLocalDate("%H"));		
	
	city = GetCityArea()
	if (city ~= CITYIDX_LINAN and city ~= CITYIDX_BIANJING) then
		Say("N琲 y l� n祇 kh玭g thu閏 khu v鵦 t鑞g kim?")
	elseif (NW_IsEmperor() ~= 1) then
		Say("<color=red>Ph莕 thng c馻 thi猲 t�<color> ch� c� th� Thi猲 T� m韎 nh薾 頲, ngi l� ai m� d竚 m筼 danh Thi猲 T�!")
	elseif (NW_GetTask(NW_TASKNO_GETEMPIRERING) ~= 0) then
		Say("B� h�  nh薾 thng r錳.")
	elseif (nWeek == 1 and nTime >= 120000 and nTime <= 223000) then
		Say("Chi課 s� c蕄 b竜, xin m阨 b� h� chu萵 b� ngh猲h chi課.")
	else
		local free = FindFreeRoomByWH(2, 4)
		if (free ~= 1) then
			Say("H祅h trang kh玭g  ch� tr鑞g, s緋 x誴 l筰 r錳 n nh薾 l筰.")
			return
		end
		
		if nWeek == 0 then	nWeek = 7;	end
		if nWeek == 1 and	nHour < 21	then	nWeek = 8;	end
		local nExpiredDate = FormatTime2Date((8 - nWeek) * 24 * 60 *60 + GetCurServerTime());
		
		local itemHorse = AddItem(0,10,7,1,0,0)
		if (itemHorse == 0) then
			WriteLog(format("[NW]Failed to give emperor-ring[AddItem(0,10,7,1,0,0)] to %s", GetName()))
			Say("C� 甶襲 g�  kh玭g 鎛, b秓 v藅 t筸 th阨 kh玭g th� giao cho ngi 頲.")
			return
		end
		WriteLog(format("[NW]Give king-ring[AddItem(0,10,7,1,0,0)] to %s", GetName()))
		ITEM_SetExpiredTime(itemHorse, nExpiredDate, 120000)
		SyncItem(itemHorse)
		
		-- 已经成功领取到部分物品
		NW_SetTask(NW_TASKNO_GETEMPIRERING, 1) 
		
		local itemBeijin = AddGoldItem(0,142)
		if (itemBeijin == 0) then
			WriteLog(format("[NW]Failed to give emperor-ring[AddGoldItem(0,142)] to %s", GetName()))
			Say("C� 甶襲 g�  kh玭g 鎛, b秓 v藅 t筸 th阨 kh玭g th� giao cho ngi 頲.")
			return
		end
		WriteLog(format("[NW]Give king-ring[AddGoldItem(0,142)] to %s", GetName()))
		ITEM_SetExpiredTime(itemBeijin, nExpiredDate, 120000)
		SyncItem(itemBeijin)
		
		local itemYaDian = AddGoldItem(0,141)
		if (itemYaDian == 0) then
			WriteLog(format("[NW]Failed to give emperor-ring[AddGoldItem(0,141)] to %s", GetName()))
			Say("C� 甶襲 g�  kh玭g 鎛, b秓 v藅 t筸 th阨 kh玭g th� giao cho ngi 頲.")
			return
		end
		WriteLog(format("[NW]Give king-ring[AddGoldItem(0,141)] to %s", GetName()))
		ITEM_SetExpiredTime(itemYaDian, nExpiredDate, 120000)
		SyncItem(itemYaDian)
		
		Say("Ph莕 thng c馻 b� h� l� <color=red>V� danh gi韎 ch�, v� danh ch� ho祅, phi猲 v�<color>.")
	end
end

-- 领取/领取天子玉玺
function nw_accept_empireseal()
	
	local nWeek = tonumber(GetLocalDate("%w"));	 
	local nTime = tonumber(GetLocalDate("%H%M%S"));
	
	city = GetCityArea()
	if (city ~= CITYIDX_LINAN and city ~= CITYIDX_BIANJING) then
		Say("N琲 y l� n祇 kh玭g thu閏 khu v鵦 t鑞g kim?")
	elseif (NW_IsEmperor() ~= 1) then
		Say("Ch� c� Thi猲 T� m韎 th� mang 頲 Thi猲 T� ng鋍 t�, ngi th藅 to gan d竚 gi� m筼 Thi猲 T�!")
	elseif (NW_GetTask(NW_TASKNO_GETEMPIRESEAL) ~= 0) then
		Say("B� h�  nh薾 <color=red>Thi猲 T� ng鋍 t�<color> r錳.")
	elseif (nWeek == 1 and nTime >= 120000 and nTime <= 223000) then
		Say("Chi課 s� c蕄 b竜, xin m阨 b� h� chu萵 b� ngh猲h chi課.")
	else
		local free = CalcFreeItemCellCount()
		if (free == 0) then
			Say("H祅h trang kh玭g  ch� tr鑞g, s緋 x誴 l筰 r錳 n nh薾 l筰.")
			return
		end
		local itemidx = AddItem(6, 1, 2059, 1, 0, 0)
		if (itemidx == 0) then
			WriteLog(format("[NW]Failed to give emperor-seal[Item(6,1,2059,1,0,0)] to %s", GetName()))
			Say("C� 甶襲 g�  kh玭g 鎛, b秓 v藅 t筸 th阨 kh玭g th� giao cho ngi 頲.")
		else
			WriteLog(format("[NW]Give emperor-seal[Item(6,1,2059,1,0,0)] to %s", GetName()))
			tbItemTianZiYuXi:GiveCallBack(itemidx)
			NW_SetTask(NW_TASKNO_GETEMPIRESEAL, 1)
			Say("Зy l� Thi猲 T� ng鋍 t�, xin m阨 b� h� nh薾 l蕐.")
		end
	end
end

-- 民心是杆秤
function nw_comment()
	Say("Tuy r籲g quy襫 th� c馻 Thi猲 T� cao nh璶g c騨g kh玭g th� xem thng l遪g d﹏ 頲.",
		3,
		"Nh薾 x衪 琻g kim Thi猲 T�/nw_comment_commit",
		"Xem k誸 qu� nh薾 x衪/nw_comment_query",
		"Kh玭g c� vi謈 g�/Cancel")
end

-- 铁笔直书
function nw_history()
	Say("H祇 ki謙 tuy nhi襲, nh璶g trong l辌h s� ch� l璾 danh, t� c� ch� kim c� m蕐 ngi?",
		4,
		"L辌h s� thi猲 t�/nw_history_emperor",
		"T鑞g qu鑓 s� k�/nw_history_song",
		"Kim qu鑓 s� k�/nw_history_jin",
		"Ta ch� n tng ni謒 m閠 l骳./Cancel")
end

-- 天子谕旨/设立国号
function nw_emperororder_setnationtitle()
	if (NW_IsEmperor() ~= 1) then
		Say("Qu鑓 hi謚 ch� c� 琻g kim Thi猲 T� m韎 l藀 頲.")
	else
--		local year, mon, day, hour, min, sec, wday = MakeDateTime(7)
--		if (wday == 0 or wday > 2) then

		if 	NW_GetTask(NW_TASKNO_NATIONALTITLE) ~= 0 then
			Say("B萴 b� h�, qu鑓 hi謚  loan kh緋 b鑞 b� r錳, kh玭g th� s鯽 頲 n鱝.")
		else
			nw_emperororder_inputtitle()
		end
	end
end

-- 天子谕旨/设立国号：弹出输入框
function nw_emperororder_inputtitle()
--	AskClientForString(
--		"nw_oninputnationtitle",
--		"",
--		1,
--		NW_MAXLEN_NATIONTITLE,
--		"请陛下输入国号：")

	Say(
		"Xin m阨 b� h� ch鋘 qu鑓 hi謚",
		5,
		format("%s/#nw_oninputnationtitle(\"%s\")", "KimLong", "KimLong"),
		format("%s/#nw_oninputnationtitle(\"%s\")", "ThanhLong", "ThanhLong"),
		format("%s/#nw_oninputnationtitle(\"%s\")", "B筩hLong", "B筩hLong"),
		format("%s/#nw_oninputnationtitle(\"%s\")", "H醓Long", "H醓Long"),
		format("%s/#nw_oninputnationtitle(\"%s\")", "H綾Long", "H綾Long")
		)
end

-- 天子谕旨/设立国号：回调函数
function nw_oninputnationtitle(title)
	if (NW_IsEmperor() ~= 1) then
		Say("C竎 h� d竚 gi� m筼 琻g kim Thi猲 T�!")
		return
	end
	local len = strlen(title)
	if (len == 0) then
		nw_emperororder_inputtitle()
	elseif (len > NW_MAXLEN_NATIONTITLE) then
		Say("B萴 b� h�! Qu鑓 hi謚 n祔 qu� d礽 r錳, b竎h t輓h kh玭g th� nh� 頲 u.",
			2,
			"Xin m阨 nh藀 l筰/nw_emperororder_inputtitle",
			"в ta suy ngh� th猰/Cancel")
	elseif (NW_CheckText(title) ~= 1) then
		Say("Qu鑓 hi謚 n祔 ph秈 truy襫 mi謓g v� sau, uy danh thi猲 h�,t� h秈 quy ph鬰",
			2,
			"Xin m阨 nh藀 l筰/nw_emperororder_inputtitle",
			"в ta suy ngh� th猰/Cancel")
	else
		local emperor = NW_GetEmperorName()
		AddGlobalCountNews(format("[Thay i chi猽 th轢 Thi猲 T� <color=red>%s<color> thay i qu鑓 hi謚 th祅h \"<color=red>%s<color>\".", emperor, title), 5)
		NW_SetNationTitle(title)
		NW_SetTask(NW_TASKNO_NATIONALTITLE, 1)
		Say("Th莕 l躰h ch�.")
	end
end

--天子谕旨/普天同庆
function nw_emperororder_congratulate()
	if (NW_IsEmperor() ~= 1) then
		Say("L� nghi n ti誴 ph秈 do Thi猲 T� ch� tr�!")
		return
	end
	local time = GetCurServerTime()
	if (time <= NW_GetTask(NW_TASKNO_CONGRATULATION) + SECONDS_ONEWEEK) then
		Say("B� h�, l� nghi qu� nhi襲 s� r蕋 hao t礽 t鑞 c馻 m� kh玭g h頿 l�.")
	else
		Say("B﹜ gi� l� gi� t鑤, b� h� mu鑞 c� h祅h l� nghi?",
			2,
			"Tu﹏ l謓h!/nw_emperororder_congratulate_inputwords",
			"Kh玭g /Cancel")
	end
end

-- 天子谕旨/普天同庆：设定贺词
function nw_emperororder_congratulate_inputwords()
	AskClientForString(
		"nw_emperororder_congratulate_words",
		"",
		1,
		NW_MAXLEN_CONGRATULATIONWORDS,
		"Xin m阨 b� h� vi誸 l阨 ch骳 m鮪g:")
end

-- 天子谕旨/普天同庆：设定贺词
function nw_emperororder_congratulate_words(words)
	if (NW_IsEmperor() ~= 1) then
		Say("C竎 h� d竚 gi� m筼 琻g kim Thi猲 T�!")
		return
	end
	local len = strlen(words)
	if (len == 0) then
		Say("Tai th莕 kh玭g 頲 t鑤 l緈, xin m阨 b� h� n鉯 l筰 th猰 m閠 l莕 n鱝.")
	elseif (len > NW_MAXLEN_CONGRATULATIONWORDS) then
		Say("L阨 ch骳 d礽 qu� s� l祄 b竎h t輓h r蕋 kh� nh�.")
	elseif (NW_CheckText(words) ~= 1) then
		Say("L阨 ch骳 c� t� kh玭g h頿 l� l緈, xin b� h� h穣 suy x衪 l筰.")
	else
		-- 持续30分钟
		NW_OpenCongratulation(words, 30)
		NW_SetTask(NW_TASKNO_CONGRATULATION, GetCurServerTime())
		AddGlobalCountNews(format("[Kh緋 ch鑞 m鮪g vui] s� 頲 ph竧 t筰 k猲h th� gi韎\"<color=red>%s<color>\" ch骳 m鮪g thi猲 t� u s� 頲 phong thng!", words), 10)
		Say("Th莕 l躰h ch� v� s� 甶 thu x誴 ngay l藀 t鴆.")
	end
end

-- 天子谕旨/大赦天下
function nw_emperororder_absolve()
	if (NW_IsEmperor() ~= 1) then
		if (NW_InEmperorTong() ~= 1 or NW_GetDuty() ~= NWPOSITION_MINISTER) then
			Say("Чi x� thi猲 h� l� quy襫 h筺 c馻 Thi猲 �")
			return
		end
	end
	local time = GetCurServerTime()
	if (time <= NW_GetTask(NW_TASKNO_ABSOLVE) + SECONDS_ONEWEEK) then
		Say("B� h� t� bi, kh緋 th� gian u bi誸. Nh璶g lo筰 h譶h ng鬰 n祔 kh玭g th� l醤g l蝟 頲")
	else
		Say("Th莕 l躰h ch�,  x� ph筸 nh﹏ thi猲 h�")
		NW_SetTask(NW_TASKNO_ABSOLVE, time)
		AddGlobalCountNews("[Чi x� thi猲 h筣 T蕋 c� ph筸 nh﹏ nh蕋 th秠 mi詎 t閕, u c� th� i tho筰 v韎 lao u  xin v� nh�.", 3)
	end
end

-- 天子谕旨/募捐
function nw_emperororder_levy()
	if (NW_IsEmperor() ~= 1) then
		Say("Зy l� quy襫 h筺 thi猲 t�")
		return		
	end
	local time = GetCurServerTime()
	if (time <= NW_GetTask(NW_TASKNO_LEVY) + SECONDS_ONEWEEK) then
		Say("B� h�  quy猲 ti襫 m閠 l莕, quy猲 ti襫 th猰 l莕 n鱝 s� g﹜ ai o竔 cho d﹏")
	else
		NW_SetTask(NW_TASKNO_LEVY, time)
		NW_Levy(10000, 80)
		AddGlobalCountNews("[Thi猲 T� quy猲 ti襫] Thi猲 T� c� ch� t蕋 c� th莕 d﹏ quy猲 ti襫, kh玭g ai 頲 ph衟 kh竛g ch�.", 3)
	end
end

-- 天子谕旨/天子诏书
function nw_emperororder_message()
	if (NW_IsEmperor() ~= 1) then
		if (NW_InEmperorTong() ~= 1 or NW_GetDuty() ~= NWPOSITION_MINISTER) then
			Say("Chi誹 th� thi猲 h� l� quy襫 h筺 c馻 Thi猲 �")
			return
		end
	end
	local currtime = GetCurServerTime()
	local tasktime = NW_GetTask(NW_TASKNO_MESSAGETIME)
	if (tasktime ~= 0 and currtime <= tasktime + SECONDS_ONEWEEK and
		NW_GetTask(NW_TASKNO_MESSAGECOUNT) >= NW_MAXCOUNT_MESSAGE) then
		Say("B� h� ph竧 qu� nhi襲 chi誹 th�, b竎h t輓h u kh玭g mu鑞 nghe.")
	else
		nw_emperororder_inputmessage()
	end
end

-- 天子谕旨/天子诏书：输入内容
function nw_emperororder_inputmessage()
	AskClientForString(
		"nw_emperororder_onmessage",
		"",
		NW_MINLEN_MESSAGE,
		NW_MAXLEN_MESSAGE,
		"B� h� h� chi誹 th�:")
end

-- 天子谕旨/天子诏书：内容检查
function nw_emperororder_onmessage(msg)
	local len = strlen(msg)
	if (len < NW_MINLEN_MESSAGE or len > NW_MAXLEN_MESSAGE) then
		Say("Chi誹 th� l� ph竧 ng玭 c馻 Thi猲 T�, ng緉 qu� hay d礽 qu� th� kh玭g th� bi觰 t th竛h �.",
			2,
			"Xin m阨 nh藀 l筰/nw_emperororder_inputmessage",
			"в ta suy ngh� l筰/Cancel")
	elseif (NW_CheckText(msg) ~= 1) then
		Say("Chi誹 th� c� m閠 s� t� kh玭g 鎛, xin b� h� h穣 suy x衪 l筰.",
			2,
			"Xin m阨 nh藀 l筰/nw_emperororder_inputmessage",
			"в ta suy ngh� l筰/Cancel")
	else
		local currtime = GetCurServerTime()
		local tasktime = NW_GetTask(NW_TASKNO_MESSAGETIME)
		local count = 1
		if (tasktime == 0 or currtime > tasktime + SECONDS_ONEWEEK) then
			NW_SetTask(NW_TASKNO_MESSAGETIME, currtime)
			NW_SetTask(NW_TASKNO_MESSAGECOUNT, count)
		else
			count = NW_GetTask(NW_TASKNO_MESSAGECOUNT) + 1
			NW_SetTask(NW_TASKNO_MESSAGECOUNT, count)
		end
		AddGlobalCountNews(format("[Thi猲 T� chi誹 th璢 <color=red>%s<color>", msg), 3)
		Say(format("Th莕  nh� r錳, tu莕 n祔 b� h� c遪 c� th� g鰅 th猰 <color=red>%d<color> l莕", NW_MAXCOUNT_MESSAGE - count))
	end
end

-- 天子谕旨/禁言
function nw_emperororder_forbidtalkdlg()
	if (NW_IsEmperor() ~= 1) then
		Say("C竎 h� d竚 gi� m筼 琻g kim Thi猲 T�!")
		return
	end
	local tasktime = NW_GetTask(NW_TASKNO_FORBIDCHATTIME)
	local currtime = GetCurServerTime()
	if (tasktime ~= 0 and currtime < tasktime + SECONDS_ONEDAY) then
		Say("B� h� v蒼 c遪 產ng gi薾, xin m阨 i m鋓 vi謈 ngu玦 甶 .")
	else
		Say("M芻 d� b� h� c� th� c蕀 n鉯 m閠 ngi, nh璶g l遪g ngi c� th� lu薾 畂竛. Xin b� h� h穣 th薾 tr鋘g khi h祅h s�",
			2,
			"Ta  quy誸 nh r錳/nw_emperororder_forbidtalk",
			"в ta suy ngh� l筰/Cancel")
	end
end

-- 天子谕旨/禁言：弹出输入框
function nw_emperororder_forbidtalk()
	AskClientForString(
		"nw_emperororder_forbidtalk_input",
		"",
		1,
		32,
		"Xin m阨 nh藀 t猲 c莕 c蕀 n鉯:")
end

-- 天子谕旨/禁言：输入玩家名字
function nw_emperororder_forbidtalk_input(name)
	NW_ForbidChat(name, 30)
	local currtime = GetCurServerTime()
	NW_SetTask(NW_TASKNO_FORBIDCHATTIME, currtime)
	AddGlobalCountNews(format("[Chi誹 th� thi猲 h筣\"<color=red>%s<color>\"Ch鋍 gi﹏ Thi猲 T�, c蕀 n鉯 n鯽 gi� th� uy.", name), 3)
	Say(format("Th莕 l躰h ch�: C蕀 n鉯 <color=red>%s<color> trong v遪g n鯽 gi�.", name))
end

-- 民心是杆秤/评议当今天子
function nw_comment_commit()
	Say("C玭g o t� c� t筰 m鏸 ngi, Thi猲 T� tuy quy襫 cao uy nghi猰 nh璶g c騨g kh玭g th� t� l鮝 d鑙 b秐 th﹏.",
		3,
		"T竛 dng Thi猲 T�/nw_comment_celebratedlg",
		"T� c竜 Thi猲 T�/nw_comment_criticizedlg",
		"Kh玭g c� vi謈 g�/Cancel")
end

-- 民心是杆秤/查询评议结果
function nw_comment_query()
	local emperor = NW_GetEmperorName()
	if (emperor == "") then
		Say("Hi謓 t筰 v蒼 ch璦 c� thi猲 t�, b竎h t輓h r蕋 ch� mong m閠 minh qu﹏ th鑞g nh蕋 thi猲 h�")
		return
	end
	local goodness, badness = NW_GetRemark()
	local value = floor(goodness - badness)
	local title = ""
	if (value > 3000) then
		title = "Th竛h Qu﹏"
	elseif (value >= 1001) then
		title = "Minh qu﹏"
	elseif (value >= 101) then
		title = "H鱱 v�"
	elseif (value >= -100) then
		title = "Thanh t辬h"
	elseif (value >= -1000) then
		title = "V� v�"
	elseif (value >= -3000) then
		title = "Dung qu﹏"
	else
		title = "H玭 qu﹏"
	end
	Say(format("Л琻g kim Thi猲 T� l� <color=yellow>%s<color>, thi謓 竎 l� <color=yellow>%d<color>, v� ph輆 <color=yellow>%s<color>.", emperor, value, title))
end

-- 民心是杆秤/评议当今天子/颂扬天子：给予界面
function nw_comment_celebratedlg()
	local emperor = NW_GetEmperorName()
	if (emperor == "") then
		Say("Hi謓 t筰 v蒼 ch璦 c� thi猲 t�, b竎h t輓h r蕋 ch� mong m閠 minh qu﹏ th鑞g nh蕋 thi猲 h�")
		return
	end
	GiveItemUI(
		"T竛 dng Thi猲 T�",
		"Л琻g kim Thi猲 T� anh minh, thng thi謓 l謓h  t竛 dng",
		"nw_comment_celebrate",
		"Cancel")
end

-- 民心是杆秤/评议当今天子/颂扬天子
function nw_comment_celebrate(count)
	local total_count = 0
	for i = 1, count do
		local item = GetGiveItemUnit(i);
		local genre, detail, particular = GetItemProp(item)
		if (genre ~= 6 or detail ~= 1 or particular ~= 197) then
			Say("Ch� c� th� d飊g thng thi謓 l謓h  t竛 dng Thi猲 T�")
			return
		else
			total_count = total_count + GetItemStackCount(item)
		end
	end
	for i = 1, count do
		local item = GetGiveItemUnit(i);
		RemoveItemByIndex(item)
	end
	NW_RemarkEmperor(total_count)
	nw_comment_query()
end

-- 民心是杆秤/评议当今天子/弹劾天子：给予界面
function nw_comment_criticizedlg()
	local emperor = NW_GetEmperorName()
	if (emperor == "") then
		Say("Hi謓 t筰 v蒼 ch璦 c� thi猲 t�, b竎h t輓h r蕋 ch� mong m閠 minh qu﹏ th鑞g nh蕋 thi猲 h�")
		return
	end
	GiveItemUI(
		"T� c竜 Thi猲 T�",
		"Л琻g kim thi猲 t� v� c, ph箃 竎 l謓h  t� c竜",
		"nw_comment_criticize",
		"Cancel")
end

-- 民心是杆秤/评议当今天子/弹劾天子
function nw_comment_criticize(count)
	local total_count = 0
	for i = 1, count do
		local item = GetGiveItemUnit(i);
		local genre, detail, particular = GetItemProp(item)
		if (genre ~= 6 or detail ~= 1 or particular ~= 198) then
			Say("Ch� c� th� d飊g ph箃 竎 l謓h t� c竜 Thi猲 T�")
			return
		else
			total_count = total_count + GetItemStackCount(item)
		end
	end
	for i = 1, count do
		local item = GetGiveItemUnit(i);
		RemoveItemByIndex(item)
	end
	NW_RemarkEmperor(-total_count)
	nw_comment_query()
end

tbHistoryScoreTitle = 
{
    [1] = {nValue = -3000, strTitle = "H玭 qu﹏"},
    [2] = {nValue = -1001, strTitle = "Dung qu﹏"},
    [3] = {nValue = -101, strTitle = "V� v�"},
    [4] = {nValue = 100, strTitle = "Thanh t辬h"},
    [5] = {nValue = 1000, strTitle = "H鱱 v�"},
    [6] = {nValue = 3000, strTitle = "Minh qu﹏"},
    [7] = {nValue = 3000, strTitle = "Th竛h Qu﹏"},
}

tbHistoryCapital = 
{
    [0] = "Bi謓 Kinh",
    [1] = "L﹎ An",
}

function history_page_gen(tb_pageinfo, str_parameter)
    local strContent;
    local tbOption = {"R阨 kh醝/Cancel",};
    local tbContent = {};
    local tbTianzi = {}
	
	for i = tb_pageinfo.from, tb_pageinfo.to do
	    local strGeneration;
	    tbTianzi.szEmperor, _, tbTianzi.szTitle, tbTianzi.szTong, tbTianzi.nBeginTime, tbTianzi.nSide, tbTianzi.nScore, tbTianzi.nEndTime = NW_EmperorHistory(tb_pageinfo.total - i + 1, str_parameter);
	    local strEmperor;
	    local strBeginTime;
	    local strEndTime;
	    local strTitle;
	    local strTong;
	    local strScore;
	    local strCapital;
	    
	    if (tbTianzi.nEndTime == 0) then
	        strGeneration = "Л琻g kim th竛h thng";
	    else
	        strGeneration = format("Thi猲 T� i th� <color=red>%d<color>", tb_pageinfo.total - i + 1);
	    end
	    
	    if(tbTianzi.szEmperor == nil or tbTianzi.szEmperor == "") then
            strEmperor = "V� h� ";
	        strTitle = "V� h� ";
	        strBeginTime = "<color=yellow>V�<color>";
	        strEndTime = "<color=yellow>V�<color>";
	        strTong = "V� h� ";
	        strScore = "V� h� "
	        strCapital = "V� h� "
	    else
	        strEmperor = tbTianzi.szEmperor;
	        strTitle = tbTianzi.szTitle;
	        strBeginTime = format("<color=green>%d<color> n╩ <color=green>%02d<color> th竛g <color=green>%02d<color> ng祔", floor(tbTianzi.nBeginTime/10000), floor(mod(tbTianzi.nBeginTime,10000)/100), mod(tbTianzi.nBeginTime,100));
	        if (tbTianzi.nEndTime == 0) then
	            strEndTime = "<color=yellow>V�<color>";
	        else
	            strEndTime = format("<color=green>%d<color> n╩ <color=green>%02d<color> th竛g <color=green>%02d<color> ng祔", floor(tbTianzi.nEndTime/10000), floor(mod(tbTianzi.nEndTime,10000)/100), mod(tbTianzi.nEndTime,100));
	        end
	        
	        strTong = tbTianzi.szTong;
	        for j = 1, getn(tbHistoryScoreTitle) do
                if ((strScore == nil or strScore == "") and tbTianzi.nScore <= tbHistoryScoreTitle[j].nValue) then
                    strScore = tbHistoryScoreTitle[j].strTitle;
                end
            end
            if (strScore == nil or strScore == "") then
                strScore = tbHistoryScoreTitle[getn(tbHistoryScoreTitle)].strTitle;
            end
            strCapital = tbHistoryCapital[tbTianzi.nSide];
	    end
	    tbContent[getn(tbContent) + 1] = 
        {
            format("%s: <color=yellow>%s<color>", strGeneration, strEmperor),
        }
        tbContent[getn(tbContent) + 1] = 
        {
			format("Qu鑓 hi謚: <color=yellow>%s<color>", strTitle),
        }
        tbContent[getn(tbContent) + 1] = 
        {
            format("Жng quang: %s", strBeginTime),
        }   
        tbContent[getn(tbContent) + 1] = 
        {
			format("Bang h閕: <color=yellow>%s<color>", strTong),
        }      
        tbContent[getn(tbContent) + 1] = 
        {
            format("Tho竔 v�: %s", strEndTime),
        }
        tbContent[getn(tbContent) + 1] = 
        {
            format("Ho祅g th祅h: <color=yellow>%s<color>", strCapital),
        }
        tbContent[getn(tbContent) + 1] = 
        {
            format("Ngi i nh gi�: <color=yellow>%s<color>", strScore),
        }
        tbContent[getn(tbContent) + 1] = 
        {
            "--------------------------------------------",
        }
	end
   
    local var_width = {50}
    local var_align = 1
	
	strContent = maketable(tbContent, var_width, var_align);
	
    return strContent, tbOption;
end
-- 铁笔直书/天子史记
function nw_history_emperor()
	saypage(NW_EmperorHistoryCount(), 3, "history_page_gen", -1);
end

-- 铁笔直书/宋国史记
function nw_history_song()
	saypage(NW_EmperorHistoryCount(1), 3, "history_page_gen", 1);
end

-- 铁笔直书/金国史记
function nw_history_jin()
	saypage(NW_EmperorHistoryCount(0), 3, "history_page_gen", 0);
end

-- 国王诏书/分封大臣
function nw_kingorder_instate()
	Say("Xin h穣 b� v� mi詎 nhi謒 i th莕 t筰 giao di謓 bang h閕")
end

-- 国王诏书/调整税率对话
function nw_kingorder_taxdlg()
	city = GetCityArea()
	tong, master = GetCityOwner(city)
	if ((city ~= CITYIDX_LINAN and city ~= CITYIDX_BIANJING) or master ~= GetName()) then
		Say("t nh thu� su蕋 kinh th祅h l� c quy襫 c馻 qu鑓 ch�.")
		return
	end
	Say("B� h� c� mu鑞 t thu� su蕋 m韎 kh玭g?",
		2,
		"Tu﹏ l謓h!/nw_kingorder_tax",
		"Kh玭g /Cancel")
end

-- 国王诏书/调整税率对话
function nw_kingorder_tax()
	city = GetCityArea()
	OpenCityManageUI(city)
end

function VnEmperorNewAward()	
	local nWeek = tonumber(GetLocalDate("%w"));	 
	local nTime = tonumber(GetLocalDate("%H%M%S"));
	local nHour = tonumber(GetLocalDate("%H"));		
	city = GetCityArea()
	if (city ~= CITYIDX_LINAN and city ~= CITYIDX_BIANJING) then
		Say("N琲 y l� n祇 kh玭g thu閏 khu v鵦 t鑞g kim?")
		return
	elseif (NW_IsEmperor() ~= 1) then
		Say("<color=red>Ph莕 thng c馻 thi猲 t�<color> ch� c� th� Thi猲 T� m韎 nh薾 頲, ngi l� ai m� d竚 m筼 danh Thi猲 T�!")
		return
	elseif (NW_GetTask(NW_TASKNO_GETEMPIRERING) ~= 0) then
		Say("B� h�  nh薾 thng r錳.")
		return
	elseif (nWeek == 1 and nTime >= 120000 and nTime <= 223000) then
		Say("Chi課 s� c蕄 b竜, xin m阨 b� h� chu萵 b� ngh猲h chi課.")
		return				
	end	
	if CountFreeRoomByWH(3, 3) < 1 then
		Talk(1, "", "в b秓 m t礽 s秐 c馻 i hi謕, xin h穣  tr鑞g 1 3x3 h祅h trang")
		return
	end
	NW_SetTask(NW_TASKNO_GETEMPIRERING, 1)
	if NW_GetTask(NW_TASKNO_GETEMPIRERING) ~= 1 then
		return
	end
	VnEmperorGiveAward()
end

function VnEmperorGiveAward()
	local tbNewAward = {
		["VoDanhGioiChi"] = {
			{tbProp={0,3621},nCount=1,nQuality = 1,nBindState=-2,nExpiredTime=10080},
			{tbProp={0,3622},nCount=1,nQuality = 1,nBindState=-2,nExpiredTime=10080},
			{tbProp={0,3623},nCount=1,nQuality = 1,nBindState=-2,nExpiredTime=10080},
			{tbProp={0,3624},nCount=1,nQuality = 1,nBindState=-2,nExpiredTime=10080},
			{tbProp={0,3625},nCount=1,nQuality = 1,nBindState=-2,nExpiredTime=10080},
			{tbProp={0,3626},nCount=1,nQuality = 1,nBindState=-2,nExpiredTime=10080},
			{tbProp={0,3627},nCount=1,nQuality = 1,nBindState=-2,nExpiredTime=10080},
			{tbProp={0,3628},nCount=1,nQuality = 1,nBindState=-2,nExpiredTime=10080},
			{tbProp={0,3629},nCount=1,nQuality = 1,nBindState=-2,nExpiredTime=10080},
			{tbProp={0,3630},nCount=1,nQuality = 1,nBindState=-2,nExpiredTime=10080},
			{tbProp={0,3631},nCount=1,nQuality = 1,nBindState=-2,nExpiredTime=10080},
			{tbProp={0,3632},nCount=1,nQuality = 1,nBindState=-2,nExpiredTime=10080},
			{tbProp={0,3633},nCount=1,nQuality = 1,nBindState=-2,nExpiredTime=10080},
			{tbProp={0,3634},nCount=1,nQuality = 1,nBindState=-2,nExpiredTime=10080},
			{tbProp={0,3635},nCount=1,nQuality = 1,nBindState=-2,nExpiredTime=10080},
		},
		["VoDanhChiHoan"] = {
			{tbProp={0,3636},nCount=1,nQuality = 1,nBindState=-2,nExpiredTime=10080},
			{tbProp={0,3637},nCount=1,nQuality = 1,nBindState=-2,nExpiredTime=10080},
			{tbProp={0,3638},nCount=1,nQuality = 1,nBindState=-2,nExpiredTime=10080},
			{tbProp={0,3639},nCount=1,nQuality = 1,nBindState=-2,nExpiredTime=10080},
			{tbProp={0,3640},nCount=1,nQuality = 1,nBindState=-2,nExpiredTime=10080},
			{tbProp={0,3641},nCount=1,nQuality = 1,nBindState=-2,nExpiredTime=10080},
			{tbProp={0,3642},nCount=1,nQuality = 1,nBindState=-2,nExpiredTime=10080},
			{tbProp={0,3643},nCount=1,nQuality = 1,nBindState=-2,nExpiredTime=10080},
			{tbProp={0,3644},nCount=1,nQuality = 1,nBindState=-2,nExpiredTime=10080},
			{tbProp={0,3645},nCount=1,nQuality = 1,nBindState=-2,nExpiredTime=10080},
			{tbProp={0,3646},nCount=1,nQuality = 1,nBindState=-2,nExpiredTime=10080},
			{tbProp={0,3647},nCount=1,nQuality = 1,nBindState=-2,nExpiredTime=10080},
			{tbProp={0,3648},nCount=1,nQuality = 1,nBindState=-2,nExpiredTime=10080},
			{tbProp={0,3649},nCount=1,nQuality = 1,nBindState=-2,nExpiredTime=10080},
			{tbProp={0,3650},nCount=1,nQuality = 1,nBindState=-2,nExpiredTime=10080},
		},
	}
	local tbHorseAward = {szName="Phong V﹏ Chi課 M�",tbProp={0,10,20,1,0,0},nCount=1,nExpiredTime=10080, nBindState = -2}
	local nRand1 = random(1, 15)
	local nRand2 = random(1, 15)
	local tbFinalAward = {
		[1] = tbNewAward["VoDanhGioiChi"][nRand1],
		[2] = tbNewAward["VoDanhChiHoan"][nRand2],
		[3] = tbHorseAward,
	}
	tbAwardTemplet:Give(tbFinalAward, 1, {"ThienTu","NhanPhanThuongThienTu"})
end