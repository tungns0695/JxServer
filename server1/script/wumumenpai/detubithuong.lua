Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\lib\\progressbar.lua")
Include("\\script\\lib\\awardtemplet.lua")
--------------------------------------------------
local nHideTime = 10
---------------------------------------------------------------------------------------------------------------------------------------------------------------
local _OnBreak = function()
	Msg2Player("Thu th�p �� b� gi�n �o�n.")
end
----------------------------------------------------------------------
local _GetAward = function(nNpcIndex, dwNpcId)

	if nNpcIndex <= 0 or GetNpcId(nNpcIndex) ~= dwNpcId then
		return
	end
	
	if IsNpcHide(nNpcIndex) == 1 then
		return 0
	end

	if CalcFreeItemCellCount() < 1 then
		Talk(1,"","H�y ch�a 1 � tr�ng r��ng h�nh trang")
		return
	end 
	
	if (GetTask(12) == 220*256) then
		SetTask(12,230*256)
	elseif (GetTask(12) == 230*256) then
		SetTask(12,240*256)
	elseif (GetTask(12) == 240*256) then
		SetTask(12,250*256)
	end

	ConsumeEquiproomItem(1,6,1,5097,-1)
	Talk(1,"","�� t� b� th��ng: �a t�, ta �� c�m th�y �� h�n nhi�u.")

	if (GetTask(12) == 250*256) then
		Msg2Player("Quay v� g�p Thang Anh b�o c�o t�nh h�nh")
	end
	HideNpc(nNpcIndex, %nHideTime * 18)
end 
--------------------------------------------------------------------------------------------------------------------------------------
function main()
	dofile("script/wumumenpai/detubithuong.lua")
	local nNpcIndex = GetLastDiagNpc()
	local dwNpcId = GetNpcId(nNpcIndex)
	if (GetTask(12) >= 220*256 and GetTask(12) <= 240*256 and GetLevel() >= 30) then
		tbProgressBar:OpenByConfig(9, %_GetAward, {nNpcIndex, dwNpcId}, %_OnBreak)
	end
end
---------------------------------------------------------------------------------------------------------------------------