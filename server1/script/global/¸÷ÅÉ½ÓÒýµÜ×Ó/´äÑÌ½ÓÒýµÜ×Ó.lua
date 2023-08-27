-- 各门派接引弟子脚本　翠烟门
-- By: Dan_Deng(2003-10-27)
-- Update: Dan_Deng(2004-05-25) 体服技能全开修改（调用外部文件方式）
Include("\\script\\task\\newtask\\newtask_head.lua")
Include("\\script\\task\\newtask\\education\\knowmagic.lua")
Include("\\script\\global\\skills_table.lua")
Include("\\script\\global\\map_helper.lua")
Include( "\\script\\missions\\freshman_match\\head.lua" )
npc_name = "Th髖 Y猲 Hoa S� "

function default_talk()
	player_Faction = GetFaction()
	Uworld1000 = nt_getTask(1000)
	if (( Uworld1000 == 240 ) or ( Uworld1000 == 250 )) and ( GetLastFactionNumber() == 5 ) then
			nt_setTask(1000,250)
			Talk(1,"Uworld1000_jiaoyucuiyan","Ngi  l�  t� c馻 b鎛 ph竔, kh玭g c莕 ph秈 甶, c� th� g苝 tr鵦 ti誴 Long Ng� n鉯 chuy謓.")
	elseif (player_Faction == "cuiyan") then		-- 本门
		Say("Mu閕 l筰 l衝 甶 ch琲 n鱝 �?",4,"Uhm! Phi襫 t� t� a mu閕 v�!/return_yes","T譵 hi觰 khu v鵦 luy謓 c玭g/map_help","T譵 hi觰 v� ngh� b鎛 m玭/skill_help","T� c� gi� v� nh� kh玭g th蕐 mu閕 l� 頲 r錳!/no")
	elseif (player_Faction == "emei") then				
		Talk(1,"","Xinh p nh� hoa ti m� h籲g ng祔 c� i di謓 v韎 Thanh Жng C� Ph藅!  Ta kh玭g th輈h c竎 ngi � 甶觤 n祔! ")
	elseif (player_Faction == "tangmen") then
		Talk(1,"","Hai ph竔 ch髇g ta li猲 minh l筰, kh玭g c莕 ph秈 ph﹏ tranh n鱝! Ch糿g ph秈 l� h� s� �?")
	elseif (player_Faction == "wudu") then
		Talk(1,"","Ta gh衪 nh蕋 l� c竔 b鋘 len l衝 h� c h筰 ngi!  蕐!  Kh玭g ph秈 ta n鉯 ngi! ")
	elseif (player_Faction == "tianwang") then
		Talk(1,"","Dng H� c馻 Thi猲 Vng bang c竎 ngi c遪 k衜 xa t� t� c馻 ta, thi猲 h� nam nh﹏ qu� nhi猲 ch糿g ra g� h誸! ")
	elseif (player_Faction == "shaolin") then
		Talk(1,"","H遖 thng u tr鋍 sao l筰 n n琲 c馻 c竎 n� nhi th� n祔?! ")
	elseif (player_Faction == "wudang") then
		Talk(1,"","Qu� m玭 l蕐 hi謕 ngh躠 l祄 tr鋘g, nh璶g kh玭g bi誸 Кn T� Nam c� bi誸 h� th裯 hay kh玭g m� c� b竚 theo c竎 s� t� xinh p c馻 ch髇g ta")
	elseif (player_Faction == "kunlun") then
		Talk(1,"","C玭 L玭 ph竔 ph竧 tri觧 th莕 t鑓! Ti觰 n� r蕋 ngng m�! ")
	elseif (player_Faction == "tianren") then
		Talk(1,"","Ai l祄 ho祅g  th� c騨g m芻!  Nh璶g c竎 ngi t祅 s竧 sinh linh th� b鎛 c� nng kh玭g b� qua! ")
	elseif (player_Faction == "gaibang") then
		Talk(2,"","Чi hi謕!  ng qua y! ","�! B� ch衪!!! ")
	elseif (nt_getTask(75) == 255) then		-- 学了野球拳的，不允许再入门派
		Talk(1,"","T� h鋍 kh� luy謓!  T筰 h� v� c飊g b閕 ph鬰! ")
	else						-- 只要不属于10个门派，不再单独检测“无门派”
		UTask_cy = nt_getTask(6)
