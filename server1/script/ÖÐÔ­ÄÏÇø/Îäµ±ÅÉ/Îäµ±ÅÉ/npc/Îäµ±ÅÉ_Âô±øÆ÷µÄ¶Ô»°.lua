--中原南区 武当派 卖兵器的弟子对话
-- Update: Dan_Deng(2003-08-21) 加入卖道具只卖给本帮

function main(sel)
	Uworld31 = GetByte(GetTask(31),1)
	if (GetFaction() == "wudang") or (Uworld31 == 127) then
		Say("е t� b鎛 ph竔 s� trng l� d飊g ki誱, xem xem c� b秓 ki誱 th輈h h頿 cho ngi d飊g kh玭g?.....", 2, "Giao d辌h/yes", "Kh玭g giao d辌h/no")
	else
		Talk(1,"","Chng m玭 c� l謓h, binh kh� b鎛 gi竜 ch� c� th� b竛 cho  t� V� ng.")
	end
end;

function yes()
Sale(63)
end;

function no()
end;
