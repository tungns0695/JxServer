--description: 峨嵋派何怜飘
--author: yuanlan	
--date: 2003/3/3
-- Update: Dan_Deng(2003-08-12)

function main()
	UTask_em = GetTask(1);
	Uworld36 = GetByte(GetTask(36),1)
	if (Uworld36 == 40) then		--入门任务
		Msg2Player("Th� th竎h th� ba c馻 H� Linh Phi猽 l� i 3 c﹗ i. ")
		Say("Mu閕  vt qua 2 th� th竎h, c騨g c� ch髏 b秐 l躰h! Nh璶g n誹 i 頲 3 v� i c馻 ta, ta m韎 ph鬰 mu閕. V� i th� nh蕋 l�: Nh蕋 n l璾 th駓 t竔 n nguy謙.", 3, "B竛 nh藀 giang phong b竛 nh藀 v﹏ /True7", "Nh蕋 th鑞 tng t� nh蕋 th鑞 kh玦 /False7", "B竛 h祇 xu﹏ th駓 nh蕋 th祅h hoa /False7")
	elseif (Uworld == 60) then 					--完成前三关
		Talk(1,"","Ch骳 m鮪g mu閕  qua 3 c鯽 th� th竎h, h穣 甶 t譵 S� mu閕 <color=Red>T� V﹏ L﹗<color>! C� ta 產ng � <color=Red>l鑙 v祇 To祅 Thi猲 Ph�<color>.")
--	elseif ((UTask_em > 5*256) and (UTask_em < 10*256)) then 					--尚未入门
--		Talk(1,"","何怜飘：要想加入本派，必须先通过茶琴书的考验，然后再闯钻天坡得到白玉如意，你都做到了吗？")
--	elseif (GetFaction() == "emei") then   				--已经入门，尚未出师
--		Talk(1,"","何怜飘：现在咱们是同门好姐妹了，我真开心！")
	elseif (UTask_em == 70*256) then							--已经出师
		Talk(1,"","Tr猲 阯g phi猽 b箃 giang h�, nh� ng qu猲 nh鱪g t� mu閕 n琲 n祔! ")
	else
		Talk(1,"","Giang h� y hi觤 竎, v� l﹎ y chuy謓 th� phi!")
	end
end;

function False7()
Say("цi kh玭g ra �?", 3, "B竛 nh藀 giang phong b竛 nh藀 v﹏ /True7", "Nh蕋 th鑞 tng t� nh蕋 th鑞 kh玦 /False7", "B竛 h祇 xu﹏ th駓 nh蕋 th祅h hoa /False7");
end;

function True7()
Say("цi r蕋 ch豱h. V� i th� 2: T綾 th﹏ thi猲 a c竛h ho礽 c� ", 3, "V筺 l� bi thu thng t竎 kh竎h /False8", "Кn c Thng m穘g t� v辬h th� /True8", "Kh玭g m謓h tu� nguy謙 d辌h tha  /False8");
end;

function False8()
Say("Ch辵 thua sao?", 3, "V筺 l� bi thu thng t竎 kh竎h /False8", "Кn c Thng m穘g t� v辬h th� /True8", "Kh玭g m謓h tu� nguy謙 d辌h tha  /False8");
end;

function True8()
Say("Hay l緈! V� i th� 3 l�: Nh蕋 minh ph﹏ nh藅 nguy謙", 3, "T� canh t﹎ thng 甶襫 /False9", "Nh祅 khan m玭 trung m閏 /False9", "Ng� nh筩 c竎 kh﹗ s琻 /True9");
end;

function False9()
Say("H穣 ngh� l筰 甶, ng ph� c玭g v� 輈h! ", 3, "T� canh t﹎ thng 甶襫 /False9", "Nh祅 khan m玭 trung m閏 /False9", "Ng� nh筩 c竎 kh﹗ s琻 /True9");
end;

function True9()
	Talk(1,"","Ch骳 m鮪g mu閕  qua 3 c鯽 th� th竎h, h穣 甶 t譵 S� mu閕 <color=Red>T� V﹏ L﹗<color>! C� ta 產ng � <color=Red>l鑙 v祇 To祅 Thi猲 Ph�<color>.")
	Uworld36 = SetByte(GetTask(36),1,60)
	SetTask(36,Uworld36)
	AddNote("T筰 B竛 S琻 y猽 g苝 H� Linh Phi猽, tr� l阨 ch輓h x竎 ba c﹗ i, qua c鯽 秈 th� ba ")
	Msg2Player("T筰 B竛 S琻 Y猽 g苝 H� Linh Phi猽, tr� l阨 ch輓h x竎 ba c﹗ i, qua c鯽 秈 th� ba. V� To祅 Thi猲 Pha Nh藀 Kh萿 c馻 B竛 s琻 Y猽 t譵 T� V﹏ La s� mu閕 ti誴 nh薾 th� th竎h 'v� c玭g'. ")
end;
