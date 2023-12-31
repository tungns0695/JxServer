--中原南区 扬州府 酒楼老板对话（丐帮10级任务、丐帮90技能任务、拳倾天下任务）
-- by：Dan_Deng(2003-07-28)

function main()
	UTask_gb = GetTask(8)
	if (UTask_gb == 10*256+10) then		--10级任务中
		SetTask(8,10*256+20)
		Talk(4,"L10_buy","g ch�! Ta mu鑞 mua ru!","Th� kh竎 th� ta kh玭g c�, ch� c� ru l� nhi襲 kh竎h quan mu鑞 mua ru g�?","Hu� Tuy襫 T鰑, Kim L╪g Xu﹏, B竎h Hoa Nhng, Kinh Hoa L� v� Song C﹗ Чi Kh骳.","竔 da, kh玭g may Hu� Tuy襫 T鰑  b竛 h誸 r錳, c遪 m閠 b譶h cu鑙 c飊g t猲 ma men T髖 B竛 Ti猲 n鎖 ti課g trong th祅h mua 甶 m蕋. Ch綾 gi� n祔 h緉 產ng vui v� say men ru. C遪 l筰 4 lo筰 ru u c�, nh璶g b雐 u l� ru danh ti課g, v� v藋 kh玭g th� b竛 r� 頲!")
	elseif (UTask_gb >= 10*256+20) and (UTask_gb < 20*256) then		--　道具丢失处理
		if (HaveItem(77) == 0) then
			Say("Kim L╪g Xu﹏ v鮝 th琺 v鮝 ng﹜ ng蕋, ch� c莕 400 lng, m阨 nhanh ch﹏ v祇 mua!",2,"Mua/L10_buy_yes1","Kh玭g mua/L10_buy_no")
		elseif (HaveItem(78) == 0) then
			Say("B竎h Hoa Nhng v� ng鋞 th琺 n錸g, ch� c莕 400 lng, m阨 nhanh ch﹏ v祇 mua!",2,"Mua/L10_buy_yes2","Kh玭g mua/L10_buy_no")
		elseif (HaveItem(79) == 0) then
			Say("Kinh Hoa L� ng鋞 th琺 n鴗 m騣, ch� c莕 400 lng, m阨 nhanh ch﹏ v祇 mua!",2,"Mua/L10_buy_yes3","Kh玭g mua/L10_buy_no")
		elseif (HaveItem(80) == 0) then
			Say("Song C﹗ Чi Kh骳 m n錸g, ch� c莕 400 lng, m阨 nhanh ch﹏ v祇 mua!",2,"Mua/L10_buy_yes4","Kh玭g mua/L10_buy_no")
		else
			Talk(1,"","C竎 lo筰 m� t鰑 th琺 ng﹜ ng蕋! Hng bay tr╩ d苖, ng蕋 ng﹜ l遪g ngi!")
		end
	elseif (GetTask(128) == 10) and (HaveItem(76) == 0) then			-- 丐帮90技能任务
		Say("Hu� Tuy襫 T鰑 th琺 ng﹜ ng蕋! ch� c莕 1000 lng, m阨 nhanh ch﹏ v祇 mua!",2,"Mua/U128_10","Kh玭g mua/L10_buy_no")
	elseif (GetTask(75) == 10) and (GetTask(55) == 10) and (HaveItem(77) == 0) then			-- 拳倾天下任务
		Say("Kim L╪g Xu﹏ v鮝 th琺 v鮝 ng﹜ ng蕋, ch� c莕 800 lng, m阨 nhanh ch﹏ v祇 mua!",2,"Mua/U75_10","Kh玭g mua/L10_buy_no")
	else
		Talk(1,"","дn t Dng Ch﹗ c秐h p, l筰 l緈 m� n�, sao c� th� thi誹 ru ngon? Kh竎h quan! U鑞g ch髏 ru ngon ch�!")
	end
end;

function U75_10()
	if (GetCash() >= 800) then
		Pay(800)
		AddEventItem(77)
		Msg2Player("C� Kim L╪g Xu﹏ ")
	else
		L10_buy_noMoney()
	end
end

function U128_10()
	if (GetCash() >= 1000) then
		Pay(1000)
		AddEventItem(76)
		Msg2Player("C� ru Hu� tuy襫 ")
	else
		L10_buy_noMoney()
	end
end

function L10_buy()
	Say("Ngo礽 4 lo筰 ru, t輓h kh竎h quan 1200 lng! Mu鑞 mua kh玭g?",2,"Mua/L10_buy_yes","Kh玭g mua/L10_buy_no")
end;

function L10_buy_yes()
	if (GetCash() >= 1200) then
		Pay(1200)
		AddEventItem(77)
		AddEventItem(78)
		AddEventItem(79)
		AddEventItem(80)
		AddNote("C� 4 lo筰 m� t鰑 Kim L╪g Xu﹏, B竎h Hoa Xu﹏, Kinh Hoa L�, Song C﹗ Чi Kh骳 ")
		Msg2Player("C� 4 lo筰 m� t鰑 Kim L╪g Xu﹏, B竎h Hoa Xu﹏, Kinh Hoa L�, Song C﹗ Чi Kh骳 ")
	else
		L10_buy_noMoney()
	end
end;

function L10_buy_no()
	Talk(1,"","эa �! Cp ngi ta hay sao? Kh玭g mua, quy誸 kh玭g mua!")
end;

function L10_buy_yes1()
	if (GetCash() >= 400) then
		Pay(400)
		AddEventItem(77)
		Msg2Player("C� Kim L╪g Xu﹏ ")
	else
		L10_buy_noMoney()
	end
end;

function L10_buy_yes2()
	if (GetCash() >= 400) then
		Pay(400)
		AddEventItem(78)
		Msg2Player("C� B竎h Hoa Xu﹏ ")
	else
		L10_buy_noMoney()
	end
end;

function L10_buy_yes3()
	if (GetCash() >= 400) then
		Pay(400)
		AddEventItem(79)
		Msg2Player("C� Kinh Hoa L� ")
	else
		L10_buy_noMoney()
	end
end;

function L10_buy_yes4()
	if (GetCash() >= 400) then
		Pay(400)
		AddEventItem(80)
		Msg2Player("C� Song C﹗ Чi Kh骳 ")
	else
		L10_buy_noMoney()
	end
end;

function L10_buy_noMoney()
	Talk(1,"","Kh玭g c� ti襫? V藋 kh玭g 頲 r錳!")
end;
