-- ��Ȫ�塡·�ˡ�л��ü
-- by��Dan_Deng(2003-09-16)
Include("\\script\\lib\\awardtemplet.lua")

function main()
if (CalcEquiproomItemCount(6,1,5101,1) >= 1 and GetTask(14) == 110*256) then
Talk(1,"","Xin �a t� v� ��i hi�p ph�i V� H�n!")
ConsumeEquiproomItem(1,6,1,5101,-1)
SetTask(14,120*256)
Msg2Player("�� ph�t v�t t� sinh ho�t cho T� Thanh My.") 
else
Talk(1,"","Trai tr�ng trong th�n c�a ta h�u nh� ��u b� b�t �i l�nh h�t r�i. C�n s�ng tr� l�i kh�ng ���c m�y ng��i. Ch�ng ta �� ch�t t� hai n�m tr��c. M�t m�nh ta nu�i con th�t kh�ng ��n gi�n. Mu�n h�c theo Kh�ng gi�o th�t kh�ng d� ch�t n�o")
end
end;
