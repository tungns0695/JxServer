--中原北区 宋金战场 金军重生点军医
--李欣 2004-10-14

function main(sel)
if (GetCurCamp() == 2) then
	SetFightState(0)
	Say("Tng qu﹏ c莕 mua g� kh玭g?", 2, "Mua thu鑓 /yes", "Kh玭g mua/no")
else
	Talk(1,"","Nh譶 m苩 ngi l蕀 la l蕀 l衪! Mu鑞 l鮝 g箃 ta b竛 th莕 dc c馻 i Kim qu鑓 cho ngi �?")
end;
end;

function yes()
Sale(53)
end;

function no()
end;