--		if (GetSeries() == 2) and (GetCamp() == 4) and (GetLevel() >= 50) and (UTask_cy < 5*256) and (nt_getTask(1) == 70*256) then		-- 转门派任务启动
--			Say("翠烟花使：如花般的女子，偏要日日面对青灯古佛，何必呢。哪象我们翠烟门下，天天欢声笑语，那才是我们真正应该拥有的日子呀。",2,"有道理，那么我想改投翠烟该怎么办呢？/defection_get","青灯古佛本我所愿，姐姐不必多言/no")
		if ((UTask_cy > 5*256) and (UTask_cy < 10*256)) then		-- 入门任务中
			Talk(1,"","Mu閕 ti誴 nh薾 nhi謒 v� nh藀 m玭  l﹗ v蒼 ch璦 ho祅 th祅h! Ch� c莕 th玭g qua kh秓 nghi謒 Hoa Kh玦 tr薾 th� ch髇g ta s� l� t� mu閕 t鑤")
		elseif (UTask_cy >= 70*256) and (player_Faction ~= "cuiyan") then					--已经出师
			Say("T� t� t筰 sao xu蕋 s� v藋!  C� � y t� t筰 ch糿g ph秈 vui v� l緈 sao!?",3,"T譵 hi觰 s� trng luy謓 c玭g/map_help","T譵 hi觰 v� ngh� b鎛 m玭/skill_help","K誸 th骳 i tho筰/no")
		else
			Talk(1,"enroll_select","Th髖 Y猲 m玭 ch髇g ta tuy to祅 l� n�, nh璶g v� ngh� l蕐 'Khinh, Kho竔, K�, M�' m� n鎖 ti課g giang h�. T� mu閕 t� t﹎!  Trong giang h� kh玭g ai d竚 coi khinh")
		end
	end
end;

function defection_get()
	Talk(1,"","Ch� c莕 mu閕 n th豱h c莡 Thanh Hi觰 S� Th竔 xin chuy觧 qua Th髖 Y猲 m玭, sau  n tr譶h ki課 v韎 Do穘 H祄 Y猲 chng m玭 c馻 ta th� c� th� 頲!  Y猲 t﹎!  Thanh Hi觰 S� Th竔 th玭g t譶h t l�, s� kh玭g l祄 kh� mu閕 u! ")
	nt_setTask(6,5*256+10)
	Msg2Player("Mu鑞 gia nh藀 Th髖 Y猲 m玭, ch� c莕 n xin ph衟 Thanh Hi觰 S� Th竔 sau  n tr譶h ki課 v韎 Do穘 H祄 Y猲 l� 頲!")
	AddNote("Mu鑞 gia nh藀 Th髖 Y猲 m玭, ch� c莕 n xin ph衟 Thanh Hi觰 S� Th竔 sau  n tr譶h ki課 v韎 Do穘 H祄 Y猲 l� 頲!")
end

function enroll_select()
	UTask_em = nt_getTask(1)
	UTask_cy = nt_getTask(6)
	if ((UTask_em > 5*256) and (UTask_em < 10*256)) then		-- 已接了翠烟入门任务
		Talk(1,"","L筰 c� th猰 1 ngi mu鑞 n c莡 kinh ni謒 ph藅! Th藅 l� ng ti誧! ")
	elseif (GetSeries() == 2) and (GetCamp() == 0) and (UTask_em < 5*256) and (UTask_cy < 5*256) then		--水系、未入峨嵋翠烟
		if (GetLevel() >= 10) then						--等级达到十级
			Say("Mu閕 c� mu鑞 gia nh藀 Th髖 Y猲 m玭 c馻 ch髇g ta kh玭g?", 3, "Gia nh藀 Th髖 Y猲 M玭/go", "в ta suy ngh� k� l筰 xem/no","T譵 hi觰 tinh hoa v� ngh� c竎 m玭 ph竔/Uworld1000_knowmagic")
		else
			Talk(1,"","Trc ti猲 mu閕 h穣 luy謓 t藀 l筰 c╪ b秐, t n <color=Red>c蕄 10<color> ch髇g ta s� l� t� mu閕 1 nh�! ")
		end
	end		-- 不是水系的就不再多说话了。
end;

