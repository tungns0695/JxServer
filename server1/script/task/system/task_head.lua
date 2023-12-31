
-- ====================== 文件信息 ======================

-- 剑侠情缘online 任务系统回调函数头文件
-- Edited by peres
-- 2005/07/04 PM 19:59

-- 烟花。那一夜的烟花。
-- 她记得他在大雨的人群中，站在她的背后拥抱住她。
-- 他温暖的皮肤，他熟悉的味道。烟花照亮她的眼睛。
-- 一切无可挽回……

-- ======================================================

-- 任务系统库支持
IncludeLib("TASKSYS");

-- 物品库支持
IncludeLib("ITEM");

-- 随机任务的处理支持
Include("\\script\\task\\random\\task_head.lua");


-- 任务过程间传递任务 ID 的临时变量号
TASK_TEMP_ID = 201;

-- 用于临时记录的物品 ID 总数
TASK_CHECKITEM_NUM = 202;

-- 用于临时记录的物品 ID 起始变量号
TASK_CHECKITEM_START = 203;

-- 用于临时记录的物品 ID 最大数
TAKS_CHECKITEM_MAX = 20;


TaskID_Table = {
	CanCancel    = 4,
	TaskText_Row = 5,
}

-- 任务条件的表格定义
Condition = {

	TaskType_Row    = 1,
	TaskDesc_Row    = 2,
	
	TaskStart       = "B総 u nhi謒 v� ",	
	TaskEnd         = "K誸 th骳 nhi謒 v� ",
	LevelMore       = "ng c蕄 l韓 ",
	LevelLess       = "ng c蕄 nh� ",
	LevelEqual      = "ng c蕄",
	ValueMore       = "thay i l韓",
	ValueLess       = "thay i nh� ",
	ValueEqual      = "thay i",
	ReputeMore      = "danh v鋘g l韓",
	HaveItem        = "v藅 ph萴",
	
	CanRestart      = "C� th� thi tri觧 ti誴",

}

-- 任务内容的表格定义
Entity = {

	TaskType_Row          = 1,
	Goods_Genre_Row       = 2,
	Goods_Detail_Row      = 3,
	Goods_Particular_Row  = 4,
	Goods_Level_Row       = 5,
	Goods_GoodsFive_Row   = 6,
	Goods_Quality_Row     = 7,
	Goods_GoodsNum_Row    = 8,
	Goods_DelGoods_Row    = 9,
	Goods_RecordSeed_Row  = 10,
	Money_Row             = 11,
	KillNpcName_Row       = 12,
	DropItemRate_Row      = 13,
	TalkNpcName_Row       = 14,
	TalkNpcMap_Row        = 15,
	TaskText_Row          = 16,
	
	Collect               = "thu th藀 v藅 ph萴 ",
	CollectGoldItem       = "thu th藀 Trang b� Ho祅g Kim",
	CollectNpcItem		  = "Gi誸 qu竔 r琲 ra v藅 ph萴",
	KillNpc               = "s竧 qu竔",
	TalkNpc               = "цi tho筰",

}

-- 任务奖励的表格定义
Award = {

	AwardType_Row         = 1,
	AwardText_Row         = 2,
	Goods_Genre_Row       = 3,
	Goods_Detail_Row      = 4,
	Goods_Particular_Row  = 5,
	Goods_Level_Row       = 6,
	Goods_GoodsFive_Row   = 7,
	Goods_Quality_Row     = 8,
	Goods_RandomSeed_Row  = 9,
	Goods_GoodsNum_Row    = 10,
	MoneyNum_Row          = 11,
	ExpNum_Row            = 12,
	ReputeNum_Row         = 13,
	AwardTask_Row         = 14,
	SelectTask_Row        = 15,
	ArrayID_Row           = 16,
	ArrayRate_Row         = 17,
	AlliedAward_Row       = 18,
	
	Money                 = "Ti襫",
	Exp                   = "kinh nghi謒 ",
	Goods                 = "v藅 ph萴 ",
	GoldItem              = "Trang b� Ho祅g Kim",
	Task                  = "B総 u nhi謒 v� ",
	RandomTask            = "Ng蓇 nhi猲_M藅  nhi謒 v� ",  -- 特殊的奖励类型，调用特定的过程产生一个任务卷轴
	AlliedAwardIndex      = "h� th鑞g ph莕 thng",      -- 特殊的奖励类型，直接索引到别的任务奖励上，并派发一模一样的奖励
	TreasureMap           = "T祅g B秓 у",        -- 特殊的奖励类型，调用特定的过程给玩家发一张藏宝图
	
}

