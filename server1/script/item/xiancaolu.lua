IncludeLib("SETTING"); --载入SETTING脚本指令库

function main()
--	--Msg2Player("此功能稍后开放.多谢支持!")
--	--return 1
--	if (GetNpcExpRate() <= 100) then
if GetSkillState(440) > 0 then
 Say("B筺 產ng s礽 Ti猲 Th秓 L�. Xin H穣 Ti誸 Ki謒")
 return 1
end
		AddSkillState(440, 1, 1, 64800,1);
--	else
--		Say("Xin l鏸! T筸 th阨 kh玭g th� s� d鬾g 頲 Ti猲 Th秓 L�. ", 0)
--		return 1
--	end
--	return 0
end