--特殊任务令牌文件
Include([[\script\tong\workshop\tongcolltask.lua]]);

function main(nItem)
	_, nTongID = GetTongName();
	if (nTongID <= 0) then
		Say("Ch璦 gia nh藀 <color=yellow>bang ph竔<color>, kh玭g th� s� d鬾g l謓h b礽 nhi謒 v� c bi謙.", 0);
		Msg2Player("Ch璦 gia nh藀 <color=yellow>bang ph竔<color>, kh玭g th� s� d鬾g l謓h b礽 nhi謒 v� c bi謙.");
		return 1;
	end;
	local nCount = GetTask(TASK_LP_COUNT);
	SetTask(TASK_LP_ITEMID, nItem); --获取令牌等级
	
	if (nCount > 0) then
		Say("<color=green>L謓h b礽 nhi謒 v�<color>: Hi謓 t筰 c� nhi謒 v� ng蓇 nhi猲 ch璦 ho祅 th祅h, v蒼 mu鑞 ti誴 nh薾 nhi謒 v� m韎 sao?", 2,
			"ng v藋, ta mu鑞 h駓 b� nhi謒 v� trc y/cancelformertask",
			"Kh玭g ph秈, i m閠 l竧 !/OnCancel");
		return 1;
	else
		wanttask()
		return 1;
	end;
end;

--取消一个任务令牌任务。
function cancelformertask()
	if (GetTask(TASK_LP_COUNT) ~= 0) then
		rwlp_cleartask();
		Say("Х h駓 b� nhi謒 v� <color=yellow>L謓h b礽 nhi謒 v� c bi謙<color>.", 0);
		Msg2Player("Х h駓 b� nhi謒 v� <color=yellow>L謓h b礽 nhi謒 v� c bi謙<color>.");
	end;
end;

-- 接受令牌任务
function wanttask()
	if (GetTask(TASK_LP_COUNT) ~= 0) then
		Say("Hi謓 c� nhi謒 v� L謓h b礽 nhi謒 v� c bi謙, kh玭g th� ti誴 nh薾 nhi謒 v� m韎.", 0);
		return
	end;
	
	local nLevel, nWorkshopIdx, nCount, nItem, nResult;
	
	nItem = GetTask(TASK_LP_ITEMID);
	nLevel = GetItemParam(nItem, 3);
	nWorkshopIdx = GetItemParam(nItem, 4);
	nCount = GetItemParam(nItem, 5);
	if (not nCount or nCount == 0) then
		nResult = init_task()
		nLevel = GetItemParam(nItem, 3);
		nWorkshopIdx = GetItemParam(nItem, 4);
		nCount = GetItemParam(nItem, 5);
	end;
	
	local szContent = "<color=yellow>"..nLevel.."<color> tr� l猲 � c竎 bang h閕 kh竎 nhau<color=yellow>"..tab_Workshop[nWorkshopIdx].."Phng t鎛g qu秐<color>, ";
	if (nResult == 0) then
		Say("v鑞 mu鑞 ngi 甶 t譵 v礽 v� "..szContent..", nh璶g ti誧 l� ng c蕄 <color=yellow>"..tab_Workshop[nWorkshopIdx].." phng<color> c馻 c竎 bang h閕 u kh玭g , l莕 sau n th� xem.", 0);
		Msg2Player("T筸 th阨 kh玭g c�  "..szContent..", l莕 sau n th� xem.");
		return
	end;
	
	szContent = "<color=yellow>"..nCount.."<color> v�"..szContent;
	Say("b鎛 bang<color=yellow>"..tab_Workshop[nWorkshopIdx].."Phng t鎛g qu秐<color> d筼 n祔 tinh th莕 kh玭g 頲 t鑤, mu鑞 l猲 kinh 鴑g th� nh璶g c莕 ph秈 thu th藀  Th� ti課 c� c馻 c竎 danh s� n琲 y. Phi襫 ngi 甶 t譵 gi髉 "..szContent.."Th� ti課 c� c馻 h�.", 2,
	"Л頲, ta s� c� g緉g./#lp_confirm("..nLevel..","..nWorkshopIdx..","..nCount..", 1)",
	"Nhi謒 v� n祔 kh� qu�, ta kh玭g d竚 nh薾./#lp_confirm("..nLevel..","..nWorkshopIdx..","..nCount..", 0)");
