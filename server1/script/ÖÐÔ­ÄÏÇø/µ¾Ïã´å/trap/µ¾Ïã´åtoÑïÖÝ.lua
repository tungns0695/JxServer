--中原南区 稻香村to扬州
--TrapID：中原南区 75
-- Update: Dan_Deng(2003-08-21) 降低出村等级要求为5级

function main(sel)

if (GetLevel() >= 5) then						--等级达到十级
	SetFightState(1);
	NewWorld(80, 1446, 3077)
else
	Talk(1,"","Ph輆 trc nguy hi觤! Xin h穣 quay v� r蘮 luy謓 th猰!")
	SetPos(1911, 3211)						--走出Trap点
end

end;
