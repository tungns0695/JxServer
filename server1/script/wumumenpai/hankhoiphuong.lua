	function main() 
dofile("script/wumumenpai/hankhoiphuong.lua")
	if (GetTask(12) == 360*256 and GetLevel() >= 60) then
		Talk(4,"nvxuatsu1","H�n Kh�i Ph��ng: S� ��, mau ��n ��y",""..GetName()..": S� huynh c�n ta gi�p g� sao?","H�n Kh�i Ph��ng: Ho�n Nhan H�ng Li�t c� t�m �ia b�t ch�nh, �� �� � ��n V� M�c Di Th�, l�o t�c th��ng xuy�n ph�i ng��i ��n tr�m",""..GetName()..": C� chuy�n nh� v�y sao? S� huynh nh�t ��nh ph�i c�n tr�ng...")
	elseif (GetTask(12) == 380*256 and GetLevel() >= 60) then
		Talk(3,"nvxuatsu4",""..GetName()..": Ta kh�ng t�m th�y H�n s� th�c, nh�ng t�m th�y 1 �t m�nh gi�y b� ��t c�n s�t l�i, s� huynh h�y xem qua","H�n Kh�i Ph��ng: Kh�n ki�p, Kh�i Long s� th�c nh�t ��nh �� x�y ra chuy�n r�i. S� t�nh c�p b�ch ng��i h�y l�p t�c �i b�o c�o v�i ch��ng m�n")
	else
		Talk(1,"","H�n Kh�i Ph��ng: N�u g�p Kim nh�n, nh�t ��nh ph�i gi�t ch�t ch�ng �� an �i vong linh c�a s� th�c.")
	end
end

function nvxuatsu1() 
	Describe("H�n Kh�i Ph��ng: �a t� s� ��, cho n�n ta v� H�n Kh�i Long s� th�c thay phi�n nhau canh g�c � ��y c� ng�y l�n ��m. H�m nay ��n ��n phi�n Kh�i Long s� th�c, m� v�n ch�a t�i, ta kh�ng th� r�i �i, ng��i h�y gi�p ta t�m Kh�i Long s� th�c �i",2,"���c r�i, ta s� �i ngay/nvxuatsu2","Ta c� vi�c kh�c/no")
end 

function nvxuatsu2() 
	SetTask(12,370*256)
	Msg2Player("��n (196/200) t�m Manh M�i.")  
end 

function nvxuatsu4() 
SetTask(12,390*256)
ConsumeEquiproomItem(1,6,1,5098,-1)
Msg2Player("��n g�p ch��ng m�n Nh�c L�i (211/190) b�o c�o t�nh h�nh.")  
end 