end;

--初始化一个任务
function init_task()
	local nLPLvl = GetItemParam(GetTask(TASK_LP_ITEMID), 1); -- 令牌的等级
	
	local nLevel, nWorkshopIdx, nCount;
	nLevel = 1;
	nWorkshopIdx = random(1, 7); -- 随机一个作坊
	
	if (nLPLvl == 1) then
		nLevel = random(1, 3);
	elseif (nLPLvl == 2) then
		nLevel = random(4, 6);
	elseif (nLPLvl == 3) then
		nLevel = random(7, 8);
	end;
	
	nCount = random(1, 9);
	local nMax = get_workshop_count(nWorkshopIdx, nLevel);
	if (not nMax) then
		nMax = 0;
	end;
	if (nCount > nMax) then
		nCount = nMax;
	end;
	
	local nItem = GetTask(TASK_LP_ITEMID);
	SetSpecItemParam(nItem, 3, nLevel);
	SetSpecItemParam(nItem, 4, nWorkshopIdx);
	SetSpecItemParam(nItem, 5, nCount);
	SyncItem(nItem);
	if (nCount > 0) then
		return 1;
	end;
	return 0;
end;

function lp_confirm(nLevel, nWorkshopIdx, nCount, bOK)
	local szContent = "<color=yellow>"..nCount.."<color>v� <color=yellow>"..nLevel.."<color> tr� l猲 � c竎 bang h閕 kh竎 nhau<color=yellow>"..tab_Workshop[nWorkshopIdx].."Phng t鎛g qu秐<color>";
	
	nt_SetTask(TASK_LP_ZONGGUANIDX, nWorkshopIdx);
	nt_SetTask(TASK_LP_ZONGGUANLEVEL, nLevel);
	
	if (bOK == 1) then
		Say("b鎛 bang<color=yellow>"..tab_Workshop[nWorkshopIdx].."Phng t鎛g qu秐<color> d筼 n祔 tinh th莕 kh玭g 頲 t鑤, mu鑞 l猲 kinh 鴑g th� nh璶g c莕 ph秈 thu th藀  Th� ti課 c� c馻 c竎 danh s� n琲 y. Phi襫 ngi 甶 t譵 gi髉 "..szContent.."Th� ti課 c� c馻 h�.", 1, "Ta bi誸 r錳!/lp_confirmtwo");
	else
		Say("b鎛 bang<color=yellow>"..tab_Workshop[nWorkshopIdx].."Phng t鎛g qu秐<color> mu鑞 ngi t譵 gi髉 "..szContent.."Th� ti課 c�, ngi kh玭g c� th阨 gian sao?",2 ,"Ta v蒼 ch璦 nh薾 nhi謒 v� n祔./lp_confirmtwo", "Ta th藅 s� kh玭g mu鑞 nh薾 nhi謒 v� n祔./OnCancel");
	end;
end;

function lp_confirmtwo()
	local nItem = GetTask(TASK_LP_ITEMID);

	local nCount = GetItemParam(nItem, 5);
	local nWorkshopIdx = GetTask(TASK_LP_ZONGGUANIDX);
	local nLevel = GetTask(TASK_LP_ZONGGUANLEVEL);
	
	if (nItem > 0) then
		if (RemoveItemByIndex(nItem) ~= 1) then
			return
		end;
	end;

	nt_SetTask(TASK_LP_COUNT, nCount);
	Msg2Player("B筺 ng � 甶 g苝 <color=yellow>"..nCount.."<color> <color=yellow>"..tab_Workshop[nWorkshopIdx].."Phng t鎛g qu秐<color>  nh薾 nhi謒 v� Th� ti課 c�, ng c蕄 <color=yellow>"..tab_Workshop[nWorkshopIdx].." phng<color> c莕 t c蕄 <color=yellow>"..nLevel.."<color>.");
end;