-- 任务临时变量的存储 ID 定义
TmpType = {
	
	Collect        = "Collect",
	CollectGold    = "CollectGold",
	KillNpc        = "KillNpc",
	TalkNpc        = "TalkNpc",
	ItemNpc        = "ItemNpc",
	ItemRate       = "ItemRate",
	ItemSeed       = "ItemSeed",

}

-- 获取一个任务的简要描述
function GetTaskText(taskName)

local strText = TaskId(TaskNo(taskName), 1, TaskID_Table.TaskText_Row);

	if strText==nil then strText=""; end;
	
	return strText;
end;


-- 获取一个任务所属的事件名
function GetTaskEventName(taskName)

local nEventID = GetTaskEventID(taskName)
	return TaskEvent(nEventID, 1, 1);
end;


-- 检查一个任务是否可以取消
function CheckTaskCanCancel(taskName)
	local nCanCancel = tonumber(TaskId(TaskNo(taskName), 1, TaskID_Table.CanCancel));
	
	if nCanCancel~=nil and nCanCancel~=0 then
		return 1;
	else
		return 0;
	end;
	
end;


-- 询问是否取消任务
function CancelTaskConfirm(nTaskID)
	local taskName = TaskName(nTaskID);
	local szText = GetTaskText(taskName);
	
	Say("Th藅 s� mu鑞 h駓 b� nhi謒 v� n祔 kh玭g: <color=yellow>"..szText.."<color>.", 
		2,
		"Mu鑞/#CancelTaskMain("..nTaskID..")",
		"Kh玭g mu鑞/Task_Exit");
end;


-- 取消任务的主过程
function CancelTaskMain(nTaskID)
	
	local taskName = TaskName(nTaskID);
	local szText = GetTaskText(taskName);
	
		SetTaskStatus(taskName, 0);
		CloseTask(taskName);
		
		Msg2Player("Х h駓 b� th祅h c玭g: <color=yellow>"..szText.."<color>.");
		
		WriteTaskLog("H駓 b� nhi謒 v�:"..taskName);
		
end;


-- 执行任务对话
function ShowTaskSay(taskID)

local taskName = TaskName(taskID)

	OnTaskSay_Call(taskName, GetTaskStatus(taskName));
	
end;


-- 用对话面版显示任务的详细信息
function ShowTaskInfo(taskID)

local taskName = TaskName(taskID);
local strInfo = TaskTalk(taskName, 1, 6);

	Say(strInfo, 1, "Tr� l筰/#BackTaskStart("..TaskNo(taskName)..")");

end;


-- 返回任务对话主面版
function BackTaskStart(taskID)
	OnTaskSay_Call(TaskName(taskID), 0);
end;


-- 获取一个任务所需要的完成条件数量
function GetTaskFinishConditionNum(taskName)
	local nRow, nCol = TaskEntityMatrix(taskName);
	local nRightCheck = nRow;
	local i=0;
	
	for i=1, nRow do
		strType = TaskEntity(taskName, i, Entity.TaskType_Row);
		-- 如果有收集怪物掉落物品的任务，则不计算
		if strType==Entity.CollectNpcItem then
			nRightCheck = nRightCheck - 1;
		end;
	end;
	
	return nRightCheck;
end;


-- 获取一个任务的搜集类型是物品还是黄金装备
-- 返回值：1 为物品，2 为黄金装备，nil 为没收集任务
function GetTaskCollectType(taskName)

