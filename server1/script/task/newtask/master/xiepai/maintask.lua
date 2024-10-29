
Include("\\script\\task\\newtask\\newtask_head.lua");
-- Include("\\script\\task\\newtask\\master\\xiepai\\giveaward.lua");
Include("\\script\\task\\newtask\\master\\clearskillpoint.lua");
Include("\\script\\task\\newtask\\master\\newtaskprize.lua")

--   ////////////////////////////
--  //  邪教主线任务模块实例  //
-- ////////////////////////////

-- Edited by peres
-- 2004/12/23

-- 过程函数名命名形式：task_ + level(任务等级)_ + 过程环节ID


--   ///////////////////////////////
--  //  20 级主线任务的处理过程  //
-- ///////////////////////////////

-- 与朱仙镇云儿的对话
function task_level20_00()

		-- 判断玩家的性别说不同的话
		if (GetSex()==0) then
			Talk(10,"task_level20_01","�!Ch祇 hi謕 kh竎h! T譵 ta c� vi謈 g�?","�......Nghe n鉯 mu閕 bi誸 'Thi猲 Ho祅g Long Kh�'?","Ai da! ng nh綾 n Long kh� H� kh�, n鉯 ch髏 chuy謓 vui v韎 n� gia 頲 kh玭g?","Vi謈 n祔...... N誹 mu閕 bi誸 tin t鴆 'Thi猲 Ho祅g Long Kh�'......c� th� n鉯 v韎 ta 頲 kh玭g......","H鮩! Mu鑞 moi tin c馻 ta u c� d�!","Mu閕 mu鑞 th� n祇 m韎 ch辵 n鉯 ra tung t輈h c馻 Long Kh�?","в xem ngi c� th� l祄 l穙 nng vui kh玭g?","Chuy謓 n祔......","Chuy謓 n祔 c竔 g�? Ta ch� mu鑞 b秓 ngi n L﹎ An t譵 <color=yellow>Th竔 C玭g C玭g<color> l蕐 1 b譶h Thi猲 Hng Ng鋍 Chi Cao."," Ta tng......n gi秐 th玦, t譵 <color=yellow> Th竔 C玭g C玭g<color> l蕐 Thi猲 Hng Ng鋍 Chi Cao ng kh玭g? H穣 ch� tin ta!");
		else
			Talk(8,"task_level20_01","Ti觰 mu閕 t譵 t� t� c� vi謈 g�?","�......T� t� bi誸 tung t輈h 'Thi猲 Ho祅g Long Kh�'?","Thi猲 Ho祅g Long Kh�? Nghe ra h譶h nh� l� th� t ti襫 �......Ti觰 mu閕 h醝 vi謈 n祔  l祄 g�?","Ta r蕋 hi誹 k�, mu鑞 xem th� n� l� c竔 g� m� ai c騨g mu鑞 c� v藋?","�......G莕 y ta g苝 m閠 chuy謓 kh� kh╪, kh玭g bi誸 mu閕 mu閕 c� th� gi髉 ta 頲 kh玭g?","Л頲! T� t� c� chuy謓 g� xin c� n鉯 th糿g","G莕 y kh� tr阨 se l筺h, Th竔 C玭g C玭g <color=yellow>� L﹎ An<color> c� 1 lo筰 Thi猲 Hng Ng鋍 Chi Cao c� th� ch鑞g phong h祅. Mu閕 mu閕 c� th� gi髉 ta n g苝 Th竔 C玭g C玭g l蕐 1 b譶h v� kh玭g?","R蕋 n gi秐, T� t� h穣 i ta.");
		end
end

-- 与云儿的对话结束，正式开始邪教主线，弹出任务面版
function task_level20_01()
	nt_setTask(1003,20)
	DelItem(506)
end

-- 与临安的蔡公公对话
function task_level20_02()
	Talk(8,"task_level20_03","Nghe n鉯 Th竔 C玭g C玭g c� 1 lo筰 Thi猲 Hng Ng鋍 Chi Cao?","C� th� c� y, nh璶g ngi mu鑞 l祄 gi?","Xem ra Th竔 C玭g C玭g h玬 nay t﹎ tr筺g kh玭g t鑤 l緈?","H玬 trc b� 1 t猲 Ti觰 Th竔 gi竚 l蕐 tr閙 c馻 ta 1 pho tng Kim Ph藅,  l� T骳 Kim X輈h Ph藅, th藅 l� t鴆 qu�!","Trong cung c騨g c� chuy謓 m蕋 tr閙 sao? T猲 Th竔 gi竚  hi謓 gi� � u?","H鮩! T猲 s骳 sinh   tr鑞 l猲 <color=yellow>Ph鬰 Ng璾 s琻<color>.","T譵 ngi l� tr� m� ta th輈h nh蕋, n誹 ta 甧m tng Ph藅 tr� v� C玭g C玭g c� th� cho ta 1 b譶h Thi猲 Hng Ng鋍 Chi Cao kh玭g?","Ch� c莕 ngi 甧m tng Kim Ph藅 v� ng n鉯 1 b譶h c� rng ta c騨g cho ngi!");	
end

-- 与汴京的蔡公公对话结束，改变任务变量并弹出任务面版
function task_level20_03()
	nt_setTask(1003,30)
end

-- 杀死小太监后，提示已经拿到金佛（任务变量为 35），改变任务变量并弹出任务面版
function task_level20_04()
	Msg2Player("B筺 nh薾 頲 1 T骳 Kim Ph藅 Tng!")
end

-- 得到金佛后，回到汴京与蔡公公的对话
function task_level20_05()
	Talk(3,"task_level20_06","Th竔 C玭g C玭g! Зy c� ph秈 tng Kim Ph藅 c馻 玭g b� cp 甶?","A! Kh玭g ng� ngi c� th� l蕐 v� cho ta!","B筺 tr� l祄 t鑤 l緈! Зy Thi猲 Hng Ng鋍 Chi Cao c馻 ngi.");
