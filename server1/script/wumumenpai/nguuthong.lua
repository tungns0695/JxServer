function main() 
	dofile("script/wumumenpai/nguuthong.lua")
	if (GetTask(12) == 330*256 and GetLevel() >= 50)  then
		Talk(3,"nv5x1","Ng�u Th�ng: Ng��i c� mu�n h�c th�m v� c�ng hay kh�ng? ��nh v�i ta 1 tr�n, ta s� d�y cho ng��i",""..GetName()..": V� c�ng c�a s� huynh qu� th�t cao c��ng, t�i h� n�o d�m...")
	elseif (GetTask(12) == 350*256 and GetLevel() >= 50) then
		Talk(3,"nv5x4",""..GetName()..": C� ph�i ta �� th�nh c�ng v��t qua b�i ki�m tra!","Ng�u Th�ng: S� ��! kh�ng t�, kh�ng t�! Nh�t ��nh ph�i ch�m ch� h�n n�a...")
	else
		Talk(1,"","Ng�u Th�ng: N�u c� k� n�o d�m b�t n�t ng��i, h�y k�u t�n ta, ��m b�o b�n ch�ng s� s� v� m�t!")
	end
end

function nv5x1() 
Describe("Ng�u Th�ng: ��ng nhi�u l�i, ta s� ��i ng��i � s�n t� v�",2,"���c r�i, ta s� ��n ��/nv5x2","Ta c� vi�c kh�c/no")
end 

function nv5x2() 
	SetTask(12,340*256) 
	Msg2Player("��n s�n t� v� (194,191).")  
end 

function nv5x4() 
	SetTask(12,360*256)
	SetRank(95) AddMagic(1980)
	Msg2Player("Ho�n th�nh nhi�m c�p 50, h�c ���c <color=yellow>C� T��ng B�ch Chi�n H�m<color>")  
end 