local nRow, nCol = TaskEntityMatrix(taskName);	
local checkType = nil;
local i=0;

	-- 检查此任务是找黄金装备还是找普通物品
	for i=1, nRow do
		
		-- 是黄金装备
		if TaskEntity(taskName, i, Entity.TaskType_Row)==Entity.CollectGoldItem then
			checkType=2;
		end;
		
		-- 是普通物品
		if TaskEntity(taskName, i, Entity.TaskType_Row)==Entity.Collect then
			checkType=1;
		end;
		
	end;
	
	return checkType;
	
end;

-- 返回一个任务中收集类型的物品数组
-- 物品数组类型：{nGenre, nDetail, nParticular, nLevel, nGoodsFive, nNum, nIsDel}
-- 黄金装备数组类型：{nQuality, nNum, nIsDel}
function GetTaskCollectArray(taskName, nType)

local nGenre, nDetail, nParticular, nLevel, nGoodsFive = 0,0,0,0,0;
local nQuality, nGoodsNum, nDelGoods = 0,0,0;

local nRow, nCol = TaskEntityMatrix(taskName);
local aryCollect = {}
local i=0;

	if (nType==1) then
		for i=1, nRow do
		
			nGenre      = tonumber(TaskEntity(taskName, i, Entity.Goods_Genre_Row));
			nDetail     = tonumber(TaskEntity(taskName, i, Entity.Goods_Detail_Row));
			nParticular = tonumber(TaskEntity(taskName, i, Entity.Goods_Particular_Row));
			nLevel      = tonumber(TaskEntity(taskName, i, Entity.Goods_Level_Row));
			nGoodsFive  = tonumber(TaskEntity(taskName, i, Entity.Goods_GoodsFive_Row));
			nGoodsNum   = tonumber(TaskEntity(taskName, i, Entity.Goods_GoodsNum_Row));
			nDelGoods   = tonumber(TaskEntity(taskName, i, Entity.Goods_DelGoods_Row));
			
			if TaskEntity(taskName, i, Entity.TaskType_Row)==Entity.Collect then
				rawset(aryCollect,
						getn(aryCollect)+1,
						{nGenre,
						 nDetail,
						 nParticular,
						 nLevel,
						 nGoodsFive,
						 nGoodsNum,
						 nDelGoods
						}
						);
			end;
		end;
	end;
	
	if (nType==2) then
		for i=1, nRow do
			nQuality    = tonumber(TaskEntity(taskName, i, Entity.Goods_Quality_Row));
			nGoodsNum   = tonumber(TaskEntity(taskName, i, Entity.Goods_GoodsNum_Row));
			nDelGoods   = tonumber(TaskEntity(taskName, i, Entity.Goods_DelGoods_Row));
			
			if TaskEntity(taskName, i, Entity.TaskType_Row)==Entity.CollectGoldItem then
				rawset(aryCollect,
						getn(aryCollect)+1,
						{nQuality,
						 nGoodsNum,
						 nDelGoods
						}
						);
			end;
		end;
	end;
	
	return aryCollect;

end;

-- 取得一个任务所要收集物品的总数
function GetTaskCollectNum(taskName)

local nNum = 0;
local strType = "";
local nRow, nCol = TaskEntityMatrix(taskName);

local i=0;

	for i=1, nRow do
		strType = TaskEntity(taskName, i, Entity.TaskType_Row);
		if strType==Entity.Collect or strType==Entity.CollectGoldItem then
			nGoodsNum   = tonumber(TaskEntity(taskName, i, Entity.Goods_GoodsNum_Row));
			nNum = nNum + nGoodsNum;
		end;
	end;
	
	return nNum;
	
end;


-- 取得一任务收集物品的行数
function GetTaskCollectRow(taskName)

local aryRow = {}
local nRow, nCol = TaskEntityMatrix(taskName);
local i=0;

	for i=1, nRow do
	
		strType = TaskEntity(taskName, i, Entity.TaskType_Row);
		nGoodsNum   = tonumber(TaskEntity(taskName, i, Entity.Goods_GoodsNum_Row));
		
		if strType==Entity.Collect or strType==Entity.CollectGoldItem then
		
			if aryRow[i]==nil then rawset(aryRow, i, {}); end;
			
			rawset(aryRow, i, {nGoodsNum, 0});
		end;
		
	end;
	
	return aryRow;

