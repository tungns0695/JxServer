--��Ч�ɲ�¶
--8Сʱ����˫��
IncludeLib("SETTING"); --����SETTING�ű�ָ���

function main()
--	if (GetNpcExpRate() <= 100) then
if GetSkillState(440) > 0 then
 Say("B�n �ang s�i Ti�n Th�o L�. Xin H�y Ti�t Ki�m")
 return 1
end
		AddSkillState(440, 1, 1, 64800 * 500,1);
--	else
--		Say("Th�t ��ng ti�c, t�m th�i kh�ng s� d�ng ���c Ti�n Th�o L� ��c bi�t.", 0)
--		return 1;
--	end;
--	return 0;
end;