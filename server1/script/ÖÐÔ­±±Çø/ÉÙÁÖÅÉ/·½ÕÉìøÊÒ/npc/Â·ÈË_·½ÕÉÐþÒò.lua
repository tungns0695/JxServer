-- 少林 路人NPC 方丈玄因 10级任务、40级任务
-- by：Dan_Deng(2003-08-01)
-- Update：Dan_Deng(2003-10-27)重写重返师门任务，并重新整理脚本

Include("\\script\\global\\skills_table.lua")
Include([[\script\event\teachersday06_v\prize_qingyika.lua]]);
Include("\\script\\task\\lv120skill\\head.lua")
Include("\\script\\misc\\daiyitoushi\\toushi_function.lua")	-- 带艺投师

Include("\\script\\task\\150skilltask\\g_task.lua")
Include("\\script\\dailogsys\\g_dialog.lua")

function main()
	if (vt06_isactive() ~= 0) then
		Say("T譵 ta c� vi謈 g�?", 2, "Mu鑞 th豱h gi竜 i s�!/oldentence", "M鮪g l�  S�, t筰 h�  t譵  揟h�  S瓟 v� 揟h� Cao у�./vt06_prizeenter");
		return
	end;
	
	local nNpcIndex = GetLastDiagNpc();
	local nCurDate = tonumber(GetLocalDate("%Y%m%d%H%M"))
	local szNpcName = GetNpcName(nNpcIndex)
	if NpcName2Replace then
		szNpcName = NpcName2Replace(szNpcName)
	end
	local tbDailog = DailogClass:new(szNpcName)
	tbDailog.szTitleMsg = "<npc>G莕 y ta c� r蕋 nhi襲 vi謈 gi秈 quy誸, ngi n y c� vi謈 g�."
	G_TASK:OnMessage("Thi誹 L﹎", tbDailog, "DialogWithNpc")
	if (GetLevel() >= 120 and GetTask(LV120_SKILL_STATE) ~= 19 and GetLastFactionNumber() == 0) then
		tbDailog:AddOptEntry("H鋍 k� n╪g c蕄 120.", lvl120skill_learn)
	end
	tbDailog:AddOptEntry("Mu鑞 th豱h gi竜 vi謈 kh竎", oldentence)
	tbDailog:Show() 
end

function oldentence()

	local UTask_sl = GetTask(7)
	local nFactID = GetLastFactionNumber();
	
	if (UTask_sl == 70*256) and (GetFaction() == "shaolin") then			-- 回师错误修正
		SetFaction("")
		Say("H� th鑞g ph竧 hi謓 sai s鉻,  k辮 th阨 h錳 phuc!",0)
		return
	elseif (UTask_sl == 70*256) and (GetTask(3) >= 5*256) and (GetTask(3) < 10*256) then		-- 以前接过入门任务的
		SetTask(3,0)
		Say("H� th鑞g ph竧 hi謓 sai s鉻,  k辮 th阨 h錳 phuc!",0)
		return
	elseif (UTask_sl == 80*256) and (GetCamp() == 4) then			-- 回师错误修正
		SetTask(7,70*256)
		Say("H� th鑞g ph竧 hi謓 sai s鉻,  k辮 th阨 h錳 phuc!",0)
		return
	elseif (GetTask(3) == 70*256) and (GetTask(7) == 70*256) then			-- 转门派错误修正
		SetTask(3,75*256)
		Say("H� th鑞g ph竧 hi謓 sai s鉻,  k辮 th阨 h錳 phuc!",0)
		return
	elseif (UTask_sl == 80*256 and nFactID == 0 and GetCamp() == 1 and GetFaction() == "M韎 nh藀 giang h� ") then
		 local _, nTongID = GetTong();
		 if (nTongID == 0) then
			SetFaction("shaolin");
			Say("H� th鑞g ph竧 hi謓 sai s鉻,  k辮 th阨 h錳 phuc!",0)
			return
		end
	elseif (UTask_sl == 70*256 and nFactID == 0 and GetCamp() ~= 4 and GetFaction() == "M韎 nh藀 giang h� ") then
		 local _, nTongID = GetTong();
		 if (nTongID == 0) then
			SetFaction("");
			SetCurCamp(GetCamp());
			Say("H� th鑞g ph竧 hi謓 sai s鉻,  k辮 th阨 h錳 phuc!",0)
			return
		end
	end
	
	local tbDes = {"Цi ngh� u s�/#daiyitoushi_main(0)", "Mu鑞 th豱h gi竜 vi謈 kh竎/common_talk"};
	
	Say("G莕 y ta c� r蕋 nhi襲 vi謈 gi秈 quy誸, ngi n y c� vi謈 g�.", getn(tbDes), tbDes);