end;


-- 发奖的主函数入口，只需调用次函数即可实现完整的发奖
-- 传入参数：string:taskName 发奖的任务名称
-- 传入参数：nAlliedTask 可选参数，如果非空，则表明是由索引奖励来发奖
function PayAwardMain(taskName, nAlliedTask)

	local nRow, nCol = TaskAwardMatrix(taskName);
	local nResult = 0; -- 发奖的结果，如果有开始新任务的话则返回 1
	local i=0;
	
	local aryAward = {{}};
	local strType = "";
	local strArray = "";
	local strArrayRate = "";
	
	local nIsArray = 0; -- 判断是否有数组
	
	local nAdd = 0; -- 计算概率时累加的变量
	local nRandom = 0; -- 取的随机值
	
	local nIsTaskStart = 0;  -- 是否开始新任务


	-- 如果非空，则表明是由索引奖励调用此过程来发奖
	if nAlliedTask==nil then
		nAlliedTask = 0;
	end;
	
		CDebug:MessageOut(taskName.."ph莕 thng khi b総 u nhi謒 v� ");
	
		for i=1, nRow do
		
			strType = TaskAward(taskName, i, Award.AwardType_Row);
			strArray = TaskAward(taskName, i, Award.ArrayID_Row);
			strArrayRate = TaskAward(taskName, i, Award.ArrayRate_Row);
			
			-- 如果奖励被定义了数组
			if strArray~="" then
			
				CDebug:MessageOut(taskName.."s� ph莕 thng bao g錷.");
				
				-- 如果数组不存在则初始化数组
				if aryAward[tonumber(strArray)]==nil then
					CDebug:MessageOut(taskName.."b総 u m� thng"..tonumber(strArray));
					rawset(aryAward, tonumber(strArray), {}); 
				end;
				
				 rawset(aryAward[tonumber(strArray)],
				 		getn(aryAward[tonumber(strArray)])+1,
				 		{i,tonumber(strArrayRate)}
				 		);
				 		
				 nIsArray = 1;
			else
				nResult = PayAward(taskName, i, strType, nAlliedTask);
				-- 储存是否开始任务
				if nResult==1 then nIsTaskStart = 1; end;
			end;
		
		end;
		
		-- 如果奖励被定义了数组，则调用数组发奖函数
		if nIsArray==1 then
			CDebug:MessageOut(taskName.."甶襲 ch豱h l筰 h祄 s� ph竧 thng");
			for i=1, getn(aryAward) do
				if PayAwardForArray(taskName, aryAward[i], nAlliedTask)==1 then
					nResult = 1;
					nIsTaskStart = 1;
				end;
			end;
		
		end;
		
		
		-- 如果任务奖励没有开始新任务的话则展开任务完成后的对话
		if nIsTaskStart==0 then
			CDebug:MessageOut(taskName.." Ch璦 m� nhi謒 v� m韎. 襲 ch豱h l筰 th阨 gian ph竧 thng");
			CreateTaskSay({TaskTalk(taskName, 1, 5),
						  "K誸 th骳 i tho筰/OnTaskExit"
						  });
			return 1;
		end;
		
		return 1;
		
end;


-- 发奖的统一细节处理过程
-- 传入参数为任务的名字、奖励行号、发奖类型
-- 传入参数：nAlliedTask 可选参数，如果非空，则表明是由索引奖励来发奖
function PayAward(taskName, nRow, strType, nAlliedTask)

local nGenre, nDetail, nParticular, nLevel, nGoodsFive, nQuality, nNum = 0,0,0,0,0,0,0;
local nMoney, nExp = 0,0
local nRandomItemIndex = 0;  -- 产生随机任务卷轴的索引
local nRandomTaskID = 0;  -- 产生随机任务的任务索引

-- 如果物品需要记录随机种子，则记录序号
local nRandomSeedRecord = 0;

-- 随机种子数	
local nRandomSeed = 0;

local strAlliedTask = ""; -- 类似任务奖励的索引
local nAlliedRow, nAlliedCol = 0,0;
local strAlliedType = "";
local strShowName = "";  -- 输出显示的任务名

