IL("TITLE"); -- quan li title
--Include("\\script\\vng_lib\\files_lib.lua") -- to write file

function main()
	dofile("script/item/moremoneygift.lua")
	--ITEM_TO_CHECK = loadsavevalue("settings/changefeature/ngoaitrang.txt")
	local ITEM_TO_CHECK = GetTaskTemp(168)
	--Msg2Player("Task value: <color=yellow>"..ITEM_TO_CHECK)
	if ITEM_TO_CHECK==-1 then
		ITEM_TO_CHECK = 4
	end
	local nHelm, nArmor, nWeapon, nHorse, nMaskNPC = GetPlayerFeature(PlayerIndex)
	local nSettingsIdx = -1 - GetSex()
	local nChange = 0
	local step = 1
	local item_type = ""
	if ITEM_TO_CHECK == 4 then
		nChange = nHorse + step
		nHorse = nChange
		item_type = "ng�a"
		ChangeOwnFeature(0, -1, nSettingsIdx,  nHelm, nArmor, nWeapon, nHorse)
	elseif ITEM_TO_CHECK == 3 then
		nChange = nWeapon + step
		nWeapon = nChange	
		item_type = "v� kh�"
		ChangeOwnFeature(0, -1, nSettingsIdx,  nHelm, nArmor, nWeapon, nHorse)
	elseif ITEM_TO_CHECK == 2 then
		nChange = nArmor + step
		nArmor = nChange	
		item_type = "�o"
		ChangeOwnFeature(0, -1, nSettingsIdx,  nHelm, nArmor, nWeapon, nHorse)
	elseif ITEM_TO_CHECK == 1 then
		nChange = nHelm + step
		nHelm = nChange	
		item_type = "m�"
		ChangeOwnFeature(0, -1, nSettingsIdx,  nHelm, nArmor, nWeapon, nHorse)
	elseif ITEM_TO_CHECK == 0 then
		nChange = nMaskNPC + step
		nMaskNPC = nChange	
		item_type = "M�t n�"
		ChangeOwnFeature(0, -1, nMaskNPC)
	end
	Msg2Player("ID "..item_type..": <color=yellow>"..nChange)
	return 1
end
