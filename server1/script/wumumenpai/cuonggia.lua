function main(nNpcIdx)	
	if (GetTask(13) == 10*256) then
		Describe("C��ng Gi�: L�i m�t k� kh�ng s� ch�t? N�u ng��i ��ng � v� ��nh th�ng ta, ta s� t�ng cho ng��i m�t s� b�o b�i",2,"Ta kh�ng ngh� nh� v�y! ��ng th� �i/kydanhdetu2","�� ta ngh� l�i ��/no")
	end	
end

function kydanhdetu2(nNpcIdx)
	Describe("C��ng Gi�: Th�t ra, n�u ng��i ch�u ���c 10 chi�u c�a ta, ng��i s� v��t qua. N�u ng��i kh�ng ch�u ��ng ���c, c� th� c�u xin ta, ta s� cho ng��i �i, ng��i c� ngh� nh� th� kh�ng?",2,"Ta th� ch�t c�ng kh�ng ��u h�ng/kydanhdetu3","�� ta suy ngh� l�i/no")
end

function kydanhdetu3(nNpcIdx)
	local nNpcIndex = GetLastDiagNpc();
	DelNpc(nNpcIndex)
	local indexNPC = AddNpcEx(2492, 50, 0, SubWorldID2Idx(1042), 1504*32, 3087*32, 1, "C��ng gi� hung h�ng", 0)
	if indexNPC then
		SetNpcScript(indexNPC, "\\script\\wumumenpai\\cuonggia2.lua")
	end
end