end

function common_talk()
	local UTask_sl = GetTask(7)
	if (GetTask(39) == 10) and (GetBit(GetTask(40),7) == 0) then				-- 世界任务：武林向背
		Talk(1,"","чc C� Minh ch�  c� h飊g t礽 ch� l韓 th� n祔, l穙 n筽 y nh蕋 nh nghe theo. Ch� l� b鎛 t� 產ng l﹎ v祇 c秐h b� trong tay ngi Kim, l穙 n筽 kh玭g th� kh玭g m祅g n t輓h m筺g c竎 ch髇g t╪g trong ch颽, kh玭g d竚 t飝 ti謓 h祅h s�. Phi襫 anh v� n鉯 v韎 чc C� Minh ch� l穙 n筽 y xin kht t�.")
		Uworld40 = SetBit(GetTask(40),7,1)
		SetTask(40,Uworld40)
	elseif (GetSeries() == 0) and (GetFaction() == "shaolin") then
		if (UTask_sl == 10*256+10) and (HaveItem(26) == 1) then
			L10_prise()
		elseif ((UTask_sl == 10*256) and (GetLevel() >= 10)) then		--10级任务启动
			Say("A Di У Ph藅! T蕋 c�  t� nh藀 m玭 u ph秈 qua kh秓 nghi謒, ngi  chu萵 b� xong ch璦?",2,"Ta  s絥 s祅g!/L10_get_yes","Ta ch璦 s絥 s祅g!/L10_get_no")
		elseif (UTask_sl == 40*256+50) then		-- 40级任务进行中
			SetTaskTemp(43,0)		-- 临时变量43,计数回答正确的话
			Talk(1,"L40_sele3_1","Hai v� S� th骳 t� nh�  t� 甧m n╩ c﹗ n祔 chuy觧 l阨 cho Chng m玭, n鉯 t﹎ � c馻 hai ngi  n籱 trong n╩ c﹗ n鉯 n祔:")
		elseif ((UTask_sl == 40*256) and (GetLevel() >= 40)) then		--40级任务启动
			Say("S� th骳 t� b鎛 m玭 T辌h Di謙 hai ngi v� c玭g  t n c秐h gi韎 thng th鮝, nh璶g do n╩ x璦 hai v� v� mu鑞 tr竛h n� s� c蕌 x� tranh gi祅h trong b鎛 ph竔,  v祇 m藅 th蕋 ph輆 sau n骾 b� quan kh玭g bc ch﹏ ra, gi� y thi猲 h� i lo筰, Trung Nguy猲 nguy hi觤 b鑞 b�, vi s� y mu鑞 nh� ngi th豱h hai v� S� th骳 t� ra t譵 c竎h h鉧 gi秈, ngi ng � 甶 m阨 h� ra kh玭g?",2,"уng �!/L40_get_yes","е t� n╪g l鵦 y誹 k衜, e kh玭g g竛h v竎 頲 /no")
		elseif (UTask_sl == 80*256) or (UTask_sl == 80) then						-- 重返后的自由出入，以及技能调整检查判断
			check_skill()
		else
			Talk(1,"","T鑤! T鑤! C� g緉g l猲! Ph藅 T� s� ph� h� cho ngi .")
		end
--	elseif (UTask_sl == 5*256+20) then			-- 转门派完成
--		Talk(1,"defection_complete","玄因方丈：阿弥陀佛，既入空门，就好好收拾心情钻研藏经阁内典籍，不要再去挂虑战场厮杀，国恨家仇了。")
	elseif (GetSeries() == 0) and (GetCamp() == 4) and (GetLevel() >= 60) and (UTask_sl == 70*256) and ((GetTask(3) < 5*256) or (GetTask(3) == 75*256)) then		-- 重返师门任务
		Talk(1,"return_sele","S� ph�,  t� c� th� mn kinh 甶觧 trong T祅g Kinh C竎 頲 kh玭g v藋?")
	elseif (GetCamp() == 4) and ((UTask_sl == 70*256+10) or (UTask_sl == 70*256+20)) then		-- 重返师门任务中
		Say("5 v筺 lng  chu萵 b� xong ch璦?",2,"Х chu萵 b� xong/return_complete","V蒼 ch璦 chu萵 b� xong/return_uncompleted")
