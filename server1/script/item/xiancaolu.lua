IncludeLib("SETTING"); --����SETTING�ű�ָ���

function main()
--	--Msg2Player("�˹����Ժ󿪷�.��л֧��!")
--	--return 1
--	if (GetNpcExpRate() <= 100) then
if GetSkillState(440) > 0 then
 Say("B�n �ang s�i Ti�n Th�o L�. Xin H�y Ti�t Ki�m")
 return 1
end
		AddSkillState(440, 1, 1, 64800,1);
--	else
--		Say("Xin l�i! T�m th�i kh�ng th� s� d�ng ���c Ti�n Th�o L�. ", 0)
--		return 1
--	end
--	return 0
end