end

-- 与汴京的蔡公公对话结束，得到天香玉脂膏，改变任务变量并弹出任务面版
function task_level20_06()
	nt_setTask(1003,50)
	Msg2Player("B筺 nh薾 頲 1 b譶h Thi猲 Hng Ng鋍 Chi Cao!")
end



--   ///////////////////////////////
--  //  30 级主线任务的处理过程  //
-- ///////////////////////////////

-- 拿到天香玉脂膏后与云儿的对话
function task_level30_01()
	Talk(8,"task_level30_02","Sao d筼 n祔 nhi襲 ngi n t譵 ta h醝 v� vi謈 n祔 v藋 nh�?","T� c� bi誸 l祄 vi謈 n祔 kh� kh╪ l緈 kh玭g, h穣 cho ta bi誸 t� th蕐 'Tr蕁 Minh Chi Li猲' � u?","Ngi n鉯 s頸 d﹜ chuy襫 n祔 �......Th藅 ra m蕐 n╩ trc ta c� nghe m閠 ngi n 玭g t鮪g n鉯......","Ho芻 l� m蕐 n╩ trc nghe qua...","ng v藋! Cho n猲 trc ti猲 b秓 ngi gi髉 ta t譵 b譶h g�  m� th玦, n誹 nh� ta c� ta  b秓 ngi 甶 l蕐 vi猲 minh ch﹗ tr猲 u Ho祅g Thng v� r錳.","Ngi ch琲:......Th� c� g苝 qua ngi n 玭g c� s頸 d﹜ chuy襫  kh玭g?","L� m閠 v� Ti猽 s� n t� <color=yellow>Dng Ch﹗<color>, ngo礽 ra ta c騨g kh玭g 頲 r�.","Ti猽 S� � <color=yellow>Dng Ch﹗<color>? Л頲! Ta 甶 t譵 h緉!");
end

-- 与云儿的对话结束，改变任务变量并弹出任务面版，在此发予奖励
function task_level30_02()

local myText1, myText2, myText3 = "", "", ""
local curCamp = nt_getCamp()

	nt_setTask(1003,100)
	
	myText1 = "B筺 nh薾 頲 30.000 甶觤 kinh nghi謒"
	myText2 = "1 con ng鵤 c蕄 20"
	myText3 = "M閠 i gi祔"
	
	
	if (curCamp==2) then
		AddOwnExp(30000)
		AddItem(0,10,2,1,1,1)  --增加20级马
		AddGoldItem(0,184) --增加一双20跑的鞋子
		ex_add_xp_level20();
		
		Msg2Player("B筺 nh薾 頲"..myText1);
		Msg2Player("B筺 nh薾 頲"..myText2);
		Msg2Player("B筺 nh薾 頲"..myText3);
		
		Say("Th蕐 ngi c鵦 kh� v� ta, ta t苙g ngi v藅 n祔: <enter><enter><color=yellow>"..myText1.."<color><enter><color=yellow>"..myText2.."<color><enter><color=yellow>"..myText3.."<color>",0);		
	else
		AddOwnExp(30000)
		
		Msg2Player("B筺 nh薾 頲"..myText1);
		
		Say("Th蕐 ngi c鵦 kh� v� ta, ta t苙g ngi v藅 n祔: <enter><enter><color=yellow>"..myText1.."<color>",0);
	end
	
end


-- 与扬州镖师的对话
function task_level30_03()
	Talk(3,"task_level30_03_01"," Xin h醝 v� Чi ca c� bi誸 tung t輈h c馻 'Tr蕁 Minh Chi Li猲' kh玭g?","B筺 tr�, ngi nghe tin n祔 t� u v藋? Trc y c� nghe Ti猽 u H� H莡 Ph鬰 c� m閠 s頸 d﹜ chuy襫 c bi謙, nh璶g kh玭g bi誸 l� 'Tr蕁 Minh Chi Li猲' g� .","Th� b﹜ gi� H� H莡 Ph鬰 � u?");
end

-- 判断玩家是否已经达到了 30 级
function task_level30_03_01()
	if (GetLevel() >= 30) then
		nt_setTask(1003,109)
		task_level30_03_04()
	else
		task_level30_03_02()
	end
end


-- 如果没有达到 30 级时的对话与改变任务变量
function task_level30_03_02()
	nt_setTask(1003,108)
	Talk(2,"","Hai ngay n鱝 ta c� m閠 chuy課 ti猽, 阯g r蕋 xa, kh玭g bi誸 bao gi� m韎 v�.","Ngi hi謓 nay c遪 y誹 qu�, hay l� i n c蕄 <color=yellow>c蕄 30<color> h穣 n t譵 h緉.");
end

-- 当上一次等级未够 30 级被拒绝，这次达到条件时再回来与镖师对话
function task_level30_03_03()
	Talk(2,"task_level30_04","L莕 trc h醝 H� H莡 Ph鬰 � u, b﹜ gi� c� th� tr� l阨 ta r錳 ch�?","H緉 hi謓 產ng chuy觧 ti猽 � <color=yellow>Thanh Th祅h s琻<color>, kh玭g bi誸 l骳 n祇 m韎 v�.");
end

-- 如果玩家等级达到了 30 级
function task_level30_03_04()
	Talk(1,"task_level30_04","H緉 hi謓 產ng chuy觧 ti猽 � <color=yellow>Thanh Th祅h s琻<color>, kh玭g bi誸 l骳 n祇 m韎 v�.");
end