--	elseif (GetTask(3) == 70*256+10) and (HaveMagic(21) >= 0) then		-- 少林派重返门派，收回金钟罩
--		Say("玄因方丈：天王帮与金兵战火正酣，你若投入天王帮，恐金兵以此向本寺启衅。",2,"为免师父烦恼，请收回弟子名号/defection_yes","弟子考虑未周，请师父原谅/no")
	else							-- 常规对话
		Talk(1,"","цi v韎 t╪g nh﹏ trong ch颽 Thi誹 L﹎ m� n鉯, c玭g phu l� s� tu h祅h, s� t鋋 thi襫. M鬰 ch luy謓 c玭g c馻 ch髇g ta l� mu鑞 thay i t� ch蕋 c馻 m閠 ngi, c竎 t╪g nh﹏ luy謓 v� trong Thi誹 L﹎ ch輓h l� tu h祅h y.")
	end
end;
---------------------- 技能调整相关 ------------------------
function check_skill()
--	if (HaveMagic(273) == -1) then
--		AddMagic(273)					-- 如来千叶手
--		Msg2Player("你学会了“如来千叶手”")
--		Say("玄因方丈：为师这次闭关苦思数日，新创了一招“如来千叶手”，现在传授于你。你学完后先回去好好休息一番，以免伤到经脉。",1,"多谢师父/KickOutSelf")
--	else
		Say("Kh� Thi猲 Tu B蕋 T薾, Nh蕋 Phi課 Du T� T﹎. Gi� ngi  tr� th祅h ngi trong giang h� r錳 n誹 mu鑞 xu鑞g n骾 th� h穣 甶 甶!",2,"Ч t� phng Trng ﹏ chu萵 /goff_yes","е t� kh玭g d竚 l祄 x籲g l祄 b藋 /no")
--	end
end
--------------------- 转门派相关 ------------------------
function defection_complete()
	Msg2Player("Hoan ngh猲h b筺 gia nh藀 Thi誹 L﹎ ph竔, tr� th祅h T秓 мa T╪g. ")
	SetRevPos(103,51)		  			--设置重生点
	SetTask(7,10*256)					-- 入门
	SetFaction("shaolin")       	--玩家加入门派
	SetCamp(1)
	SetCurCamp(1)
	SetRank(1)
	AddMagic(10)
	Msg2Player("H鋍 頲 Kim Cang Ph鬰 Ma. ")
	AddNote("Gia nh藀 Thi誹 L﹎ ph竔, tr� th祅h T秓 мa T╪g, h鋍 頲 Kim Cang Ph鬰 Ma. ")
	Msg2Faction("shaolin",GetName().." t� Thi猲 Vng bang n gia nh藀 Thi誹 L﹎ ph竔. L鵦 lng b鎛 ph竔  m筺h l筰 c祅g m筺h!",GetName())
end

---------------------- 重返门派相关 --------------------------
function goff_yes()
	Talk(1,"","H錸g Tr莕 V鋘g B蕋 Xuy猲, Ph﹏ Tranh K� Th阨 ёnh.  甶! Nh璶g nh� l蕐 xu鑞g n骾 v蒼 ph秈 gi� l遪g t� bi y.")
	SetTask(7,70*256)
	AddNote("R阨 kh醝 Thi誹 L﹎ t�, xu鑞g n骾 ti誴 t鬰 h祅h t萿 giang h�. ")
	Msg2Player("R阨 kh醝 Thi誹 L﹎ t�, xu鑞g n骾 ti誴 t鬰 h祅h t萿 giang h�. ")
	SetFaction("")
	SetCamp(4)
	SetCurCamp(4)
end

function return_sele()
	Say("Xu蕋 s� xong  kh玭g c遪 l�  t� Thi誹 L﹎, 琻g nhi猲 l� kh玭g 頲 r錳. Nh璶g n誹 mu鑞 tham kh秓 Ph藅 l� th� Thi誹 L﹎ lu玭 r閚g m� n ngi tr飊g ph秐 m玭 ph竔.",2,"Ta mu鑞 quay l筰 Thi誹 L﹎ /return_yes","Kh玭g c莕 u/no")
end;

function return_yes()
	Talk(1,"","Tng Ph藅 l﹗ ng祔 kh玭g tu s鯽 n猲 c� ph莕 h� h筰, n誹 nh� ngi h鉧 duy猲 cho b鎛 t� 50000 lng th� c� th� tr飊g ph秐 Thi誹 L﹎..")
	SetTask(7,70*256+20)
	AddNote("N閜 50000 lng b筩  quay l筰 Thi誹 L﹎ ")
	Msg2Player("N閜 50000 lng b筩  quay l筰 Thi誹 L﹎ ")
