Include("\\script\\dailogsys\\dailogsay.lua")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\activitysys\\functionlib.lua")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\dailogsys\\dailogsay.lua")
Include("\\script\\global\\fuyuan.lua")
Include("\\script\\lib\\log.lua")
Include("\\script\\lib\\timerlist.lua")
Include("\\script\\lib\\player.lua")
Include("\\script\\lib\\basic.lua") 

function main() 
	dofile("script/wumumenpai/thiphong.lua")
	if (GetTask(12) == 260*256 and GetLevel() >= 40)  then
		Talk(3,"nv4x1","Thi Phong: Ng��i ��n r�t ��ng l�c, theo tin t�nh b�o, tri�u ��nh �� c� La Hi�n Th�nh l�m s� gi� ��n T��ng D��ng �� c�u h�a Kim Qu�c","Thi Phong: La Hi�n Th�nh v�n l� m�t t�n quan nh� trong v� �n oan c�a Nh�c t��ng quan , kh�ng ng� b�y gi� h�n �� tr� th�nh th�a t��ng, h�n l� 1 k� ph�n b�i, r�t d� thay ��i b�n ch�t. Nh�n danh b�n ���ng, ng��i h�y l�p t�c �i ti�u di�t t�n gian t�c n�y?")
	elseif GetTask(12) == 320*256 then
		Talk(3,"nv4x4","Thi Phong: Ng��i �� gi�t ch�t La Hi�n Th�nh ch�a?","Thi Phong: Ng��i l�i �� h�n ch�y tho�t sao? Kh�n ki�p, ta h�n kh�ng th� m�t ki�m ch�m ch�t t�n �c t�c La Hi�n Th�nh!")
	else
		Talk(1,"","Thi Phong: ��ng �c hi�p k� y�u, nh�ng n�u g�p k� �c th� tuy�t ��i kh�ng tha!")
	end
end

function nv4x1() 
	Talk(1,"nv4x2","Nh�n nhi�m v� ti�u di�t La Hi�n Th�nh, tr� th� cho Nh�c Phi")
end

function nv4x2()
	Describe("Thi Phong: H�m nay l� m�t c� h�i t�t. H�n s� �i ngang qua ��o H��ng Th�n, ��y l� n�i ph�c k�ch tuy�t v�i, h�y nhanh ch�ng ��n �� ti�u di�t h�n",2,"���c ta s� �i ngay/nv4x3","Ta c� vi�c kh�c/no")
end

function nv4x3() 
	SetTask(12,280*256)
	AddNote("��n ��o H��ng Th�n (181/204), ti�u di�t La Hi�n Th�nh.") 
	Msg2Player("��n ��o H��ng Th�n (181/204), ti�u di�t La Hi�n Th�nh.")  
	--local nIndex = AddNpc(2488,1,SubWorldID2Idx(101),1448*32,3277*32,0,"La Hi�n Th�nh")
	--SetNpcScript(nIndex,"\\script\\wumumenpai\\lahoan.lua")
	--AddTimer(1800*18,"OnTimeout",nIndex)
end 

function nv4x4() 
	SetTask(12,330*256)
	SetRank(94)
	AddMagic(1963)
	AddMagic(1979)
	Msg2Player("Ho�n th�nh nhi�m v� c�p 40, h�c ���c <color=yellow>N� Ph�ch Thi�n Nhai<color> v� <color=yellow>Tri�u Thi�n Khuy�t<color>")  
end

--function OnTimeout(nIndex)
--	DelNpc(nIndex);
--end 