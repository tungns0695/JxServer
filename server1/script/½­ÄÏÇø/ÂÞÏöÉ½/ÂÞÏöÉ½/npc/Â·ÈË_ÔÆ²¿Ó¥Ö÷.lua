-- 江南区 罗宵山 路人_云部鹰主.lua （消灭采花贼任务）
-- By: Dan_Deng(2004-05-28)

function main(sel)
	Uworld43 = GetTask(43)
	if (Uworld43 == 50) then
		Talk(5,"U43_50","Ngi  c� 頲 ch譨 kh鉧 r錳. C遪 mu鑞 h醝 ta g� n鱝?","Gi髉 cho k� 竎, s� b� thi猲 h� nguy襫 r馻!","N鉯 x祄! C竔 g� ch竛h? C竔 g� t�?! Ta th輈h l祄 甶襲 竎 ! Ngi l祄 g� ta n祇?","V藋 ta xin c t閕!","H鮩! Ngi ch璦 c� t� c竎h  u v韎 ta! в ta cho b鋘  t� S琻 g a v韎 ngi m閠 ch髏")
	elseif (Uworld43 == 70) then						-- 打完山鹰，来拿钥匙
		Talk(2,"U43_70","H穣 mau giao ch譨 kh鉧 ra y!","H秓 ti觰 t�! Ngi i y! Ch� nh﹏ nh蕋 nh s� b竜 th� cho L玦 V﹏ nh� b� ")
	elseif (Uworld43 >= 80) and (Uworld43 < 100) and (HaveItem(382) == 0) then				-- 或之后的任一步骤中钥匙丢失
		AddEventItem(382)
		Msg2Player("Ti誴 t鬰 l蕐 頲 V﹏ thc. ")
		Talk(1,"","H筺g ti觰 t鑤 nh� ngi th� xem c� th� l祄 頲 c竔 g�. Ch譨 kh鉧 產ng � y, n誹 nh� ngi c� th� ti誴 頲 ta 3 chi猽, th� s� giao cho ngi")
	elseif (Uworld43 >= 80) and (Uworld43 < 255) and (HaveItem(382) == 1) then
		Talk(1,"","Ngi  c� 頲 ch譨 kh鉧 r錳. C遪 mu鑞 h醝 ta g� n鱝?")
	elseif (Uworld43 == 60) then		-- 对话完成，打狂狼未完成
		Talk(1,"","H鮩! Ngi ch璦 c� t� c竎h  u v韎 ta! в ta cho b鋘  t� S琻 g a v韎 ngi m閠 ch髏")
	elseif (Uworld43 >= 255) then
		Talk(1,"","Ngi匩gi th藅 s�  gi誸 thi誹 ch�?")
	else
		Talk(1,"","ng c� l秏 nh秏 n鱝! Ch璦 th蕐 b� d筺g n祔 bao gi� sao?")
	end
end;

function U43_50()
	SetTask(43,60)
	Msg2Player("Ngi th藅 s�  gi誸 ch誸 thi誹 ch�? ")
end

function U43_70()
	SetTask(43,80)
	AddEventItem(382)
	Msg2Player("Х l蕐 頲 V﹏ thc, tr� v� L﹎ An giao cho C玭g Sai i ca, b祅 b祅 k� ho筩h ti誴 theo ")
end
