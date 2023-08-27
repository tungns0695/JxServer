IncludeLib("PET")
Include("\\script\\lib\\log.lua")
Include("\\script\\vng_event\\item\\pet\\lang.lua")
Include("\\script\\activitysys\\playerfunlib.lua")

NSD_TSK_DAILY_LIMIT = 3059
NSD_DAILY_MAX_USE = 10

function main(nItemIdx)
	if PET_IsCreate() ~= 1 then
		Talk(1, "", IS_HAVE_PET)
		return 1
	end
	if PlayerFunLib:CheckTaskDaily(NSD_TSK_DAILY_LIMIT, NSD_DAILY_MAX_USE, format(USE_ITEM_MAX_PER_DAY, GetItemName(nItemIdx), NSD_DAILY_MAX_USE), "<") ~= 1 then
		return 1
	end
	PlayerFunLib:AddTaskDaily(NSD_TSK_DAILY_LIMIT, 1)
	local nOldTamePoint = PET_GetTamePoint()
	local nTamePoint = PET_GetTamePoint() + 1
	PET_SetTamePoint(nTamePoint)	
	Msg2Player(GET_TAME_POINT_MSG..nTamePoint)
	tbLog:PlayerActionLog("SuDungNhanSinhDon", "�i�m tu luy�n hi�n t�i: "..nOldTamePoint, "�i�m tu luy�n m�i: "..nTamePoint)
end