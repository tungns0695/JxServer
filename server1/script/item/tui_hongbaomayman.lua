-- ���������Ʒ��������һ����Ʒ��
-- By: Yuning_liu(2005-03-21)

function main(sel)
	p=random(0,99)
	if (p < 1) then
		p = random(238,240)
		AddEventItem(p)			-- Ë®ï¿½ï¿½
		Msg2Player("B�n nh�n ���c <color=yellow>Th�y tinh . ")
	elseif (p < 2) then
		AddEventItem(353)			-- ï¿½Éºï¿½
		Msg2Player("B�n nh�n ���c <color=yellow>Viªn tinh h�ng b�o th�ch. ")
        elseif (p < 33) then
		AddItem(6,1,1100,0,0,0)		-- ï¿½ï¿½ï¿½ï¿½
		Msg2Player("B�n nh�n ���c <color=yellow>B�nh kem. ")
	elseif (p < 33) then
		AddItem(4,417,1,0,0,0)		-- ï¿½ï¿½ï¿½ï¿½
		Msg2Player("B�n nh�n ���c <color=yellow>Ti�n ��ng may m�n. ")
	elseif (p < 66) then
		AddItem(4,417,1,0,0,0)		-- ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½Ó¡
		Msg2Player("B�n nh�n ���c <color=yellow>Ti�n ��ng may m�n! ")
	else
		AddItem(4,417,1,0,0,0)		-- Ãµï¿½ï¿½ï¿½ï¿½
		Msg2Player("B�n nh�n ���c <color=yellow>Ti�n ��ng may m�n!. ")
	end
	return 0
end
