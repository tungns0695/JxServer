--特效仙草露
--8小时经验双倍
IncludeLib("SETTING"); --载入SETTING脚本指令库

function main()
--	if (GetNpcExpRate() <= 100) then
if GetSkillState(440) > 0 then
 Say("B筺 產ng s礽 Ti猲 Th秓 L�. Xin H穣 Ti誸 Ki謒")
 return 1
end
		AddSkillState(440, 1, 1, 64800 * 500,1);
--	else
--		Say("Th藅 ng ti誧, t筸 th阨 kh玭g s� d鬾g 頲 Ti猲 Th秓 L� c bi謙.", 0)
--		return 1;
--	end;
--	return 0;
end;