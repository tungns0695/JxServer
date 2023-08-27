

function TaskShedule()
	--设置方案名称
	TaskName("Ho箃 ng ng祔 l詶桟u閏 畊a b鑞 m颽")
	local nStartHour = tonumber(date("%H")) + 1;
	
	if (nStartHour >= 24) then
		nStartHour = 0;
	end;
	
	TaskTime(nStartHour, 0);
	
	--设置间隔时间，单位为分钟
	TaskInterval(15) --15一次
	
	--设置触发次数，0表示无限次数
	TaskCountLimit(0)
	OutputMsg("=================Ho箃 ng ng祔 l詶桟u閏 畊a b鑞 m颽==================");
end

function TaskContent()

	local nHour = tonumber(date("%H"))
	local nWeek	= tonumber(date("%w"))
	local nDate	= tonumber(date("%y%m%d"))
	
	if nDate < 080611 or nDate > 080713 then --从2008年06月11号 至– 2008年07月13号24点
		return
	end
	local bIsStart = 0
	if (nHour >= 10 and nHour < 11) or (nHour >= 22 and nHour < 23) then
		bIsStart = 1
	elseif nHour >= 14 and nHour < 15 and (nWeek == 6 or nWeek == 0 or nDate == 080430 or nDate == 080501 ) then
		bIsStart = 1
	elseif nHour >= 2 and nHour < 3 and  (nWeek == 6 or nDate == 080430 or nDate == 080501 ) then
		bIsStart = 1
	end
	
	if bIsStart == 1 then
		GlobalExecute("dwf \\script\\missions\\racegame\\missionctrl.lua startRaceMission()")
		GlobalExecute(format("dw AddLocalCountNews([[%s]], 2)", "Hi謓 t筰 c� th� n Minh Nguy謙 Tr蕁  b竜 danh tham gia, 1 ph髏 sau cu閏 畊a s� b総 u."))
	end
end



function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end