local strTask = "";
local strText = "";

local nResult = 0;

local i=0;

	-- 异常处理
	if taskName=="" or taskName==nil then
		-- 写 LOG
		WriteTaskLog(" thay i qu� tr譶h nh薾 thng phi ph竝");		
		return
	end;

	-- 如果非空，则表明是由索引奖励调用此过程来发奖
	if nAlliedTask~=nil and nAlliedTask~=0 then
		strShowName = TaskName(nAlliedTask);
	else
		strShowName = taskName;
	end;
	
	-- 异常处理
	if strShowName==nil then strShowName=""; end;

	-- 如果奖励的类型是金钱
	if strType==Award.Money then		
		nMoney = TaskAward(taskName, nRow, Award.MoneyNum_Row);
		
		if nMoney==nil or nMoney=="" then nMoney=0; end;
		
		Earn(nMoney);
		
		Msg2Player("B筺 nh薾 頲<color=White>"..GetTaskText(strShowName).."<color>ti襫<color=green>"..nMoney.."<color>");
		CDebug:MessageOut(strShowName.."ph莕 thng c馻 nhi謒 v� l� ti襫:"..nMoney);
	end;
	
	-- 如果奖励的类型是经验
	if strType==Award.Exp then
		nExp = TaskAward(taskName, nRow, Award.ExpNum_Row);
		AddOwnExp(nExp);
		
		Msg2Player("B筺 nh薾 頲<color=White>"..GetTaskText(strShowName).."<color>甶觤 kinh nghi謒<color=green>"..nExp.."<color>");
		CDebug:MessageOut(strShowName.."ph莕 thng c馻 nhi謒 v� l� 甶觤 kinh nghi謒:"..nExp);
	end;

	-- 如果奖励的类型是物品
	if strType==Award.Goods then
	
		nGenre      = TranItemNumber(TaskAward(taskName, nRow, Award.Goods_Genre_Row));
		nDetail     = TranItemNumber(TaskAward(taskName, nRow, Award.Goods_Detail_Row));
		nParticular = TranItemNumber(TaskAward(taskName, nRow, Award.Goods_Particular_Row));
		nLevel      = TranItemNumber(TaskAward(taskName, nRow, Award.Goods_Level_Row));
		nGoodsFive  = TranItemNumber(TaskAward(taskName, nRow, Award.Goods_GoodsFive_Row));
		nNum        = TranItemNumber(TaskAward(taskName, nRow, Award.Goods_GoodsNum_Row));
		
		-- 奖励的物品文字
		strText     = TranEnableString(TaskAward(taskName, nRow, Award.AwardText_Row));
		
		for i=1, nNum do
			AddItem(nGenre, nDetail, nParticular, nLevel, nGoodsFive, 0, 0);
		end;
		
		Msg2Player("B筺 nh薾 頲<color=White>"..GetTaskText(strShowName).."<color>v藅 ph萴<color=green>"..strText..nNum.."c竔<color>");
		
		-- 写 LOG
		WriteTaskLog("trong nhi謒 v�:"..strShowName.."Nh薾 頲 v藅 ph萴:"..strText);
		
		CDebug:MessageOut(strShowName.."ph莕 thng c馻 nhi謒 v� l� v藅 ph萴:"..strText);
	end;
		
	-- 如果奖励的类型是黄金装备
	if strType==Award.GoldItem then
	
		nQuality = tonumber(TaskAward(taskName, nRow, Award.Goods_Quality_Row));
		nRandomSeedRecord = TranItemNumber(TaskAward(taskName, nRow, Award.Goods_RandomSeed_Row));
		
		if nRandomSeedRecord~=-1 then
			nRandomSeed = GetTmpValue(taskName, TmpType.ItemSeed..nRandomSeedRecord);
			-- AddItemEx 指令需要将黄金序号 -1
			AddItemEx(4, nRandomSeed, 1, 0, nQuality - 1, 0, 0, 0, 0, 0);
			CDebug:MessageOut(strShowName.."ph莕 thng c馻 nhi謒 v� l� trang b� ho祅g kim, s� hi謚 nhi謒 v� l�:"..nQuality.." Nhi謒 v� ng蓇 nhi猲:"..nRandomSeed);
		else
			AddGoldItem(0, nQuality);
		end;

		-- 奖励的物品文字
		strText     = TranEnableString(TaskAward(taskName, nRow, Award.AwardText_Row));
		
		Msg2Player("B筺 nh薾 頲<color=White>"..GetTaskText(strShowName).."<color>trang b� ho祅g kim:<color=Orange>"..strText.."<color>");
		
		-- 写 LOG
		WriteTaskLog("trong nhi謒 v�:"..strShowName.."Nh薾 頲 m閠 b� trang b� ho祅g kim:"..nQuality);
		
		CDebug:MessageOut(strShowName.."ph莕 thng c馻 nhi謒 v� l� trang b� ho祅g kim, s� hi謚 nhi謒 v� l�:"..nQuality);
	end;
	
	-- 如果奖励类型是开始一个任务
	if strType==Award.Task then
		strTask = TaskAward(taskName, nRow, Award.AwardTask_Row);
		nResult = ApplyTask(strTask);
		CDebug:MessageOut(strShowName.."ph莕 thng b総 u nhi謒 v� t猲 l�:"..strTask..", k誸 qu� l�:"..nResult);
		return 1;
	end;
	
	-- 如果奖励类型是产生一个随机任务卷轴
	if strType==Award.RandomTask then
		
		-- 选择一个第二层的随机任务
		nRandomTaskID = TaskNo(selectNextTask());
		
		if nRandomTaskID~=nil and nRandomTaskID~=0 then
			-- 生成一个任务卷轴
			nRandomItemIndex = AddItem(6, 2, 2, 0, 1, 0, 0);
			SetItemMagicLevel(nRandomItemIndex, 1, nRandomTaskID);
			
			-- 同步物品魔法属性
			SyncItem(nRandomItemIndex);

			Msg2Player("B筺 nh薾 頲<color=White>"..GetTaskText(strShowName).."<color>:<color=green> nh薾 頲 1 m藅 <color>");
			CDebug:MessageOut(strShowName.."ph莕 thng c馻 nhi謒 v� l� 1 m藅  ng蓇 nhi猲! S� hi謚 nhi謒 v� l�:"..nRandomTaskID.." ti誴 theo l�:"..nRandomItemIndex);
		else
			CDebug:MessageOut(strShowName.."nhi謒 v� th蕋 b筰!");
		end;
		
	end;
	
	
	-- 如果奖励类型是藏宝图
	if strType==Award.TreasureMap then
		-- 产生一张藏宝图
		CreateTreasureMap();
		
		Msg2Player("B筺 nh薾 頲<color=White>"..GetTaskText(strShowName).."<color>ph莕 thng:<color=green>m閠 t蕀 T祅g B秓 у!<color>");
		
		-- 写 LOG
		WriteTaskLog("trong nhi謒 v�:"..strShowName.."Nh薾 頲 1 t蕀 T祅g B秓 у.");
	end;
	
	
	-- 如果奖励类型是奖励索引
	if strType==Award.AlliedAwardIndex then

		-- 获取奖励索引名
		strAlliedTask = TaskAward(taskName, nRow, Award.AlliedAward_Row);
		
		CDebug:MessageOut(taskName.."Lo筰 ph莕 thng:"..strAlliedTask);
		
		-- 把自己本身转换成一个数字传进去
		PayAwardMain(strAlliedTask, TaskNo(taskName));
		
	end;
	
	return 0;

