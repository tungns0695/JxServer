IL("TITLE"); -- quan li title
--Include("\\script\\vng_lib\\files_lib.lua") -- to read file
-- ChangeOwnFeature(0, -1, nSettingsIdx,  nHelm, nArmor, nWeapon, nHorse)
-- 0 l� v�nh vi�n, �i chung w -1 �� kh�ng set th�i gian
-- 1 l� c� t�nh th�i gian, s� th� 2 l� gi�y * 18
-- nSettingsIdx: -1 l� nam, -2 l� n�
-- b�t ��u t� 0 l� h�nh d�ng npc trong npcs.txt


function main()
	dofile("script/item/lessmoneygift.lua")
	--ITEM_TO_CHECK = loadsavevalue("settings/changefeature/ngoaitrang.txt")
	local ITEM_TO_CHECK = GetTaskTemp(168)
	--Msg2Player("Task value: <color=yellow>"..ITEM_TO_CHECK)
	if ITEM_TO_CHECK== -1 then
		ITEM_TO_CHECK = 4
	end
	local nHelm, nArmor, nWeapon, nHorse, nMaskNPC = GetPlayerFeature(PlayerIndex)
	local nSettingsIdx = -1 - GetSex()
	local nChange = 0
	local step = -1
	local item_type = ""
	--Msg2Player("ITEM_TO_CHECK: <color=yellow>"..ITEM_TO_CHECK)
	if ITEM_TO_CHECK == 4 then
		nChange = nHorse + step
		nHorse = nChange
		item_type = "ng�a"
		ChangeOwnFeature(0, -1, nSettingsIdx,  nHelm, nArmor, nWeapon, nHorse, nMaskNPC)
	elseif ITEM_TO_CHECK == 3 then
		nChange = nWeapon + step
		nWeapon = nChange	
		item_type = "v� kh�"
		ChangeOwnFeature(0, -1, nSettingsIdx,  nHelm, nArmor, nWeapon, nHorse, nMaskNPC)
	elseif ITEM_TO_CHECK == 2 then
		nChange = nArmor + step
		nArmor = nChange	
		item_type = "�o"
		ChangeOwnFeature(0, -1, nSettingsIdx,  nHelm, nArmor, nWeapon, nHorse, nMaskNPC)
	elseif ITEM_TO_CHECK == 1 then
		nChange = nHelm + step
		nHelm = nChange	
		item_type = "m�"
		ChangeOwnFeature(0, -1, nSettingsIdx,  nHelm, nArmor, nWeapon, nHorse, nMaskNPC)
	elseif ITEM_TO_CHECK == 0 then
		nChange = nMaskNPC + step
		nMaskNPC = nChange	
		item_type = "M�t n�"
		ChangeOwnFeature(0, -1, nMaskNPC)
	end
	Msg2Player("ID "..item_type..": <color=yellow>"..nChange)
	return 1
end