function go()
	Uworld1000 = nt_getTask(1000)
	if ( Uworld1000 == 240 ) or ( Uworld1000 == 250 ) then
		nt_setTask(1000,260)
	end
	SetRevPos(154,61)		  				-- 重生点
	nt_setTask(6,10*256)						-- 直接入门
	SetFaction("cuiyan")      			--玩家加入峨嵋派
	SetCamp(3)
	SetCurCamp(3)
	SetRank(31)
	nt_setTask(137,66)
	SetLastFactionNumber(5)
-- 直接处理流程
--	nt_setTask(6,80*256)
--	SetRank(67)
--	Msg2Player("欢迎你加入翠烟门，测试中直接学会本门所有技能。")
	add_cy(GetLevel())			-- 调用skills_table.lua中的函数，参数为学到多少级技能。
-- 结束
	Msg2Player("Hoan ngh猲h b筺 gia nh藀 Th髖 Y猲 m玭! Tr� th祅h Hoa T�. H鋍頲 Phong Hoa Tuy誸 Nguy謙, Phong Quy觧 T祅 Tuy誸")
	AddNote("gia nh藀 Th髖 Y猲 m玭, tr� th祅h Hoa T� ")
	Msg2Faction("cuiyan",GetName().."t� h玬 nay gia nh藀 Th髖 Y猲 m玭. Xin b竔 ki課 c竎 v� s� t�. Mong c竎 v� quan t﹎ ch� gi竜!",GetName())
---off--	NewWorld(154, 403, 1361)			-- 传到门派中

end;

function return_yes()
	NewWorld(154, 403, 1361)			-- 传到门派中
end;

function cy_check_yes()					-- 由峨嵋改来。。。尚未相应更新
	if (GetSeries() ~= 2) then
		Talk(1,"","Ng� h祅h c馻 ngi kh竎 v韎 b鋘 ta!  дn y l祄 g�? H穣 l猲 di詎 n h鋍 h醝 th猰!")
	elseif (HaveMagic(91) >= 0) then		-- 做完了50级任务,佛光普照
		nt_setTask(1,60*256)
		Talk(1,"","Ta  ch豱h l� l筰 tr筺g th竔 nhi謒 v� c馻 ngi. Ngi  c� th� 甶 nh薾 nhi謒 v� xu蕋 s�.")
	elseif (HaveMagic(88) >= 0) then		-- 做完了40级任务,不灭不绝
		nt_setTask(1,50*256)
		Talk(1,"","Ta  ch豱h l� l筰 tr筺g th竔 nhi謒 v� c馻 ngi. Ngi  ho祅 th祅h nhi謒 v� c蕄 40.")
	elseif (HaveMagic(85) >= 0) then		-- 做完了30级任务,一叶知秋
		nt_setTask(1,40*256)
		Talk(1,"","Ta  ch豱h l� l筰 tr筺g th竔 nhi謒 v� c馻 ngi. Ngi  ho祅 th祅h nhi謒 v� c蕄 30.")
	elseif (HaveMagic(82) >= 0) then		-- 做完了20级任务,四象同归
		nt_setTask(1,30*256)
		Talk(1,"","Ta  ch豱h l� l筰 tr筺g th竔 nhi謒 v� c馻 ngi. Ngi  ho祅 th祅h nhi謒 v� c蕄 20.")
	elseif (HaveMagic(77) >= 0) then		-- 做完了10级任务,峨眉剑法
		nt_setTask(1,20*256)
		Talk(1,"","Ta  ch豱h l� l筰 tr筺g th竔 nhi謒 v� c馻 ngi. Ngi  ho祅 th祅h nhi謒 v� c蕄 10.")
	else
		nt_setTask(1,10*256)
		Talk(1,"","Ta  ch豱h l� l筰 tr筺g th竔 nhi謒 v� c馻 ngi. Ngi  c� th� nh薾 nhi謒 v� c蕄 10.")
	end
end;

function cy_check_no()
	Say("Mu閕 l筰 l衝 甶 ch琲 n鱝 �?",2,"Uhm! Phi襫 t� t� a mu閕 v�!/return_yes","T� c� gi� v� nh� kh玭g th蕐 mu閕 l� 頲 r錳!/no")
end

function Uworld1000_jiaoyucuiyan()
	nt_setTask(1000,260)
	Msg2Player("е t� ti誴 d蒼 Th髖 Y猲 m玭 b秓 b筺 c� th� tr鵦 ti誴 甶 g苝 Long Ng� n鉯 chuy謓.")
end

function no()
end;
