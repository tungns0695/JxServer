--中原北区 朱仙镇 老马对话
Include("\\script\\misc\\eventsys\\eventsys.lua")
Include("\\script\\dailogsys\\dailog.lua")

function main()
	local nNpcIndex = GetLastDiagNpc()
	local szNpcName = GetNpcName(nNpcIndex)
	if NpcName2Replace then
		szNpcName = NpcName2Replace(szNpcName)
	end
	local tbDailog = DailogClass:new(szNpcName)
	EventSys:GetType("AddNpcOption"):OnEvent(szNpcName,tbDailog , nNpcIndex)
	if getn(tbDailog.tbOptionList) > 0 then
		tbDailog:AddOptEntry("Ta n t譵 玭g c� vi謈 kh竎", old_main)
		tbDailog:Show()
	else
		old_main()
	end
end

function old_main()

Say("Th蕐 c h筺h c馻 L穙 Chu ch璦? B� v� qu秐 l� nghi猰 ng苩 nh� v藋, xem ta y n gi� v蒼 ch璦 l蕐 v�. C竔 g�? Kh玭g ng  khoe sao? Th玦 c髏 甶, ch璦 v� c� g� l� kh玭g t鑤!",0)

end;
