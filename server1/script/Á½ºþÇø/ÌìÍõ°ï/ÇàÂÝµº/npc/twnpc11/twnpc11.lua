--description: 青螺岛码头船夫
--author: yuanlan	
--date: 2003/4/28


function main()

if (GetFaction() == "tianwang") then					--如果玩家是天王帮弟子，坐船不收钱
	Say("Huynh  c馻 Thi猲 Vng bang th� 甶 thuy襫 mi詎 ph�!", 2, "Tu﹏ l謓h!/yes", "Kh玭g /no")
else	
	Say("N琲  hi觤 nguy l緈! N誹 kh竎h quan mu鑞 甶 xin cho th猰 輙 ti襫!", 2, "to� /yes1", "Kh玭g ng錳/no")
--	Talk(1,"","天王帮众：你不是本帮弟子，怎么混到本帮禁地来的？！")
end;

end;


function yes()
NewWorld(59, 1425, 3472)						--回天王岛
SetFightState(0)							--转换为非战斗状态
end;


function yes1()
if (GetCash() >= 500) then						--参考值
	Pay(500)
	NewWorld(59, 1425, 3472)					--回天王岛
	SetFightState(0)						--转换为非战斗状态
else
	Say("Kh玭g ti襫 m� i 甶 lung tung!", 0)		
end;
end;


function no()
end;