-- 与扬州镖师对话结束，改变任务变量并弹出任务面版
function task_level30_04()
	nt_setTask(1003,110)
end

-- 与夏侯复战斗并且胜利后，与其对话
function task_level30_05()
	Talk(6,"task_level30_06","Nghe n鉯 huynh 產ng gi� 'Tr蕁 Minh Chi Li猲'?","H�......Th� ra ngi mu鑞 t譵 m鉵 ......Nh璶g mi m蕐 n╩ trc  b� ngi n b�  l蕐 甶!","Ngi n b� n祇? g h穣 n鉯 r� h琻!","Ch輓h l� Th竔 Ngh� v� ta......Nh璶g Thi猲 h� r閚g l韓, ngi mu鑞 t譵 b� ta th� h琲 kh�, ha ha ha......","Th竔 Ngh�......?","Kh玭g bi誸 l� ai, hay l� 甶 h醝 <color=yellow>V﹏ Nhi<color>, c� th� c� ta bi誸.")
end

-- 与夏侯复的对话结束后，改变任务变量并弹出任务面版
function task_level30_06()
--	nt_setTask(1003,130)
	Msg2Player("B筺  nh b筰 H� H莡 Ph鬰, quay v� t譵 V﹏ Nhi!");
end

-- 回到朱仙镇与云儿的对话
function task_level30_07()
	Talk(9,"task_level30_08","Ngi v閕 v� quay l筰 t譵 ta c� vi謈 g�?","Ta n h醝 th╩ h祅h tung 1 ngi con g竔.","C� g竔 n祇 khi課 ngi 甶猲 o th�?","Hi觰 l莔 r錳! Ngi  l� Th竔 Ngh� v� trc c馻 Ti猽 s� H� H莡 Ph鬰.","Ngi mu鑞 bi誸 chuy謓 g�?",".....�.","Ngi h穣 n Long Tuy襫 th玭 t譵 <color=yellow>Ph� L玦 Th�<color>, Y t� x璶g l� Giang Nam V筺 S� Th玭g, c� v飊g Giang Nam chuy謓 g� c騨g bi誸.","C� ngi nh� th� �? в ta 甶 xem th�.","L莕 sau ng 甶 tay kh玭g n!");
end

-- 与云儿的对话结束后，改变任务变量并且弹出任务面版
function task_level30_08()
	nt_setTask(1003,140)
end

-- 来到龙泉村与傅雷书的对话
function task_level30_09()
	Talk(17,"task_level30_10","Kh�! Kh�! Ai da! Ngh蘯 th藅 l� kh�!..","L穙 b� b�......","дn m阨 l穙 gi� n祔 u鑞g ru顄 ch╪g?","L穙 trng phu......","B� ta gi� l緈 r錳 �?","L穙 ti猲 sinh...","�...... B筺 tr� c� chuy謓 g�?","Nghe n鉯 Ti猲 sinh am hi觰 v飊g Giang Nam, ta mu鑞 h醝 th╩ m閠 ngi?","Ha ha ha! B筺 tr� h醝 ng r錳 ngi r錳! Ta  c� bi謙 hi謚 l� Giang Nam V筺 S� Th玭g th� kh玭g c� chuy謓 g� kh玭g bi誸.","Ha ha! Th� th� c竚 琻 l穙 ti猲 sinh.","V藋 th� a ti襫 y.","H�?!","H� c竔 g�? Ch糿g l� mu鑞 bi誸 chuy謓 m� kh玭g ph秈 tr� ti襫 sao?","Vi謈 n祔......Ta mu鑞 bi誸 Th竔 Ngh� v� c馻 Dng Ch﹗ Ti猽 S� H� H莡 Ph鬰 hi謓 產ng � u m蕋 bao nhi猽 ti襫?","T譵 ngi �......Th﹏ ph薾 ngi mu鑞 t譵 c祅g cao th� ph秈 tr� c祅g nhi襲 ti襫, cho n猲 mu鑞 bi誸 Th竔 Ngh� v� c馻 H� H莡 Ph鬰......","Ngi n祔 lai l辌h kh玭g n gi秐, v藋 ph秈 m蕋 1 v筺 lng.","C竔 g�! ng l�......#??%%?%");
end

-- 用以判断玩家身上所持有的金钱是否达到要求
function task_level30_10()

local n

n = Pay(10000)

	if (n == 1) then -- 如果成功的扣除了玩家一万两银子
		nt_setTask(1003,150)
		-- 在此置入改变任务面版的选项，但不弹出界面
		Talk(6,"task_level30_11","V鮝 ng 1 v筺 lng. Th竔 Ngh� v鑞 l� v� c馻 H� H莡 Ph鬰, nh璶g do H� H莡 Ph鬰 產m m� t鰑 s綾, ph� r蓎 Th竔 Ngh�. Cu鑙 c飊g Th竔 Ngh� quy誸 nh chon con 阯g c馻 m譶h","Th竔 Ngh� quy誸 t﹎ kh� luy謓 c thu藅, trong 10 n╩ ng緉 ng駃  luy謓 th祅h......","Th� c� ta 產ng � u?","Th竔 Ngh� b﹜ gi� l� 1 trong Ng� Чi Hng ch� <color=yellow>Ng� чc gi竜<color> <color=yellow> M芻 Th� Hng ch�<color>!","Th� ra l� v藋....Th� t筸 bi謙 � y v藋.","L莕 sau nh� 甧m nhi襲 ti襫 qua..");
	else
		Talk(2,"task_level30_12","Th�......g xem nhi猽 y ti襫 c�  kh玭g?","B筺 tr�, l穙 tuy gi� nh璶g m総 v蒼 s竛g l緈,  ti襫 r錳 quay l筰.");
	end
	
end