end;


-- 根据传入的数组来随机选取一个奖励发给玩家
-- 传入参数：taskName：任务名  aryAward{nRow, nRate}：奖励数组
-- 传入参数：nAlliedTask 可选参数，如果非空，则表明是由索引奖励来发奖
function PayAwardForArray(taskName, aryAward, nAlliedTask)

local strType = "";

local nAdd = 0;
local nResult = 0;
local nRandom = 0;
local nIsTaskStart = 0; -- 判断始是否有任务开始
local i=0;

local RATE_ADD = 100; -- 概率都乘 100 ，以防止出现小数

	-- 如果非空，则表明是由索引奖励调用此过程来发奖
	if nAlliedTask==nil then
		nAlliedTask = 0;
	end;

	for i=1, getn(aryAward) do
		nAdd = nAdd + aryAward[i][2]*RATE_ADD;
	end;
	
	nRandom = random(1, nAdd);
	
	CDebug:MessageOut(taskName.."ph莕 thng ng蓇 nhi猲 c� 頲:"..nRandom);
	
	if nAdd~=10000 then -- 如果概率相加不到 10000 的容错处理
		print(taskName.."甶襫 nh藀 ph莕 thng c� sai s鉻");
		nRandom=1; 
	end;
	
	nAdd = 0;
	
	-- 把数组里面的东西发出去
	for i=1, getn(aryAward) do
		
		strType = TaskAward(taskName, aryAward[i][1], Award.AwardType_Row);
		nAdd = nAdd + aryAward[i][2]*RATE_ADD;
		
		if nAdd>=nRandom then
			CDebug:MessageOut(taskName.."S� ph莕 thng c� 頲"..aryAward[i][1].." ");
			nResult = PayAward(taskName, aryAward[i][1], strType, nAlliedTask);
			
			if nResult==1 then
				nIsTaskStart = 1;
			end;
			
			break;
		end;
	end;
	
	return nIsTaskStart;
	
