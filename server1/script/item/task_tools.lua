
-- ====================== 文件信息 ======================

-- 剑侠情缘online 任务系统工具脚本
-- Edited by peres
-- 2005/07/29 PM 12:30

-- 烟花。那一夜的烟花。
-- 她记得他在大雨的人群中，站在她的背后拥抱住她。
-- 他温暖的皮肤，他熟悉的味道。烟花照亮她的眼睛。
-- 一切无可挽回……

-- ======================================================

-- 同伴系统的支持
IncludeLib("PARTNER");

-- 任务系统库支持
IncludeLib("TASKSYS");

-- 读入任务系统头文件，包含随机任务
Include("\\script\\task\\system\\task_main.lua");

strTitle        = "<color=green>C萴 nang nhi謒 v�<color>:";
strTitle_Normal = strTitle.."B筺 mu鑞 xem nhi謒 v� n祇?<enter>"
strTitle_None   = strTitle.."B筺 hi謓 ch璦 l祄 nhi謒 v� n祇.";
strPublic       = "<color=green>C萴 nang nhi謒 v�<color>:"

-- 将 main() 改成 main_back 即可将整个工具禁用
function main_back()

Say(strTitle.."B筺 mu鑞 l祄 nhi謒 v� n祇 trong c萴 nang nhi謒 v� n祔 kh玭g?",7,
	"Xem m譶h hi謓 產ng l祄 nhi謒 v� n祇./ShowEventMain",
	"b籲g tay b総 u m閠 nhi謒 v�  t錸 t筰/MenuStartTask",
	"Ng蓇 nhi猲 nh薾 頲 m閠 nhi謒 v� b筺 ng h祅h/MenuGetRandomTask",
	"Nh薾 頲 m閠 nhi謒 v� c� t蕋 c� v藅 ph萴 c莕 thi誸/MenuGetTaskItem",
	"S� tr� v� tr筺g th竔 ban u/MenuSetTaskClearn",
	"S� x鉧 to祅 b� c竎 nhi謒 v� /MenuSetEventClearn",
	"сng/Task_Exit");

return 1;

end;

-- 玩家选择查看事件，在下面列出所有正在进行的事件供玩家选择
function ShowEventMain()

local i=0;
local aryEvent = EnumEventList();
local aryTalkText = {strTitle_Normal};

	if aryEvent==nil then
		Say(strTitle_None, 0);
		return
	end;
	
	for i,j in aryEvent do
		rawset(aryTalkText,
				getn(aryTalkText)+1,
				TaskEvent(i, 1, 1).."/#ShowEventDetail("..i..")");
	end;
	
	rawset(aryTalkText, getn(aryTalkText)+1, "сng/OnTaskExit");
	
	SelectSay(aryTalkText);
	
	return 1;


end;


function ShowEventDetail(nEventID)

local aryTask = EnumEventTask(nEventID);
local strMain = {strTitle.."Di y l�<color=yellow>"..TaskEvent(nEventID, 1, 1).."<color>T譶h tr筺g chi ti誸:<enter><enter>"} -- 任务列表字符串

local i=0;


	for i=1, getn(aryTask) do
		strMain[1] = strMain[1]..GetTaskText(TaskName(aryTask[i]), 1, 3)..GetTaskStatusText(aryTask[i]).."<enter>";
	end;
	
	rawset(strMain, getn(strMain)+1, "X鉧 nhi謒 v� n祔/#_ClearnTaskState("..nEventID..")");
	rawset(strMain, getn(strMain)+1, "Tr� l筰 thanh menu ch輓h/main");
	rawset(strMain, getn(strMain)+1, "сng/OnTaskExit");
	
	SelectDescribe(strMain);

end;


-- 枚举出当前正在进行的事件
function EnumEventList()

local aryTask  = EnumTaskList(); -- 取得当前正在进展的任务
local aryEvent = {}
local i=0;

	if aryTask==nil then return nil; end;
	
	for i=1, getn(aryTask) do
		rawset(aryEvent,
				GetTaskEventID(aryTask[i]),
				1);
	end;
	
	return aryEvent;

end;


-- 枚举出一事件所包含的任务，返回一个数组
function EnumEventTask(nEventID)

local aryTask = {};

local nEvent = GetEventTaskCount(nEventID);

	CDebug:MessageOut("C� 頲:"..nEventID.." s� nhi謒 v� l�:"..nEvent);

local i=0;

	if nEvent==0 then return nil; end;
	
	for i=1, nEvent do
		CDebug:MessageOut("ng nh藀 s� nhi謒 v�:"..TaskNo(GetEventTask(nEventID, i)));
		rawset(aryTask,
				getn(aryTask)+1,
				TaskNo(GetEventTask(nEventID, i))
				);
	end;
	
	return aryTask;

end;


-- 选择手动开始一个任务
function MenuStartTask()
	AskClientForString("_StartTask", "", 1, 20, "Nh藀 s� th� t� ho芻 t猲 nhi謒 v�:");
end;


-- 回调函数，手动开始一个新任务
function _StartTask(taskName)

-- 如果是数字则把它变成任务名称
if tonumber(taskName)~=nil then
	taskName = TaskName(taskName);
end;

	SetTaskStatus(taskName, 0);
	CloseTask(taskName);
	ApplyTask(taskName);
	
end;


-- 随机选择一个同伴随机任务
function MenuGetRandomTask()

local partnerindex,partnerstate = PARTNER_GetCurPartner()       -- 获得召唤出同伴的index,同伴状态为召出或为不召出
local nResult = 0;

	if partnerindex==0 or partnerstate==0 then
		Msg2Player(strPublic.."<color=yellow>Kh玭g c� g鋓 ng h祅h kh玭g nh薾 頲 nhi謒 v� ng蓇 nhi猲!<color>");
		return
	end;
	
	nResult = initRandomTask();
		
	if nResult==0 then
		CDebug:MessageOut("T飝 theo nhi謒 v� b筺 s� ch鋘 s� ID tng 鴑g!");
	end;