-- 成功的扣除了玩家的银子之后，改变任务变量并弹出任务面版
function task_level30_11()
	nt_setTask(1003,150)
end

-- 身上的钱不够，记录变量并弹出任务面版的过程
function task_level30_12()
	nt_setTask(1003,151)
end

-- 之前没有钱，等身上有了足够的银子给傅雷书后的对话
function task_level30_13()
	Talk(10,"task_level30_11","Th� n祇? m ti襫 甶 h醝 ngi kh竎 �?","......g m th� xem.?u l遪g?","B筺 tr�? Ngi l祄 sao th�? T筰 sao l筰 r琲 nc m総?","Kh玭g sao......b� c竧 v� m総 th玦......","V鮝 ng 1 v筺 lng. Th竔 Ngh� v鑞 l� v� c馻 H� H莡 Ph鬰, nh璶g do H� H莡 Ph鬰 產m m� t鰑 s綾, ph� r蓎 Th竔 Ngh�. Cu鑙 c飊g Th竔 Ngh� quy誸 nh chon con 阯g c馻 m譶h","Th竔 Ngh� quy誸 t﹎ kh� luy謓 c thu藅, trong 10 n╩ ng緉 ng駃  luy謓 th祅h......","Th� c� ta 產ng � u?","Th竔 Ngh� l� m閠 trong Ng� Чi Hng ch� Ng� чc gi竜 M芻 Th� Hng ch�!","Th� ra l� v藋....Th� t筸 bi謙 � y v藋.","L莕 sau nh� 甧m nhi襲 ti襫 qua..");
end

-- 来到五毒教后与桑珠的对话
function task_level30_14()
	Talk(10,"task_level30_14_01","Sao ngi d竚 t� ti謒 x玭g v祇 y?","M芻 Hng ch� th� l鏸! T筰 h� m筼 mu閕 n h醝 th╩ tung t輈h  'Tr蕁 Minh Chi Li猲'.","Tr蕁 Minh Chi Li猲? Ta ch璦 t鮪g nghe qua m鉵 n祔.","Ta nghe..... ch錸g trc c馻 b� n鉯, l骳 b� b� 玭g ta c� 甧m theo s頸 d﹜ chuy襫 .","H�! Th� ra l� th�! Ta c騨g mu鑞 bi誸 tung t輈h c馻 n�, n� � tr猲 m譶h a con  b� th蕋 l筩 c馻 ta!","M芻 Hng ch� c遪 c� m閠 a con?","H�......N╩  sau khi r阨 kh醝 t猲 ph� b筩  ta  mang thai..L骳 a con ch璦  tu鎖 trong m閠 l莕 chi課 lo筺 ta  th蕋 l筩 n�. Bao n╩ tr玦 qua c� ngh� n chuy謓 n祔 th� ta..","Th� ra l� th�......Ta c� th� gi髉 b� t譵 tung t輈h c馻 a con g竔.","N誹 ngi c� th� gi髉 ta t譵 頲 a con th� qu� t鑤!","V藋 M芻 Hng ch� c� i tin t鴆 c馻 ta.");
end


function task_level30_14_01()
	Talk(1,"task_level30_15","Ngi ch琲:?Th秏 r錳! Thi猲 h� l韓 nh� v藋 bi誸 n u m� t譵 a con th蕋 l筩 nhi襲 n╩ hay l� quay v� g苝 玭g gi� gi�  h醝 xem.?");
end

-- 与桑珠对话结束后，改变任务变量并弹出任务面版
function task_level30_15()
	nt_setTask(1003,160)
end

-- 回到龙泉村与傅雷书的对话
function task_level30_16()
	Talk(9,"task_level30_17","L穙......ti猲 sinh.?l筰 t鑞 ti襫 r錳!?","B筺 tr�, l莕 n祔 l筰 mu鑞 h醝 g�?","Ta mu鑞 bi誸 con g竔 c馻 Tang Chu 產ng � u? Mu鑞 bao nhi猽 ti襫 c� n鉯!","�......C竔 n祔......ta kh玭g l蕐 ti襫.","! V筺 l莕 c秏 琻!","B雐 v� ta c騨g kh玭g bi誸.","L穙...","Ta a th玦! Ngi h穣 n <color=yellow>V� ng ph竔<color>, kh玭g ch鮪g c� ch髏 manh m鑙.","C秏 琻 l穙 ti猲 sinh!");
end

-- 回到龙泉村与傅雷书的对话结束后，改变任务变量并弹出任务面版，在此发予奖励
function task_level30_17()

local myText1, myText2, myText3 = "", "", ""
local curCamp = nt_getCamp()

	nt_setTask(1003,170)
	
	myText1 = "80.000 甶觤 kinh nghi謒"
	myText2 = "B筺 nh薾 頲 1 kh玦 m穙"
	
	if (curCamp==2) then
	
		AddOwnExp(80000)	
		AddGoldItem(0,177)
		ex_add_xp_level30();
		
		Msg2Player("B筺 nh薾 頲"..myText1);
		Msg2Player("B筺 nh薾 頲"..myText2);
		
		Say("B筺 tr�! Giang h� r蕋 nguy hi觤! Ta c� v藅 n祔 c� th� gi髉 頲 ngi.<enter><enter><color=yellow>"..myText1.."<color><enter><color=yellow>"..myText2.."<color>",0);
	else
	
		AddOwnExp(80000)
		Msg2Player("B筺 nh薾 頲"..myText1);
		
		Say("B筺 tr�! Giang h� r蕋 nguy hi觤! Ta c� v藅 n祔 c� th� gi髉 頲 ngi.<enter><enter><color=yellow>"..myText1.."<color>",0);
	
	end
	
end


--   ///////////////////////////////
--  //  40 级主线任务的处理过程  //
-- ///////////////////////////////



