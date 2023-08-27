Include("\\script\\misc\\daiyitoushi\\toushi_function.lua")
--------------------------------------------------------
function main()
		dofile("script/wumumenpai/nhacloi.lua")
		if (GetTask(12) == 390*256 and GetLevel() >= 60) then
			Say("<color=yellow>C�c h� t�m ta c� vi�c g�?",3,"T�i h� c� vi�c c�n th�nh gi�o ng�i/nvxuatsu5","��i ngh� ��u s� /#daiyitoushi_main(11)","Th�i/No")
		elseif (GetTask(12) == 430*256) then
			Say("<color=yellow>C�c h� t�m ta c� vi�c g�?",3,"T�i h� c� vi�c c�n th�nh gi�o ng�i/nvxuatsu9","��i ngh� ��u s� /#daiyitoushi_main(11)","Th�i/No")
		elseif (GetCamp() == 4 and GetLevel() >= 60 and GetLastFactionNumber() == 11 and GetTask(12) >= 440*256) then
			Say("<color=yellow>C�c h� t�m ta c� vi�c g�?",3,"T�i h� c� vi�c c�n th�nh gi�o ng�i/gianhaplaisumon","��i ngh� ��u s� /#daiyitoushi_main(11)","Th�i/No")
		elseif (GetCamp() >= 1 and GetCamp() <= 3 and GetLevel() >= 60 and GetLastFactionNumber() == 11 and GetTask(12) >= 440*256) then
			Say("<color=yellow>C�c h� t�m ta c� vi�c g�?",3,"T�i h� c� vi�c c�n th�nh gi�o ng�i/xuatsu","��i ngh� ��u s� /#daiyitoushi_main(11)","Th�i/No")
		else
			Say("<color=yellow>C�c h� t�m ta c� vi�c g�?",3,"T�i h� c� vi�c c�n th�nh gi�o ng�i/oldentence","��i ngh� ��u s� /#daiyitoushi_main(11)","Th�i/No")
		end	
end

function oldentence() 
Talk(1,"","Ng��i c�a b�n ���ng ��u l� anh h�ng h�o ki�t")
end 

function nvxuatsu5() 
Talk(3,"nvxuatsu6",""..GetName()..": Ch��ng m�n, ta �� t�m ���c manh m�i c�a V� M�c Di Th�, c�i ��t � T�ng Kinh C�c l� gi�, m�t m�nh th� ch�a ch�y h�t ���c t�m th�y, c� v� nh� H�n Kh�i Long s� th�c �� ��n b�n t�u ph�a ��ng.","Nh�c L�i: �i�u n�y l� kh�ng th�, ta v�i h�n c� m�i th�m t�nh. C� g� �� m� �m, h�y mau ��n b�n t�u, nh�t ��nh ph�i b�o v� V� M�c Di Th�, �� l� t�n v�t c�a b�n m�n.")
end 

function nvxuatsu6() 
SetTask(12,400*256)
Msg2Player("��n b�n t�u (221/203) �i�u tra.")  
end

function nvxuatsu9() 
Talk(6,"nvxuatsu10","Nh�c L�i: H�n Kh�i Long th� n�o? Ng��i �� �em V� M�c Di Th� v� r�i �?",""..GetName()..": Th�t may l� n� ch�a b� m�t! Tuy nhi�n... H�n s� th�c �� b� gi�t, v� ng��i ��nh c�p c�ng ch�nh l� H� Tr�y, H�n s� th�c �� b� h�n h�m h�i, ta �� gi�t ch�t h�n ngay t�i ch�.","Nh�c L�i: Kh�n ki�p, kh�ng th� t� tay gi�t ch�t t�n ph�n �� ��, ng��i l�m r�t t�t, �� b�o v� ���c t�n v�t m�n ph�i, ng��i c� th� xu�t s�!")  
end  

function nvxuatsu10() 
	SetTask(12,440*256)
	SetCamp(4)
	SetCurCamp(4)
	SetRank(96)
	ConsumeEquiproomItem(1,6,1,5099,-1)
	Msg2Player("Ho�n th�nh nhi�m v� Xu�t S�.") 
end  

function gianhaplaisumon() 
Talk(6,"gianhaplaisumon2",""..GetName()..": Ch��ng m�n...","Nh�c L�i: Ng��i c�m th�y th� n�o khi xu�ng n�i?",""..GetName()..": Sau khi phi�u b�c giang h�, ta kh�ng k�m l�ng ���c, c�m th�y r�t nh� c�c s� huynh ��...","Nh�c L�i: V� H�n ���ng lu�n ch�o ��n ng��i, ta s� cho ph�p ng��i � l�i, n�u ng��i mu�n.",""..GetName()..": �� t� xin ��ng �, khi xu�ng n�i, �� t� c�ng t�ch g�p ���c m�t s� ti�n, ��i v�i �� t� c�ng v� �ch, t�t nh�t l� g�p v�o ng�n qu� c�a b�n ph�i, c� th� coi nh� ch�t l�ng th�nh c�a �� t�")
end 

function gianhaplaisumon2() 
Describe("Nh�c L�i: T�t th�i, h�y giao cho ta 5 v�n l��ng b�c",2,"���c th�i/gianhaplaisumon3","�� ta suy ngh� l�i/no")
end 

function gianhaplaisumon3() 
	local nJxb = 50000
	if GetCash() < nJxb then
		Talk(1,"","Xin l�i, �� ta chu�n b� l�i sau")
		return 1
	end
	Talk(1,"gianhaplaisumon4","Nh�c L�i: Ta th�ng cho ng��i l�m Th�n H�nh Qu�n, truy�n th� v� c�ng tuy�t h�c c�a b�n m�n.")
end

function gianhaplaisumon4()
	Pay(50000)
	if HaveMagic(1981) >= 0 and HaveMagic(1982) >= 0 and HaveMagic(1971) >= 0 then
		SetCamp(1)
		SetCurCamp(1)
		SetRank(97)
		Msg2Player("Gia nh�p V� H�n ���ng ch�nh ph�i.")
	else
		AddMagic(1981)
		AddMagic(1971)
		AddMagic(1982)
		SetCamp(1)
		SetCurCamp(1)
		SetRank(97)
		Msg2Player("Ho�n th�nh nhi�m v� Tr�ng Ph�n S� M�n, h�c ���c v� c�ng <color=yellow>V� M�c Di Th�, Tr� D�ng Si�u Lu�n, C� Xan L� Nh�c<color>")
	end 
end

function xuatsu()
	Describe("Nh�c L�i: Ng��i c� mu�n xu�ng n�i kh�ng?",2,"Xin cho �� t� ���c xu�ng n�i/xuatsu2","�� t� s� quay l�i sau/no")
end

function xuatsu2()
	SetCamp(4)
	SetCurCamp(4)
end
