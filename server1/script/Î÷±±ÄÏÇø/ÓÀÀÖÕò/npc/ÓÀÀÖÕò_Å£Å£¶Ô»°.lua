----description: 新手村_牛牛
--author: wangzg	
--date: 2003/7/18
--Modify:2003/7/21 wangzg
--update 2003/7/22 yuanlan
-- Update: Dan_Deng(2003-08-07)
-- 等待检测并删除武器的函数，现在先只允许给钱

function main(sel)
	UTask_world37=GetTask(65)
	if (UTask_world37==2) then		--已经接到任务
		Say("Ta mu鑞 l祄 i hi謕, 甶 kh緋 n琲 h祅h hi謕 trng ngh躠, gi髉  ngi ngh蘯 kh�!",2,"Khuy猲 can /reason", "駈g h� /help")
	elseif (UTask_world37==9) then		--选择劝说
		Say("L祄 i hi謕 th藅 kh�! Luy謓 v� c玭g l﹗ qu�!",0)
	elseif (UTask_world37==10) then		--选择支持
		Say("Ta mu鑞 l祄 i hi謕, 甶 kh緋 n琲 h祅h hi謕 trng ngh躠, gi髉  ngi ngh蘯 kh�!",0)	
	else
		Say("Nh鱪g hi謕 kh竎h trong s竎h th藅 l� oai phong, n誹 頲 gi鑞g nh� h� th� hay qu�!",0)
	end
end;

function reason()		--选择劝说牛牛
	Talk(3,"prise","Ngi x蕌 r蕋 hung d�,  c遪 nh� nh� th�, v� c玭g c騨g luy謓 kh玭g t鑤 th� l祄 sao 甶 h祅h hi謕 trng ngh躠?","Ngi n鉯 c騨g ng! ьi ta l韓 l猲, luy謓 th猰 v� c玭g, s� 甶 h祅h hi謕 trng ngh躠!","ng r錳! Luy謓 t鑤 v� c玭g c� b秐, sau  h穣 甶 nh ngi x蕌. ")
end;

function prise()
	Talk(1,"","V藋 ta v� nh� y!C秏 琻 i hi謕! Зy c� ch髏 thu鑓 tr� thng, xin nh薾 cho!")
	AddItem(1,0,0,1,0,0)
	AddItem(1,0,0,1,0,0)
	AddItem(1,0,0,1,0,0)
	SetTask(65,9)
	AddRepute(6)		-- 声望加6点
	AddNote("T譵 頲 Ng璾 Ng璾, khuy猲 h緉 v� nh�, nhi謒 v� ho祅 th祅h. ")
	Msg2Player("Khuy猲 gi秈 Ng璾 Ng璾 v� nh�, nhi謒 v� ho祅 th祅h. ")
	Msg2Player("Л頲 ba g鉯 Kim Thng dc ")
	Msg2Player("Thanh th� giang h� c馻 b筺 頲 gia t╪g 6 甶觤. ")
end;

function help()			--选择帮助牛牛
--	Say("玩家：小小年纪，倒挺有志气。",3,"送一把武器/arm","送一点银子/money","我再想想/wait")
	Say("Tu鎖 c遪 nh� nh璶g  c� ch� l韓!",2,"T苙g m閠 ch髏 b筩 /money","в ta suy ngh� k� l筰 xem/wait")		--等能够检测武器再用上面这句，现在先只给钱
end

function arm()
	if x==0 then	--如果没有武器
		Say("Ta hi謓 t筰 kh玭g c� v� kh�.",3,"T苙g m閠 m鉵 v� kh� /arm","T苙g m閠 ch髏 b筩 /money","в ta suy ngh� k� l筰 xem/wait")
	else 
		--给武器
		Talk(1,"","C秏 琻 i hi謕! Ngi th藅 l� t鑤!")
		AddOwnExp(100)
		SetTask(65,10)
		AddNote("T譵 頲 Ng璾 Ng璾, cho 甶 m閠 m鉵 v� kh�, 駈g h� c m� l祄 i hi謕 c馻 n�. ")
	end
end

function money()
	if (GetCash() < 100) then
--		Say("玩家：哎呀，我身上没带什么钱。",3,"送一把武器/arm","送一点银子/money","我再想想/wait")
		Talk(1,"","Trong ngi ta kh玭g c� mang ti襫, i ta quay l筰 nh�!")		--等能够检测武器再用上面这句，现在先只给钱
	else
		Pay(100)
		Talk(1,"","C秏 琻 i hi謕! Ngi th藅 l� t鑤!")
		AddOwnExp(100)
		SetTask(65,11)
		AddRepute(4)
		AddNote("T譵 頲 Ng璾 Ng璾, cho 甶 m閠 m鉵 v� kh�, 駈g h� c m� l祄 i hi謕 c馻 n�. Ho祅 th祅h nhi謒 v�. ")
		Msg2Player("T譵 頲 Ng璾 Ng璾, 駈g h� c m� l祄 i hi謕 c馻 n�, cho n� m閠 輙 b筩. Ho祅 th祅h nhi謒 v�. ")
		Msg2Player("Kinh nghi謒 giang h� c馻 b筺  gia t╪g! ")
		Msg2Player("Thanh th� giang h� c馻 b筺  t╪g l猲 4 甶觤. ")
	end
end

function wait()
end