end;

function return_complete()
	if(GetCash() >= 50000) then								-- 有50000两
		Talk(1,"","R蕋 t鑤! C╪ c� theo s� ng g鉷 c馻 ngi cho b鎛 t�, 頲 vinh h筺h nh薾 ch鴆 danh H� Ph竝 Trng l穙.")
		Pay(50000)
		SetTask(7,80*256)
		SetFaction("shaolin")
		SetCamp(1)
		SetCurCamp(1)
		SetRank(72)
--		if (HaveMagic(273) == -1) then
--			AddMagic(273)
--			AddMagic(21)
		add_sl(70)			-- 调用skills_table.lua中的函数，参数为学到多少级技能。
		Msg2Player("B筺 h鋍 頲 tuy謙 h鋍 tr蕁 Thi誹 L﹎ ph竔 Nh� Lai Thi猲 Di謕, v� c玭g D辌h C﹏ Kinh. ")
--		end
		AddNote("Х quay tr� l筰 Thi誹 L﹎ ph竔. ")
		Msg2Faction(GetName().."  tr� l筰 Thi誹 L﹎, 頲 phong l�: H� Ph竝 Trng l穙 ")
	else
		Talk(1,"","A Di У Ph藅, h譶h nh� kh玭g  5 v筺 lng th� ph秈.")
	end
end;

------------------------- 门派任务相关 --------------------------------
function L10_get_yes()
	Talk(1, "", "Ch� c莕 ngi thu薾 l頸 l蕐 頲 Kim Li猲 hoa trong h蟤 M閏 Nh﹏ th� c� th� th玭g qua kh秓 nghi謒")
	DelItem(26)
	SetTask(7,10*256+10)
	AddNote("Ti誴 nh薾 th� th竎h c馻 Thi誹 L﹎ ph竔: l蕐 Kim Li猲 Hoa t� M閏 Nh﹏ H筺g. ")
	Msg2Player("Ti誴 nh薾 th� th竎h c馻 Thi誹 L﹎ ph竔: l蕐 Kim Li猲 Hoa t� M閏 Nh﹏ H筺g. ")
end;

function L10_get_no()
end;

function L10_prise()
	Talk(1,"","R蕋 t鑤! Ngi 頲 th╪g l祄 H� Vi謓 V� T╪g.")
	DelItem(26)
	SetTask(7,20*256)
	SetRank(2)
--	AddMagic(8)
--	AddMagic(4)
--	AddMagic(6)
	add_sl(20)			-- 调用skills_table.lua中的函数，参数为学到多少级技能。
	AddNote("L蕐 頲 Kim Li猲 Hoa, tr� l筰 g苝 Huy襫 Nh﹏ phng Trng, ho祅 th祅h th� th竎h Thi誹 L﹎ ph竔. Th╪g c蕄 H� Vi謓 V� T╪g. ")
	Msg2Player("Ch骳 m鮪g b筺! B筺  th╪g c蕄 H� Vi謓 V� T╪g c馻 Thi誹 L﹎ ph竔! H鋍 頲 Thi誹 L﹎ Quy襫 Ph竝, Thi誹 L﹎ C玭 Ph竝, Thi誹 L﹎ o ph竝. ")
end;

function L40_get_yes()
	SetTask(7,40*256+10)
	AddNote("Nh薾 l謓h c馻 Huy襫 Nh﹏ phng Trng, 甶 th豱h T辌h Di謙 Nh� T╪g xu蕋 quan. ")
	Msg2Player("Nh薾 l謓h c馻 Huy襫 Nh﹏ phng Trng, 甶 th豱h T辌h Di謙 Nh� T╪g xu蕋 quan. ")
end;

function L40_sele3_1()
	Say("C﹗ th� nh蕋 l�:",5,"Sinh di謙 bi課 d�, h� ng魕 v� ch� /L40_sele3_2","T� i kh� kh玭g, ng� ﹎ v� ng� /L40_sele3_2","Nh� th� quan s竧, ti謒 li sinh t� /L40_sele3_2","Th� gian v� thng, qu鑓 th� nguy tuy謙 /L40_sele3_correct1","T﹎ th� 竎 nguy猲, h譶h vi t閕 t萿 /L40_sele3_2")
