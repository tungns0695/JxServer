-- ��Ȫ�塡·�ˡ�������
-- by��Dan_Deng(2003-09-16)
Include("\\script\\lib\\awardtemplet.lua")

function main()
if (CalcEquiproomItemCount(6,1,5101,1) >= 1 and GetTask(14) == 120*256) then
Talk(1,"","Xin �a t� v� ��i hi�p ph�i V� H�n!")
ConsumeEquiproomItem(1,6,1,5101,-1)
SetTask(14,130*256)
Msg2Player("�� ph�t v�t t� sinh ho�t cho M�nh B� B�.") 
else
Talk(1,"","Long Tuy�n th�n tr��c kia v�n l� m�t n�i y�n b�nh. T� khi Ho�ng �� d�i ��, n�i ��y b�t ��u lo�n, v� m�t ch�ng, con m�t cha ")
end
end;