-- 来到武当派后与姚石门的对话
function task_level40_01()
	Talk(9,"task_level40_01_01"," (Tr猲 c� h緉 甧o s頸 d﹜ chuy襫 g� l� qu�??","S頸 d﹜ chuy襫 n祔 huynh t� u m� c�?","S頸 d﹜ chuy襫 n祔? Ta c騨g kh玭g r�......S� ph� n鉯 l骳 nh苩 ta v� tr猲 ngi  c� n� "," (ng l� huynh r錳! V藋 s頸 n祔 nh蕋 nh l� Tr蕁 Minh Chi Li猲 r錳!?","Th� Thi誹 hi謕 c� t鮪g ngh� s� 甶 t譵 m� kh玭g?","Chuy謓 n祔 ta trc gi� ch璦 ngh� t韎, S� ph� hi謓 nay Qu鑓 gia l﹎ n筺, ch髇g ta nh鱪g ngi t藀 v� n猲 g鉷 m閠 ph莕 s鴆 l鵦.","Nh璶g c� th� m� ngi 產ng ch� ngi? Ta tng c� th� gi髉 huynh t譵 l筰 m� m譶h.","Th藅 �? Ngi  g苝 qua m� ta?","C� l� c� m閠 ngi ng th藅 l� m� ngi......ta c騨g kh玭g ch綾 l緈, hay l� c飊g ta 甶 th╩ b� ta m閠 chuy課?");
end

-- 对话扩展
function task_level40_01_01()
	Talk(3,"task_level40_02","Nh璶g b﹜ gi� kh玭g 頲! V� ng ph竔 ta hi謓 c� m閠 t猲 ph秐 , y  l蕐 lc  qu﹏ s� c� v飊g Giang Nam a cho Kim qu鑓! Hi謓 V� l﹎ Trung nguy猲 t蕋 c� u truy b総 t猲 n祔. Ng祔 n祇 ch璦 l蕐 l筰 Chi課 lc  ta ╪ ng� kh玭g y猲!"," (Зy u ph秈 l� vi謈 c馻 m閠 m譶h ngi!) ","Chi b籲g th� n祔, ta gi髉 ngi x� l� t猲 b筰 ho筰 c馻 V� ng, sau  c� th� c飊g ta 甶 t譵 m� ngi?");
end

-- 判断玩家当前等级是否达到了 40 级
function task_level40_02()

	if (GetLevel() >= 40) then
		nt_setTask(1003,209)
		Talk(3,"task_level40_04","N誹 ngi t譵 頲 t猲 ph秐   th藅 s� l� ph骳 l韓 c馻 V� l﹎! Ta ngh� ngi c騨g n猲 g鉷 ch髏 s鴆 cho Чi T鑞g!","ng v藋!?Ch� c莕 l蕐 頲 s頸 d﹜ chuy襫 c馻 huynh c竔 g� c騨g d� n鉯?","Ph秐   t猲 <color=yellow>Ti猽 V� Thng<color>, 產ng tr鑞 tr猲 <color=yellow>Th鬰 Cng S琻<color>.",0);
	else
		Talk(1,"task_level40_03","Nh璶g m� ngi kh玭g r祅h v� ngh�, ta ngh� ngi ch kh玭g l筰 h緉 u, i ngi t n <color=yellow>c蕄 40<color> r錳 t輓h.",0);
	end
	
end

-- 玩家等级不够 40 级，所以暂存变量
function task_level40_03()
	nt_setTask(1003,208)
end

-- 玩家等级已经达到了 40 级，保存任务变量并且弹出任务面版
function task_level40_04()
	nt_setTask(1003,210)
end

-- 玩家战胜了肖无常后，保存任务变量并且弹出任务面版
function task_level40_05()
--	nt_setTask(1003,220)
	Msg2Player("B筺 nh薾 頲 B秐  chi課 lc c馻 Trung nguy猲 t� Ti猽 V� Thng!");
-- 任务变量在肖无常身上直接改变，此处仅弹出任务面版
end

-- 玩家战胜了肖无常后回到武当山与姚石门对话
function task_level40_06()
	Talk(10,"task_level40_06_01","A! Х do箃 l筰 Chi課 lc ! Ngi  gi髉 V� l﹎ thanh tr� t猲 b筰 lo筰 ! Th藅 s� ng ch骳 m鮪g!","Ha ha! Chuy謓 nh� th玦 m�! Ch髇g ta 甶 t譵 m� c馻 huynh 甶!","B� ta hi謓 產ng � u?","Ch輓h l� M芻 Th� Ng� чc gi竜 Tang Chu.","C竔 g�?","�? Sao v藋?"," Ngi b秓 ta 甶 g苝 ngi c馻 Ng� чc gi竜!? Kh玭g bao gi�!","?......Kh玭g c莕 thay i nhanh v藋??","Nh璶g......b� ta l� m� c馻 huynh! D﹜ chuy襫 tr猲 c� huynh ch輓h l� l骳 b� sinh huynh   l筰","X璦 nay Ch輓h T� b蕋 ph﹏ lng l藀, ta th� kh玭g c� ngi m� n祔!");
end

-- 对话的第二行
function task_level40_06_01()
	Talk(2,"task_level40_07","S頸 d﹜ chuy襫 n祔 a ngi, n鉯 v韎 b� ta sau n祔 s� g苝 l筰 � tr猲 chi課 trng!","C玭g T�  quy誸 nh�......v藋 ta kh玭g l祄 phi襫 n鱝. (Ha ha! Th藅 kh玭g ph� c玭g, V� ng l筰 c� nh﹏ t礽 nh� th�??");
end

-- 玩家拿到了镇冥之链后，保存任务变量，
function task_level40_07()

