function GameSvrConnected(dwGameSvrIP)
end

function GameSvrReady(dwGameSvrIP)
end

function TaskShedule()
	--���÷�������
	TaskName("Boss Ti�u Ho�ng Kim 22:00")
	
	--���ü��ʱ�䣬��λΪ����
	TaskInterval(1440)
	
	--���ô���������0��ʾ���޴���
	TaskCountLimit(0)
	
	--�趨��ʱ������ʱ��
	
	TaskTime(19, 00);
	
	--ɾ����ǰ������
	for i = 1, getn(tb_goldboss) do
		success = ClearRecordOnShareDB("GoldBoss", tb_goldboss[i].Sid, 0, 1, 0);
		OutputMsg("X�a d� li�u qu�i v�t Ho�ng kim trong database"..tb_goldboss[i].Sid);
	end
end

function TaskContent()
	for i = 1, getn(tb_goldboss) do
		str = tb_goldboss[i].str;
		GlobalExecute(format("dw AddLocalNews([[%s]])", str));
	end
	
	GlobalExecute("dwf \\script\\missions\\boss\\callboss_incity.lua CallBossDown_Fixure()");
end