end;


-- 用于判断对话任务是否能完成
function CheckTalkCanFinish(taskName)

local nTalkNpc = 0;
local nOrder = 0;
local nFinish = 0;

	if GetTmpValue(taskName, TmpType.KillNpc) ~= nil then
		CDebug:MessageOut(taskName.."X衪 xem nhi謒 v� i tho筰 l� c� th� ho祅 th祅h hay kh玭g, bi課 s� t筸 th阨 c馻 nhi謒 v� gi誸 qu竔 kh竎 0.");
		nOrder = nOrder + 1;
		nFinish = nFinish + GetTmpValue(taskName, TmpType.KillNpc);	
	end;
	if GetTmpValue(taskName, TmpType.Collect) ~= nil then
		nOrder = nOrder + 1;
		nFinish = nFinish + GetTmpValue(taskName, TmpType.Collect);
	end;
	if GetTmpValue(taskName, TmpType.TalkNpc) ~= nil then
		nOrder = nOrder + 1;
		nTalkNpc = 1;
	end;
	
	if nOrder>1 then
		if nFinish + 1 == nOrder then
			CDebug:MessageOut(taskName.." nhi謒 v� c� th� ho祅 th祅h");
			return 1;
		else
			return nil;
		end;
	else
		return 1;
	end;

end;


-- 构造任务选择对话
function CreateTalkTask()

local nNpcIndex = GetLastDiagNpc();
local NpcName  = ""

local x, y, subworld = GetNpcPos(nNpcIndex);
local mapName = SubWorldName(subworld);

local aryTask = EnumTaskList();

local aryTaskText = {"Ngi n l祄 g�?"};

local i=0;

	if nNpcIndex==nil then return 0; end;

	if aryTask==nil then return 0; end;
	
	NpcName = GetNpcName(nNpcIndex);
	
	-- 台湾版需要转换过的 NPC NAME
	NpcName = NpcName2Replace(NpcName);
	
	for i=1, getn(aryTask) do
		if OnTaskNpcTalk(NpcName, mapName, aryTask[i])==1 then
			rawset(aryTaskText,
					getn(aryTaskText)+1,
					"Ta n "..GetTaskEventName(aryTask[i]).." /#ShowTaskSay("..TaskNo(aryTask[i])..")");
		end;
	end;
	
	rawset(aryTaskText, getn(aryTaskText)+1, "ti誴 t鬰 n鉯 chuy謓 trc y/NpcDialog");
	
	if getn(aryTaskText)>2 then
		SelectSay(aryTaskText);
		return 1;
	else
		return 0;
	end;

end;