local myText1, myText2, myText3 = "", "", ""
local curCamp = nt_getCamp()

	nt_setTask(1003,230)
	
	myText1 = "280.000 甶觤 kinh nghi謒"
	myText2 = "B筺  頲 t葃 to祅 b� 甶觤 k� n╪g!"	
	
	Msg2Player("B筺 nh薾 頲 Tr蕁 Minh Chi Li猲!");
	
	if (curCamp==2) then
		AddOwnExp(280000)
		ex_add_xp_level40();
		ClearMagicPoint()  --增加40级时洗点的功能
		Talk(1,"task_level40_08","L莕 n祔 may nh� ngi gi髉, nh鱪g th� n祔 ta t苙g ngi <enter><enter><color=yellow>"..myText1.."<color><enter><color=yellow>"..myText2.."<color>");
	else
		AddOwnExp(280000)
		Talk(1,"task_level40_08","L莕 n祔 may nh� ngi gi髉, nh鱪g th� n祔 ta t苙g ngi <enter><enter><color=yellow>"..myText1.."<color>");
	
	end
	
-- 在这里弹出任务面板

end

-- 告诉玩家下一步应怎样做
function task_level40_08()
	Talk(2,0,".....�.","S頸 d﹜ chuy襫 c� b� m藅 g� ...... Hay l� t譵 <color=yellow>玭g gi� gi� <color> h醝 th╩ lai l辌h c馻 'Thi猲 Ho祅g Long Kh�'.");
end


--   ///////////////////////////////
--  //  50 级主线任务的处理过程  //
-- ///////////////////////////////

-- 在龙泉村与傅雷书的对话
function task_level50_01()
	Talk(5,"task_level50_01_01","Ti猲 sinh! g bi誸 lai l辌h c馻 d﹜ chuy襫 n祔?","V藅 n祔......kh玭g ph秈 l� 'Tr蕁 Minh Chi Li猲' trong 'Thi猲 Ho祅g Long Kh�' sao?","V藋 cu鑙 c飊g Long Kh� c� b� m藅 g�?","Ngi c� bi誸  'Thi猲 Ho祅g Long Kh�' t鎛g c閚g c� 8 c竔, 頲 ch� t筼 t筰 H祄 Dng. Sau  T莕 Th駓 Ho祅g qua i n� c騨g m蕋 t輈h theo. N誹 t藀 h頿  8 m鉵 s� bi誸 頲 1 b� m藅 kinh ngi.","M閠 b� m藅 kinh ngi? V藋 cu鑙 c飊g l� th� n祇?");
end


function task_level50_01_01()
	Talk(9,"task_level50_02","Vi謈 n祔...... Ngi ch� c� t譵  8 m鉵 Long Kh� m韎 c� th� bi誸.","g bi誸 tung t輈h c竎 m鉵 Long Kh� c遪 l筰 kh玭g?","N誹 nh� ta bi誸 ta c遪 c� m筺g tr猲 i sao? Trong V� l﹎ g莕 y s� ngi ch誸 v� m蕐 m鉵  n祔 kh玭g 輙......","L� n祇 th藅 s� hi觤 nguy n v藋 sao?","B筺 tr� nghe n鉯 ngi r蕋 c� ch�? Tin t鴆 Long Kh� h莡 nh� ai c騨g bi誸 ch髏 輙......","Nh璶g ph秈 n閜 ti襫 ng kh玭g?","Kh�! Kh�! Ch� l�  u鑞g ru th玦 m�! Tin t鴆 kh玭g ng ta kh玭g l蕐 ti襫.","Kim  qu鑓 產ng ph竧 sinh kh玭g 輙 chuy謓, h譶h nh� c� li猲 quan n 'B祅 Long C玦'!","Kim qu鑓?.....ta s� n <color=yellow>Bi謓 Kinh<color> t譵 ch髏 manh m鑙! C竚 琻 ti猲 sinh!");
end


-- 与傅雷书对话后，保存任务变量并且弹出任务面版
function task_level50_02()
	nt_setTask(1003,300)
end

-- 在汴京与如玉的对话
function task_level50_03()
	Talk(5,"task_level50_04","G莕 y Kim binh kh玭g bi誸 產ng l祄 g�, c� ng祔 tri謚 t藀 binh m� trong th祅h, h譶h nh� 產ng t譵 th� g�......","C� bi誸 b鋘 ta 產ng t譵 g� �?","Chuy謓 c馻 ngi Kim ta n祇 d竚 h醝! N誹 nhi襲 chuy謓 s� b� 甶 t� n鱝 n╩, ta c遪 ph秈 lo vi謈 nh� n鱝!","Th阨 nay ch� c� nh鱪g k� ch辵 lu錸 c骾 Kim qu鑓 m韎 頲 s鑞g an nh祅, ngi h穣 nh譶 <color=yellow>Tr莕 Tam B秓<color> xem, h緉 頲 bao nhi猽 ngi ngng m�.","Th� �......xem ra <color=yellow>Tr莕 Tam B秓<color> ti誴 x骳 v韎 ngi Kim kh玭g 輙.");
end

-- 与如玉对话结束后，保存任务变量并且弹出任务面版
function task_level50_04()
	nt_setTask(1003,310)
end

-- 在汴京与陈三宝对话
function task_level50_05()
	Talk(8,"task_level50_06"," Ai......","V� i ca n祔 sao l筰 � y than ng緉 th� d礽?","Xem ra t輓h m筺g c� gia nh m蕋 trong tay ta......","Chuy謓 g� m� nghi謒 tr鋘g th�?","у Кn Чi nh﹏ trong tri襲 mu鑞 m閠 b譶h Lam Hoa, ai ng� ta nh� ngi v薾 chuy觧 t� C秐h c tr蕁 b� gi芻 cp 甶!","L莕 nay e r籲g t輓h m筺g c� gia nh kh� b秓 to祅......","Xem ra l莕 n祔 t輓h m筺g c� nh� 玭gth藅 s� mong manh! Kh玭g sao u, ta s� gi髉 玭g.","Th藅 �......?");