end;


-- 回调函数，清空一个事件所有任务的状态，包括临时变量
function _ClearnTaskState(nEventID)

local aryTask = EnumEventTask(nEventID);

if aryTask==nil then return end;

	for i=1, getn(aryTask) do
		CDebug:MessageOut("ng x鉧"..TaskName(aryTask[i]).."Tr筺g th竔 nhi謒 v� ");
		SetTaskStatus(TaskName(aryTask[i]), 0);
		CloseTask(TaskName(aryTask[i]));
	end;

	Say(strTitle.."B筺  x鉧 h誸<color=yellow>"..TaskEvent(nEventID, 1, 1).."<color>ph﹏ t輈h to祅 b� nhi謒 v� ", 0);

end;



-- 得到一个任务所需要的所有物品
function MenuGetTaskItem()
	AskClientForString("_GetTaskItem", "", 1, 20, "Xin h穣 nh藀 m藅 kh萿:");
end;


-- 回调函数：得到一个任务所需要的所有物品
function _GetTaskItem(taskID, nIndex)

local taskName = TaskName(taskID);

	-- 如果传入的是特殊字符 9999 的话则直接取随机任务当前的
	if tonumber(taskID)==9999 then taskName=TaskName(GetTask(1301)); end;

-- 检查此任务是找黄金装备还是找普通物品
local checkType = GetTaskCollectType(taskName);

-- 任务需要寻找的物品列表
local aryOrgCollect = {};

-- 任务所要的物品编号
local w_Genre, w_Detail, w_Particular, w_Level, w_GoodsFive, w_GoodsNum, w_DelGoods, w_Quality = 0,0,0,0,0,0,0,0;
	
local i,j,k=0,0,0;

	-- 获取需要寻找的物品列表
	if checkType>=1 then
		aryOrgCollect = GetTaskCollectRow(taskName);
	else
		Say("Nhi謒 v�  kh玭g c莕 thu th藀 v藅 ph萴!", 0);
		return
	end;

	-- 如果收集的是普通装备
	if checkType==1 then
	
		-- 获取传进来的物品列表
		for j, k in aryOrgCollect do
		
				-- 用自定义的转换数字函数来转换表格里的数字标识
				w_Genre      = TranItemNumber(TaskEntity(taskName, j, Entity.Goods_Genre_Row));
				w_Detail     = TranItemNumber(TaskEntity(taskName, j, Entity.Goods_Detail_Row));
				w_Particular = TranItemNumber(TaskEntity(taskName, j, Entity.Goods_Particular_Row));
				w_Level      = TranItemNumber(TaskEntity(taskName, j, Entity.Goods_Level_Row));
				w_GoodsFive  = TranItemNumber(TaskEntity(taskName, j, Entity.Goods_GoodsFive_Row));
				w_GoodsNum   = TranItemNumber(TaskEntity(taskName, j, Entity.Goods_GoodsNum_Row));
				w_DelGoods   = TranItemNumber(TaskEntity(taskName, j, Entity.Goods_DelGoods_Row));
				
				if w_Level==-1 then w_Level=1; end;
				if w_GoodsFive==-1 then w_GoodsFive=0 end;
				
				for i=1, w_GoodsNum do
					AddItem(w_Genre, w_Detail, w_Particular, w_Level, w_GoodsFive, 0, 0);
				end;
				
		end;
		
	else
	
		-- 获取传进来的物品列表
		for j, k in aryOrgCollect do
		
			w_Quality    = TranItemNumber(TaskEntity(taskName, j, Entity.Goods_Quality_Row));
			w_GoodsNum   = TranItemNumber(TaskEntity(taskName, j, Entity.Goods_GoodsNum_Row));

				for i=1, w_GoodsNum do
					AddGoldItem(0, w_Quality);
				end;
				
		end;
		
	end;
	
end;



-- 将一个任务设置成还未开始的状态
function MenuSetTaskClearn()
	AskClientForString("_SetTaskClearn", "", 1, 20, "Xin h穣 nh藀 m藅 kh萿:");
end;


function _SetTaskClearn(taskID, nIndex)

	if TaskName(taskID)==0 or TaskName(taskID)==nil then
		Say(strTitle.."M藅 kh萿 n祔 kh玭g ng!", 0);
		return
	end;

	SetTaskStatus(TaskName(taskID), 0);
	CloseTask(TaskName(taskID));
	
	Say(strTitle.."B筺 nh薾 頲<color=yellow>"..TaskName(taskID).."<color>Tr� v� tr筺g th竔 ban u", 0);

end;


-- 将一个事件里所有的任务都清空
function MenuSetEventClearn()
	AskClientForString("_SetEventClearn", "", 1, 20, "Xin h穣 nh藀 m藅 kh萿:");
end;


function _SetEventClearn(eventID, nIndex)

local nEvent = GetEventTaskCount(eventID);

	if nEvent==0 then
		Say(strTitle.."M藅 kh萿 n祔 kh玭g ng!", 0);
		return
	end;

	_ClearnTaskState(eventID);
end;


-- 用字符串表示一个任务的状态
function GetTaskStatusText(nTaskID)

local aryText = {
	[0]=" - <color=red>ch璦 b総 u<color>",
	[1]=" - <color=green>Ti課 h祅h<color>",
	[2]=" - <color=yellow>Х ho祅 th祅h<color>",
	[3]=" - <color=yellow>Х nh薾 qu� t苙g<color>",
}

	return aryText[GetTaskStatus(TaskName(nTaskID))];
	
end;