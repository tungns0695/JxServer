
-- ====================== 文件信息 ======================

-- 剑侠情缘online 随机任务任务卷轴触发脚本 - 帮会令牌特别版
-- Edited by peres
-- 2005/09/01 PM 16:40

-- 只有他和她两个人
-- 他们相爱
-- 她记得
-- 他的手抚摩在她的皮肤上的温情
-- 他的亲吻像鸟群在天空掠过
-- 他在她身体里面的暴戾和放纵
-- 他入睡时候的样子充满纯真
-- 她记得，清晨她醒过来的一刻，他在她的身边
-- 她睁着眼睛，看曙光透过窗帘一点一点地照射进来
-- 她的心里因为幸福而疼痛

-- ======================================================

-- 任务系统库支持
IncludeLib("TASKSYS");

-- 同伴系统的支持
IncludeLib("PARTNER");

-- 读入任务系统头文件，包含随机任务
Include("\\script\\task\\system\\task_main.lua");

strPublic       = "<color=green>L謓h b礽 nhi謒 v�<color>:";

local TSK_UseCountPerDay = 2589;

function main(nIndex)

	local partnerindex,partnerstate = PARTNER_GetCurPartner()       -- 获得召唤出同伴的index,同伴状态为召出或为不召出
	
	local nTaskID = GetItemMagicLevel(nIndex, 1);
	
	local nNowTaskID = GetTask(ID_RANDOMTASK);  -- 获取当前令牌任务的 ID
	
	local nTaskState = 0;  -- 当前令牌任务的状态

	if (GetProductRegion() == "cn") then
		-- 判断是否召唤出同伴
		if partnerindex==0 or partnerstate==0 then
			Msg2Player(strPublic.."<color=yellow>Ch璦 g鋓 ra b筺 ng h祅h, kh玭g th� c 頲 n閕 dung trong l謓h b礽!<color>");
			return 1;
		end;
	end;
	
	if nNowTaskID ~= 0 then
		nTaskState = GetTaskStatus(TaskName(GetTask(ID_RANDOMTASK)));
	end;
	
	local nUseState = GetTask(%TSK_UseCountPerDay)
	local nCurDate = tonumber(GetLocalDate("%y%m%d"))
	local nPerDayUseCount = 100
	if floor(nUseState / 256) ~= nCurDate then
		
		nUseState = nCurDate * 256
		SetTask(%TSK_UseCountPerDay, nUseState)
	end
	
	if mod(nUseState, 256) >= nPerDayUseCount then
		
		Talk(1, "", format("M鏸 ng祔 m鏸 ngi ch琲 ch� 頲 s� d鬾g v藅 ph萴 n祔 %d l莕.", nPerDayUseCount))
		return 1
		
	end
	
	
	if nTaskState>0 and nTaskState<3 then
		Say("<color=green>L謓h b礽 nhi謒 v�<color>: Hi謓 t筰 c� nhi謒 v� ng蓇 nhi猲 ch璦 ho祅 th祅h, v蒼 mu鑞 ti誴 nh薾 nhi謒 v� m韎 sao?",
			2,
			"ng v藋, ta mu鑞 h駓 b� nhi謒 v� trc y/#_confirmRandomBookTask("..nIndex..")",
			"Kh玭g ph秈, i m閠 l竧 !/OnTaskWait");
		return 1;
	else
		
		-- 清空任务卷轴里面记载的任务，否则不能用任务引擎开始
		SetTaskStatus(TaskName(nTaskID), 0);
		CloseTask(TaskName(nTaskID));

		-- 将待接的任务储存在临时变量中
		SetTask(ID_RANDOMTASK_WAIT, nTaskID);
		
		-- 同步任务变量
		SyncTaskValue(ID_RANDOMTASK_WAIT);
	
		-- 存储物品 INDEX 在任务变量中
		SetTask(ID_RANDOMTASKTEMP, nIndex)		
		
		ApplyTask( TaskName(nTaskID) );
		
		
		SetTask(%TSK_UseCountPerDay, nUseState + 1);
		
		return 1;
	end;

end;


-- 确认接受卷轴任务
function _confirmRandomBookTask(nIndex)

local nTaskID = GetItemMagicLevel(nIndex, 1);

	-- 清空当前正在做的卷轴任务
	SetTaskStatus(TaskName(GetTask(ID_RANDOMTASK)), 0);
	CloseTask(TaskName(GetTask(ID_RANDOMTASK)));

	-- 清空任务卷轴里面记载的任务，否则不能用任务引擎开始
	SetTaskStatus(TaskName(nTaskID), 0);
	CloseTask(TaskName(nTaskID));
	
	-- 将待接的任务储存在临时变量中
	SetTask(ID_RANDOMTASK_WAIT, nTaskID);
		
	-- 同步任务变量
	SyncTaskValue(ID_RANDOMTASK_WAIT);
	
	-- 存储物品 INDEX 在任务变量中
	SetTask(ID_RANDOMTASKTEMP, nIndex);
	
	ApplyTask( TaskName(nTaskID) );
	SetTask(%TSK_UseCountPerDay, GetTask(%TSK_UseCountPerDay) + 1);
	
	return
	
end;