end

-- 判断玩家等级是否达到 50 级，之后再接着做任务
function task_level50_06()
	if (GetLevel() >= 50) then
		nt_setTask(1003,329)
		Talk(3,"task_level50_08","Л琻g nhi猲, c竔 b譶h 玭g n鉯 b� cp � u?","C� m閠 t猲 o t芻 t猲 <color=yellow>L鬰 Phi<color=> � g莕 <color=yellow>Nh筺 Хng S琻<color>......","Л頲 r錳! H穣 ch� � y ta gi髉 玭g l蕐 l筰!");
	else
		Talk(1,"task_level50_07","Ngi......th藅 s� c� th� gi髉 ta? Th蕐 ngi nh� th� ta c騨g kh玭g nh蒼 t﹎ nh譶 ngi ch辵 ch誸. Hay l� ngi luy謓 n c蕄 50 h穣 t輓h.");
	end
end

-- 如果玩家等级没有达到 50 级的对话，并保存任务变量
function task_level50_07()
	nt_setTask(1003,328)
end

-- 玩家等级到了 50 级，接下了陈三宝的任务，弹出任务面版
function task_level50_08()
	nt_setTask(1003,330)
end

-- 玩家战胜了陆非后保存任务变量，弹出任务面版
function task_level50_09()
--	nt_setTask(1003,340)
	Msg2Player("B筺 nh th緉g L鬰 Phi l蕐 頲 b譶h Lam Hoa!");
-- 任务变量在陆非身上直接改变，此处仅弹出任务面版
end

-- 玩家拿到了蓝花瓷瓶后回来与陈三宝的对话
function task_level50_10()
	Talk(8,"task_level50_11","Зy l� b譶h Lam Hoa 玭g t mua kh玭g? Ta  甧m v� r錳.","A! ng l� b譶h у Кn Чi nh﹏ th輈h! Ta th藅 kh玭g d竚 tin v祇 m総 m譶h!","Ngi  c鴘 t輓h m筺g c� nh� ta, kh玭g bi誸 n 琻 ngi th� n祇?","Ch� l� chuy謓 nh�! Ta ch� mu鑞 bi誸 g莕 y у Кn Чi nh﹏ 產ng l祄 g�?","у Кn Чi nh﹏ g莕 y nh薾 頲 1 b秓 v藅, nh璶g h譶h nh� 玭g ta kh玭g mu鑞 ai bi誸 chuy謓 n祔.","A? Ch糿g l�  l� 'B祅 Long C玦'? V藋 у Кn Чi nh﹏ thng 甶 u?","g ta g莕 y hay 甶 <color=yellow>Thi誸 Th竝<color>, ngi n  c� th� g苝","Л頲! C秏 琻 ti猲 sinh!");
end

-- 玩家在与陈三宝对话结束后，改变任务变量并弹出任务面版
function task_level50_11()
	nt_setTask(1003,350)
end

-- 玩家在战胜了徒单大人后，改变任务变量
function task_level50_12()

local curCamp = nt_getCamp()

--	nt_setTask(1003,360)
	Msg2Player("B筺 chi課 th緉g у Кn Чi nh﹏!");
	-- 玩家在与徒单大人对话结束后，弹出任务面版
	if (curCamp==2) then
		AddOwnExp(350000)
		AddExp_Skill_Extend(350000)
		AddItem(6,1,71,1,1,1)  --增加一个仙草露
		ex_add_xp_level50();
	
		Msg2Player("B筺 nh薾 頲 350.000 甶觤 kinh nghi謒");
		Msg2Player("B筺 nh薾 頲 m閠 b譶h Ti猲 Th秓 L� ");
	else
		AddOwnExp(350000)
		AddExp_Skill_Extend(350000)
		Msg2Player("B筺 nh薾 頲 350.000 甶觤 kinh nghi謒");
	end
	
	Talk(8,"","Ngi......T筰 sao ngi l筰 truy s竧 ta?","R蕋 n gi秐! Ta mu鑞 l蕐 'B祅 Long C玦' c馻 玭g","H�......Th� ra l� v� th� n祔.","R蕋 ti誧 m閠 th竛g trc  b� Ho祅 Nhan H飊g Khang cp 甶......","Ho祅 Nhan H飊g Khang?","L� Qu鑓 s� Чi Kim Ho祅 Nhan H飊g Khang! C� b秐 l躰h th� h穣 n t譵 h緉!",".....�.","S� g� ch�! Ta s� n <color=yellow>Thi猲 Nh蒼 Gi竜<color> xem th�!");
end


--   ///////////////////////////////
--  //  60 级主线任务的处理过程  //
-- ///////////////////////////////

-- 玩家在天忍教大堂与端木睿的对话
function task_level60_01()
	Talk(6,"task_level60_02","Ngi t譵 Ho祅 Nhan H飊g Khang l祄 g�?","V� mu鑞 m閠 m鉵 .","Ha ha ha...... L莕 u ti猲 th蕐 m閠 ngi nh� ngi.","T筰 sao?","D竚 trc m苩 Qu鑓 s� Чi Kim i v藅, tr猲 th� gian n祔 e l� ch� c� m譶h ngi.","Nh璶g ta th輈h t輓h c竎h c馻 ngi,  ngi n <color=yellow>Long M玭 Tr蕁<color> t譵 mu閕 mu閕 c馻 ta <color=yellow> an M閏 Thanh<color>, ch� c� c� ta m韎 bi誸 Ho祅 Nhan H飊g Khang � u.");
