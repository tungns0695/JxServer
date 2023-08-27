Include("\\script\\lib\\progressbar.lua")

---------------------------------------------------------------------
local _GetFruit = function(nItemIndex)
	ConsumeEquiproomItem(1,6,1,5094,-1)
	SetTask(12,30*256) NewWorld(1042,1624,3130)
	Talk(1,"","Th�t m� ng� giang th�y tr� ti�n, duy c�ng nh��ng qu�n ��c tranh ti�n. <enter> Tr��ng ho�ng m�o h�u tam thi�n s�, th� ch� c�n kh�n th�p l�c ni�n.")
end

local _OnBreak = function()
	Msg2Player("Qu� tr�nh thu th�p b� gi�n �o�n.")
end

function main()
	dofile("script/wumumenpai/nhacphiyquangia.lua")
	if (GetTask(12) == 20*256 and GetLevel() >= 10) then
		tbProgressBar:OpenByConfig(10, %_GetFruit,{nItemIdx}, %_OnBreak)
	end
end

