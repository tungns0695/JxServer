IncludeLib("SETTING"); --载入SETTING脚本指令库

function main()
	--Msg2Player("此功能稍后开放.多谢支持!")
	--return 1
	if (GetNpcExpRate() <= 100) then
		AddSkillState(440, 1, 1, 32400);
	else
		Say("Hi謓 t筰 h� th鑞g 產ng cho nh﹏ i kinh nghi謒, t筸 th阨 kh玭g th� s� d鬾g Tu th﹏ ph�.", 0)
		return 1
	end
	return 0
end