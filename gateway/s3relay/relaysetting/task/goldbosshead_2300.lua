Include("\\script\\mission\\bossnew\\callboss_new.lua")
Include("\\script\\lib\\objbuffer_head.lua")
Include("\\script\\lib\\remoteexc.lua")

function GameSvrConnected(dwGameSvrIP)
end

function GameSvrReady(dwGameSvrIP)
end

function TaskShedule()
	--设置方案名称
	TaskName("Boss Ho祅g Kim 2300")
	
	--设置间隔时间，单位为分钟
	TaskInterval(1440)
	
	--设置触发次数，0表示无限次数
	TaskCountLimit(0)
	
	--设定定时期启动时间
	
	TaskTime(23, 0);
	
	--删除从前的数据
	for i= 1, getn(tb_goldboss) do
		success = ClearRecordOnShareDB("GoldBoss", tb_goldboss[i].Sid, 0, 1, 0);
		OutputMsg("X鉧 d� li謚 qu竔 v藅 Ho祅g kim trong database"..tb_goldboss[i].Sid);
	end
end

function TaskContent()
	for i = 1, getn(tb_goldboss) do
		str = tb_goldboss[i].str;
		GlobalExecute(format("dw AddLocalNews([[%s]])", str));
	end
	local tbTempData = tbCallBossNewRandom:GetBossPosS3();
	local ResHandle = OB_Create()
	for _,k in tbTempData do
		ObjBuffer:PushObject(ResHandle, k.nId)
	end
	RemoteExecute("\\script\\missions\\boss\\callboss_new.lua", "tbCallBossNewRandom:CallBossNewFixureGS",ResHandle);
	OB_Release(ResHandle)
	
	OutputMsg("***====Ho箃 ng Boss Ti觰 xu蕋 hi謓====***")
	----GlobalExecute("dwf \\script\\missions\\boss\\callboss_incity.lua CallBossDown_Fixure()");
end

