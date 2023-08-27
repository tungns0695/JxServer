Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\lib\\progressbar.lua")
Include("\\script\\lib\\awardtemplet.lua")
--------------------------------------------------
local nHideTime = 80
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

	if (GetTask(12) == 180*256) then
		SetTask(12,190*256)
	elseif (GetTask(12) == 190*256) then
		SetTask(12,200*256)
	elseif (GetTask(12) == 200*256) then
		SetTask(12,210*256)
	end

	tbAwardTemplet:GiveAwardByList({tbProp={6,1,5096,1,0,0},nCount=1,nBindState = -2},"Li�u Th��ng Th�o D��c")

	if (GetTask(12) == 210*256) then
		Msg2Player("Thu th�p d��c li�u th�nh c�ng, h�y quay v� V� H�n ���ng g�p Y S� (223/200)")
	end

	HideNpc(nNpcIndex, %nHideTime * 18)
end 
--------------------------------------------------------------------------------------------------------------------------------------
function main()
dofile("script/wumumenpai/lieuthuongthaoduoc.lua")
local nNpcIndex = GetLastDiagNpc()
local dwNpcId = GetNpcId(nNpcIndex)
	if GetTask(12) >= 180*256 and GetTask(12) <= 200*256 and GetLevel() >= 30 then
		tbProgressBar:OpenByConfig(7, %_GetAward, {nNpcIndex, dwNpcId}, %_OnBreak)
	end
end
---------------------------------------------------------------------------------------------------------------------------