end;

function L40_sele3_correct1()
	SetTaskTemp(43,GetTaskTemp(43) + 1)		-- 答对一个问题值加1，全对方可进入
	L40_sele3_2()
end;

function L40_sele3_2()
	Say("C﹗ th� hai l�:",5,"Th� gian v� thng, qu鑓 th� nguy tuy謙 /L40_sele3_3","T� i kh� kh玭g, ng� ﹎ v� ng� /L40_sele3_correct2","Sinh di謙 bi課 d�, h� ng魕 v� ch� /L40_sele3_3","Nh� th� quan s竧, ti謒 li sinh t� /L40_sele3_3","T﹎ th� 竎 nguy猲, h譶h vi t閕 t萿 /L40_sele3_3")
end;

function L40_sele3_correct2()
	SetTaskTemp(43,GetTaskTemp(43) + 1)		-- 答对一个问题值加1，全对方可进入
	L40_sele3_3()
end;

function L40_sele3_3()
	Say("C﹗ th� ba l�:",5,"T﹎ th� 竎 nguy猲, h譶h vi t閕 t萿 /L40_sele3_4","Nh� th� quan s竧, ti謒 li sinh t� /L40_sele3_4","T� i kh� kh玭g, ng� ﹎ v� ng� /L40_sele3_4","Th� gian v� thng, qu鑓 th� nguy tuy謙 /L40_sele3_4","Sinh di謙 bi課 d�, h� ng魕 v� ch� /L40_sele3_correct3")
end;

function L40_sele3_correct3()
	SetTaskTemp(43,GetTaskTemp(43) + 1)		-- 答对一个问题值加1，全对方可进入
	L40_sele3_4()
end;

function L40_sele3_4()
	Say("C﹗ th� b鑞 l�:",5,"Nh� th� quan s竧, ti謒 li sinh t� /L40_sele3_5","T﹎ th� 竎 nguy猲, h譶h vi t閕 t萿 /L40_sele3_correct4","Th� gian v� thng, qu鑓 th� nguy tuy謙 /L40_sele3_5","Sinh di謙 bi課 d�, h� ng魕 v� ch� /L40_sele3_5","T� i kh� kh玭g, ng� ﹎ v� ng� /L40_sele3_5")
end;

function L40_sele3_correct4()
	SetTaskTemp(43,GetTaskTemp(43) + 1)		-- 答对一个问题值加1，全对方可进入
	L40_sele3_5()
end;

function L40_sele3_5()
	Say("C﹗ th� n╩ l�:",5,"T� i kh� kh玭g, ng� ﹎ v� ng� /L40_sele3_result","Sinh di謙 bi課 d�, h� ng魕 v� ch� /L40_sele3_result","Nh� th� quan s竧, ti謒 li sinh t� /L40_sele3_correct5","T﹎ th� 竎 nguy猲, h譶h vi t閕 t萿 /L40_sele3_result","Sinh di謙 bi課 d�, h� ng魕 v� ch� /L40_sele3_result")
end;

function L40_sele3_correct5()
	SetTaskTemp(43,GetTaskTemp(43) + 1)		-- 答对一个问题值加1，全对方可进入
	L40_sele3_result()
end;

function L40_sele3_result()
	if (GetTaskTemp(43) == 5) then		-- 五句全对
		Talk(1,"","Nhi謒 v� n祔 ngi ho祅 th祅h t鑤 l緈, vi s� s� th╪g ngi l祄  t� c蕄 40, ng l祄 ta th蕋 v鋘g nh�!")
		SetTask(7,50*256)
		SetRank(5)
--		AddMagic(20)
		add_sl(50)			-- 调用skills_table.lua中的函数，参数为学到多少级技能。
		AddNote("L蕐 頲 l阨 ch� b秓 t� ch� T辌h Di謙 Nh� T╪g, ho祅 th祅h nhi謒 v� T辌h Di謙 Nh� T╪g. Th╪g c蕄 Truy襫 Kinh La H竛. ")
		Msg2Player("Ch骳 m鮪g b筺. B筺  th╪g c蕄 Truy襫 Kinh La H竛 c馻 Thi誹 L﹎ ph竔! H鋍 頲 v� c玭g S� T� H鑞g. ")
	else
		Talk(1,"","N╩ c﹗ n鉯 n祔 l� sao y, c� ph秈 ngi  c ngc kh玭g?")
	end
	SetTaskTemp(43,0)			-- 用完后释放变量
end;

function no()
end