-- 选择收集杀怪物品任务的物品，在每杀一次指定的怪时触发
function SelectCollectItemTask(taskName)
	local nRow, nCol = TaskEntityMatrix(taskName);
	local nItemRate = tonumber(GetTmpValue(taskName, "ItemRate"));
	
	local nGenre, nDetail, nParticular, nLevel, nGoodsFive = 0,0,0,0,0;
	local szText = "";
	local nRandom = 0;
	
	if nItemRate==0 or nItemRate==nil then return end;
	
	CDebug:MessageOut(taskName.." X竎 su蕋 gi誸 qu竔 nh薾 頲 v藅 ph萴:"..nItemRate);
	
		if nRate~=nil or nRate~="" then
			nRandom = random(1, 100);
			if nRandom<=tonumber(nItemRate) then
				
				for i=1, nRow do
					strType = TaskEntity(taskName, i, Entity.TaskType_Row);
					if strType==Entity.CollectNpcItem then
						nGenre      = TranItemNumber(TaskEntity(taskName, i, Entity.Goods_Genre_Row));
						nDetail     = TranItemNumber(TaskEntity(taskName, i, Entity.Goods_Detail_Row));
						nParticular = TranItemNumber(TaskEntity(taskName, i, Entity.Goods_Particular_Row));
						nLevel      = TranItemNumber(TaskEntity(taskName, i, Entity.Goods_Level_Row));
						nGoodsFive  = TranItemNumber(TaskEntity(taskName, i, Entity.Goods_GoodsFive_Row));
						szText      = TaskEntity(taskName, i, Entity.TaskText_Row);
					end;
				end;
				
				AddItem(nGenre, nDetail, nParticular, nLevel, nGoodsFive, 0, 0);
				Msg2Player("B筺 nh薾 頲 1: <color=green>"..szText.."<color>!");
				
			end;
		end;
end;


-- 将一个传进来的物品索引转换成一个 STRING 的 KEY，以及返回等级和五行
function TranKey(nIndex)

local nGenre,nDetail,nParticular,nLevel,nGoodsFive,nLuck = GetItemProp(nIndex);
local nQuality = GetGlodEqIndex(nIndex);

local strKey = "";

	if nQuality==0 or nQuality<0 then
	
		strKey = tostring(nQuality)..","..
			     tostring(nGenre)..","..
			     tostring(nDetail)..","..
			     tostring(nParticular);
	
	else
		strKey = tostring(nQuality)..","..
			     tostring(0)..","..
			     tostring(0)..","..
			     tostring(0);	
	end;

	return strKey, nLevel, nGoodsFive;

end;


-- 转换一个物品的标识为数字，如果其为 n 或者是 nil 则返回 -1
function TranItemNumber(num)

	if num=="n" or num=="" or num==nil then
		return -1;
	end;
	
	if strfind(tostring(num), "/")~=nil then
		return tostring(num);
	end;
	
	return tonumber(num);

end;


-- 强制将一个变量转换成合法的字符串
function TranEnableString(strMain)

	if strMain==nil then
		return "";
	else
		return strMain;
	end;

end;


-- 枚举当前正在进行的任务，返回一个任务名数组
function EnumTaskList()

local aryTask = {}

-- 获取第一个任务名
local taskName = FirstTask();

	-- 如果当前没有任务则直接返回
	if taskName==nil then return nil; end;
	
	rawset(aryTask, getn(aryTask)+1, taskName);
	
	while (taskName~=nil) do
		taskName = NextTask();
		rawset(aryTask, getn(aryTask)+1, taskName);
	end;
	
	return aryTask;

end;


-- 同步任务系统所占用的所有变量
function SyncTaskSystemValus()

local nStart, nEnd = 2000, 2300; -- 开始和结束的范围
local i=0;

	for i=nStart, nEnd do
		SyncTaskValue(i);
	end;

end;


-- 任务系统的写入 LOG 过程
function WriteTaskLog(strMain)

	-- 如果是空值则不写入
	if strMain==nil then return end;

	WriteLog(" [H� th鑞g nhi謒 v鬩"..date(" [%y n╩ %m th竛g %d ng祔  %H gi� %M ph髏]").." [m藅 m�:"..GetAccount().."] [nh﹏ v藅:"..GetName().."]"..strMain);
end;


function Task_Exit()

end;