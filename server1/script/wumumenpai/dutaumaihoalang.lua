function main()	
	if (GetTask(12) == 80*256) then
		Talk(5,"nv2x5","Du T�u M�i H�a Lang: V� anh h�ng n�y, kh�ng bi�t c�c h� �� nghe ��n Tuy�t Th� Binh Kh� hay kh�ng?","Du T�u M�i H�a Lang: Tr��c ��y ta �� c�u m�t ng��i, ng��i �� ���c m�nh danh l� th� r�n th�n b� hi�m c�. �� tr� �n, anh �y �� m� l� luy�n v� bi�n nh�ng nguy�n li�u qu� c�a ta th�nh m�t v� kh� c� uy l�c v� song!","Du T�u M�i H�a Lang: Sau khi h�n r�i �i c� n�i r�ng, v� anh h�ng th� 250 m� ta g�p s� l� ch� nh�n c�a lo�i binh kh� n�y","Du T�u M�i H�a Lang: Kh�ng ng�, ng��i ch�nh l� ng��i ��.")
	else
		Talk(1,"","Ta c� r�t nhi�u v�t ph�m qu�, ng��i mu�n mua g�?")
	end	
end

function nv2x5()
	Describe("Du T�u M�i H�a Lang: C�c h� v�i ta c� duy�n, kh�ng y�u c�u g� kh�c, ch� c�n ��i hi�p cho 1 n�a s� ti�n nguy�n li�u, ta s� �em t�ng binh kh� �� cho ��i hi�p, ng��i th�y th� n�o?",3,"H�, th�t l� m�t t�n gian th��ng, ta s� cho ng��i bi�t tay/nv2x6","�� ta suy ngh� l�i/no")
end

function nv2x6()
	local nNpcIndex = GetLastDiagNpc();
	DelNpc(nNpcIndex)
	SetTask(12,90*256)
	local indexNPC = AddNpcEx(2485, 30, 4, SubWorldID2Idx(179), 1875*32, 2636*32, 1, "Th��ng gia tr� m�t", 0)
	if indexNPC then
		SetNpcScript(indexNPC, "\\script\\wumumenpai\\danhdutaumaihoalang.lua")
	end
end