end

-- 与端木睿的对话结束，改变任务变量并弹出任务面版
function task_level60_02()
	nt_setTask(1003,400)
end

-- 在龙门镇与端木清的对话
function task_level60_03()
	Talk(10,"task_level60_03_01","C� l� T� H� s� c馻 Thi猲 Nh蒼 Gi竜 mu閕 mu閕 c馻 an M閏 Du�?","H�, ch綾 l� anh ta b秓 ngi n ph秈 kh玭g? Ngi v� n鉯 v韎 huynh 蕐, ta kh玭g bao gi� tr� v�!",".....�.","Tuy anh c� b秓 ta n, nh璶g y kh玭g c� b秓 c� quay v�.","V藋 ngi n y l祄 g�?","Ta mu鑞 bi誸 tung t輈h c馻 Ho祅 Nhan H飊g Khang.","Ngi t譵 H飊g Khang  l祄 g�?","V� trong tay h緉 c� m鉵  ta c莕.","H�? Vi謈  c遪 ph秈 xem ngi c� kh� n╪g l蕐 m鉵  trong tay h緉 kh玭g.","Ta ph秈 l祄 th� n祇 m韎 c� th� g苝 y?");
end

-- 对话扩展
function task_level60_03_01()
	Talk(4,"task_level60_04","Vi謈 n祔......  ta ngh� xem,  Tng l躰h Li猽 мnh nc T鑞g 產ng ch鑞g l筰 Чi Kim ta, n誹 ngi c� th� nh th緉g h緉 c� l� ta s� cho ngi g苝 H飊g Khang.","T筰 sao ta ph秈 nghe l阨 c�?","Ha ha! Ch� s� tr猲 th� gian n祔 ngo礽 ta ra kh玭g c� ai bi誸 h祅h tung c馻 H飊g Khang.","V藋 頲, cho ta bi誸 Li猽 мnh 產ng � u?");
end

-- 判断玩家等级是否达到 60 级
function task_level60_04()
	if (GetLevel() >= 60) then
		nt_setTask(1003,409)
		Talk(2,"task_level60_05","T猲 kh玭g bi誸 tr阨 cao t r閚g 產ng � <color=yellow> Linh C鑓 ng<color>, ngi n l蕐 th� c蕄 h緉 v� cho ta.",".....�.");
	else
		nt_setTask(1003,408)
		Talk(1,"","H�! Ngi d鵤 v祇 c竔 g� m� mu鑞 gi誸 Li猽 мnh? ng v鋘g tng! дn <color=yellow> c蕄 60<color> h穣 quay l筰 y!");
	end
end

-- 如果玩家等级达到 60 级，保存任务变量并弹出任务面板
function task_level60_05()
	nt_setTask(1003,410)
end


-- 如果玩家战胜了廖定
function task_level60_06()

--	nt_setTask(1003,420)
	Msg2Player("B筺  nh th緉g Li猽 мnh!");
	
	AddOwnExp(800000)
	AddExp_Skill_Extend(800000)
	Msg2Player("B筺 nh薾 頲 800.000 甶觤 kinh nghi謒!");
	
	Talk(10,"",":......",".....Ch糿g ng� Li猽 мnh ta......cu鑙 c飊g ch誸 di tay ngi T鑞g!","Li猽 tng qu﹏, ta v韎 ngi v鑞 kh玭g th� kh玭g o竛, nh璶g v� th� c蕄 ngi c� th� gi髉 ta c� 頲 m鉵  產ng c莕.","Ha ha......Ta ch糿g ng� u c馻 Li猽 мnh ta ch� ng i m閠 v藅 g� th玦 sao?","B祅 Long C玦 trong Thi猲 Ho祅g Long Kh�.",":......","B筺 tr�......L阨 c馻 b鋘 Kim kh玭g ng tin......","Thi猲 Ho祅g Long Kh� m� ngi mu鑞 t譵...m閠 khi t藀 h頿  c� th� gi髉 Чi T鑞g 畂箃 l筰 giang s琻, c騨g c� th� gi髉 Чi Kim x﹎ chi誱 i giang nam b綾, b� t竛h sinh linh  th竛!"," T� ch輓h x璦 nay v鑞 kh玭g i tr阨 chung! Th藅 u鎛g cho ngi.....",".....�.");
end

-- 玩家战胜了廖定之后回到龙门镇与端木清的对话
function task_level60_07()
	Talk(11,"task_level60_08","?n衜 u Li猽 мnh xu鑞g t?","Зy l� u c馻 Li猽 мnh.","R蕋 t鑤! Qu� nhi猲 kh玭g ph� l遪g ta.","ng nhi襲 l阨! Ho祅 Nhan H飊g Khang hi謓 產ng � u?","H飊g Khang 產ng b薾, t筸 th阨 kh玭g th� g苝 h緉 頲.","Ngi gi靚 v韎 ta h�?","Ha ha...... Ngi tng b鎛 c� nng l� k� hai l阨 sao? Th藅 ra H飊g Khang  s韒 bi誸 ngi mu鑞 g�.","V藋 l� � g�?","Y bi誸 頲 ngi l� ngi d竚 b竛 m筺g v� Чi Kim, cho n猲 d苙 ta t苙g ngi m鉵  n祔.","Nh� l蕐! Sau n祔 l祄 vi謈 cho Чi Kim s� kh玭g thi謙 th遡 u. Ha! Ha! Ha!",".....�.");
end

-- 玩家得到磐龙瑰，邪教主线正式结束
function task_level60_08()
	nt_setTask(1003,430)
	ex_add_xp_level60();
	Msg2Player("B筺 nh薾 頲 B祅 Long C玦!");
	AddSkillState( 509, 1, 0, 180);
end