-- ��Ȫ�塡·�ˡ���үү
-- by��Dan_Deng(2003-09-16)
Include("\\script\\lib\\awardtemplet.lua")

function main()
if (CalcEquiproomItemCount(6,1,5101,1) >= 1 and GetTask(14) == 140*256) then
Talk(1,"","Xin �a t� v� ��i hi�p ph�i V� H�n!")
ConsumeEquiproomItem(1,6,1,5101,-1)
SetTask(14,150*256)
tbAwardTemplet:GiveAwardByList({tbProp = {6,1,5102,1,0,0},nCount = 1, nBindState=-2},"Th� C�m T�",1);
Msg2Player("�� ph�t v�t t� sinh ho�t cho T�n Gia Gia. H�y quay v� b�o c�o v�i Nh�c ��nh.") 
else
Talk(1,"","Long xu�t Vu th�, Tuy�n ��ng vu th�. Long Tuy�n th�n c�a ch�ng ta v�n l� n�i ��a linh nh�n ki�t. Ttr��c ��y ta �� xem b�i, qu� n�i r�ng n�i ��y ng�y sau s� xu�t hi�n ��i anh h�ng ")
end
end;
