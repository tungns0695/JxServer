-----------------------------------------------------
function main() 
	dofile("script/wumumenpai/luyenvutranggiaoquan.lua")
	if GetTask(12) == 50*256 and GetLevel() >= 20 then
		Describe("Luy�n V� Tr�ng Gi�o Quan: Ng��i c� mu�n v�o v� tr��ng b�y gi� kh�ng?",2,"H�y ��a ta v�o/nv2x2","�� ta suy ngh� l�i/no")
	elseif GetTask(12) == 340*256 and GetLevel() >= 50 then
		Describe("Luy�n V� Tr�ng Gi�o Quan: Ng��i c� mu�n v�o v� tr��ng b�y gi� kh�ng?",2,"H�y ��a ta v�o/nv5x3","�� ta suy ngh� l�i/no")
	elseif GetTask(13) == 10*256 and GetLevel() >= 50 then
		Describe("Luy�n V� Tr�ng Gi�o Quan: Ng��i c� mu�n v�o v� tr��ng b�y gi� kh�ng?",2,"H�y ��a ta v�o/nvkydanhdetu2","�� ta suy ngh� l�i/no")
	else
		Talk(1,"","Luy�n V� Tr�ng Gi�o Quan: Mu�n n�ng cao v� c�ng, th� ph�i ch�u kh� h�c h�i v� r�n luy�n.")
	end
end
--------------------------------------------------------------------------------------------------------------------------------------------
function nv2x2() 
	local npc1 = AddNpcEx(2478, 20, 0, SubWorldID2Idx(1042), 1502*32, 3091*32, 1, "C�t Khang", 0)
	SetNpcScript(npc1, "\\script\\wumumenpai\\danhdienvotruong1.lua")
	local npc2 = AddNpcEx(2479, 20, 0, SubWorldID2Idx(1042), 1505*32, 3091*32, 1, "Th� Nhu�", 0)
	SetNpcScript(npc2, "\\script\\wumumenpai\\danhdienvotruong1.lua")	
	NewWorld(1042, 1508, 3089)
	SetFightState(1) 
end 
------------------------------------------------------------------------------------------------------------------------------------------
function nv5x3() 
	local npc1 = AddNpcEx(2493, 20, 0, SubWorldID2Idx(1042), 1507*32, 3091*32, 1, "Ng�u Th�ng", 0)
	SetNpcScript(npc1, "\\script\\wumumenpai\\tinhanhsuhuynh.lua")
	NewWorld(1042, 1508, 3089)
	SetFightState(1) 
	AddTimer(1 * 60 * 18, "OnTimeout", npc1) -- 1 phut
end 


function nvkydanhdetu2()
	local nIndex = AddNpc(2491, 1, SubWorldID2Idx(1042), 1502*32, 3091*32, 1, "C��ng Gi�")
	SetNpcScript(nIndex,"\\script\\wumumenpai\\cuonggia.lua")
	AddTimer(1 * 60 * 18, "OnTimeout", nIndex) -- 5 phut
	NewWorld(1042,1508,3089)
	SetFightState(1) 
end

function OnTimeout(nNpcIndex)
	DelNpc(nNpcIndex);
end
------------------------