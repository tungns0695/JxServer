-- ��Ȫ�塡·�ˡ����
-- by��Dan_Deng(2003-09-16)
Include("\\script\\lib\\awardtemplet.lua")

function main()
if (CalcEquiproomItemCount(6,1,5101,1) >= 1 and GetTask(14) == 130*256) then
Talk(1,"","Xin �a t� v� ��i hi�p ph�i V� H�n!")
ConsumeEquiproomItem(1,6,1,5101,-1)
SetTask(14,140*256)
Msg2Player("�� ph�t v�t t� sinh ho�t cho L� Giai.") 
else
Talk(1,"","Cha m� ta m�t s�m, ��i ca sung qu�n ��nh tr�n, may nh� c� H�ng T� nu�i d��ng, n�u kh�ng ta �� tr� th�nh m�t ng��i c� ��c")
end
end;
