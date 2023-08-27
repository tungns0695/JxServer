
Include("\\script\\dailogsys\\dailogsay.lua")
function main() 
if GetLastFactionNumber() == 12 then
	Describe("H��ng Chi Nam: H�a ra l� s� ��, c�n gi�p �� g�?",5,"T�m hi�u m�n ph�i/timhieuquyphai","T�m hi�u ��ng m�n/timhieucaothu","T�m hi�u nhi�m v�/timhieunhiemvu","T�m hi�u s� tr��ng luy�n c�ng/timhieusotruongluyencong","T�m hi�u v� ngh� b�n m�n/timhieuvonghebonmon")
	else
	Describe("H��ng Chi Nam: ��i hi�p ��n t� ph�i, ch�ng hay c� chuy�n g�?",2,"T�m hi�u qu� ph�i/timhieuquyphai","T�m hi�u c�c v� cao th� c�a qu� ph�i./timhieucaothu")
end
end

------------------------------

function timhieuvonghebonmon() 
	Talk(3,"","Gi�ng ng��i <color=red>ph�i Ti�u Dao<color>, v� ngh� ph�t tri�n theo 2 ���ng kh�c nhau:","Th�nh th�o �m lu�t v� ngh�, v� c�ng l�y C�m Ki�m l�m v� kh� l��i �ao, kh�ng b�n m� h�p �m lu�t, chi�u th�c nho nh� l�i kh�ng m�t linh ��ng phi�u d�t, bi�n �o kh� l��ng, c� th� c�ng c� th� th�.")	
end

----------------------------
function timhieunhiemvu()
--if (GetTask(169) == 12) and (GetTask(169) < 20) then
if (GetTask(169) < 20) then
Describe("H��ng Chi Nam: Mu�n gia nh�p m�n ph�i h�c v� c�ng, c� th� th�ng qua vi�c ho�n th�nh nhi�m v� nh�p m�n �� th�c hi�n. Sau khi nh�p m�n, l�n l��t ho�n th�nh nhi�m v� 5 m�n ph�i l� c� th� h�c ���c v� c�ng, nh�n ���c c�p h�m, sau khi ho�n th�nh nhi�m v� xu�t s� l� c� th� xu�t s� d� d�ng. ��nh d�u nhi�m v� c�a ng��i l�: 2560. Ti�p theo nh�ng vi�c ng��i c� th� l�m l�: ",1,"Nhi�m v� l�y n��c pha tr�./phatra")  			
elseif (GetTask(169) >= 20) and  (GetTask(169) < 30) then
Describe("H��ng Chi Nam: Mu�n gia nh�p m�n ph�i h�c v� c�ng, c� th� th�ng qua vi�c ho�n th�nh nhi�m v� nh�p m�n �� th�c hi�n. Sau khi nh�p m�n, l�n l��t ho�n th�nh nhi�m v� 5 m�n ph�i l� c� th� h�c ���c v� c�ng, nh�n ���c c�p h�m, sau khi ho�n th�nh nhi�m v� xu�t s� l� c� th� xu�t s� d� d�ng. ��nh d�u nhi�m v� c�a ng��i l�: 5120. Ti�p theo nh�ng vi�c ng��i c� th� l�m l�: ",1,"Nhi�m v� Ng� ki�m./ngokiem") 
elseif (GetTask(169) >= 30) and  (GetTask(169) < 40) then
Describe("H��ng Chi Nam: Mu�n gia nh�p m�n ph�i h�c v� c�ng, c� th� th�ng qua vi�c ho�n th�nh nhi�m v� nh�p m�n �� th�c hi�n. Sau khi nh�p m�n, l�n l��t ho�n th�nh nhi�m v� 5 m�n ph�i l� c� th� h�c ���c v� c�ng, nh�n ���c c�p h�m, sau khi ho�n th�nh nhi�m v� xu�t s� l� c� th� xu�t s� d� d�ng. ��nh d�u nhi�m v� c�a ng��i l�: 7680. Ti�p theo nh�ng vi�c ng��i c� th� l�m l�: ",1,"Nhi�m v� B�ng T�m Ng�c L� Cao./ngoclocao") 
elseif (GetTask(169) >= 40) and  (GetTask(169) < 50) then
Describe("H��ng Chi Nam: Mu�n gia nh�p m�n ph�i h�c v� c�ng, c� th� th�ng qua vi�c ho�n th�nh nhi�m v� nh�p m�n �� th�c hi�n. Sau khi nh�p m�n, l�n l��t ho�n th�nh nhi�m v� 5 m�n ph�i l� c� th� h�c ���c v� c�ng, nh�n ���c c�p h�m, sau khi ho�n th�nh nhi�m v� xu�t s� l� c� th� xu�t s� d� d�ng. ��nh d�u nhi�m v� c�a ng��i l�: 10240. Ti�p theo nh�ng vi�c ng��i c� th� l�m l�: ",1,"Nhi�m v� V�n T� Tr�c Thu B�nh./tracthubinh") 
elseif (GetTask(169) >= 50) and  (GetTask(169) < 61) then
Describe("H��ng Chi Nam: Mu�n gia nh�p m�n ph�i h�c v� c�ng, c� th� th�ng qua vi�c ho�n th�nh nhi�m v� nh�p m�n �� th�c hi�n. Sau khi nh�p m�n, l�n l��t ho�n th�nh nhi�m v� 5 m�n ph�i l� c� th� h�c ���c v� c�ng, nh�n ���c c�p h�m, sau khi ho�n th�nh nhi�m v� xu�t s� l� c� th� xu�t s� d� d�ng. ��nh d�u nhi�m v� c�a ng��i l�: 12800. Ti�p theo nh�ng vi�c ng��i c� th� l�m l�: ",1,"Nhi�m v� V�nh L�c Phong V�n./vinhlacphongvan") 
elseif (GetTask(169) >= 61) and  (GetTask(169) < 71) then
Describe("H��ng Chi Nam: Mu�n gia nh�p m�n ph�i h�c v� c�ng, c� th� th�ng qua vi�c ho�n th�nh nhi�m v� nh�p m�n �� th�c hi�n. Sau khi nh�p m�n, l�n l��t ho�n th�nh nhi�m v� 5 m�n ph�i l� c� th� h�c ���c v� c�ng, nh�n ���c c�p h�m, sau khi ho�n th�nh nhi�m v� xu�t s� l� c� th� xu�t s� d� d�ng. ��nh d�u nhi�m v� c�a ng��i l�: 15360. Ti�p theo nh�ng vi�c ng��i c� th� l�m l�: ",1,"Nhi�m v� xu�t s�./xuatsu") 
elseif (GetTask(169) == 71) and GetCurCamp() == 4 and GetCamp() == 4 or (GetTask(169) == 74) and GetCurCamp() == 4 and GetCamp() == 4 then
Describe("H��ng Chi Nam: Mu�n gia nh�p m�n ph�i h�c v� c�ng, c� th� th�ng qua vi�c ho�n th�nh nhi�m v� nh�p m�n �� th�c hi�n. Sau khi nh�p m�n, l�n l��t ho�n th�nh nhi�m v� 5 m�n ph�i l� c� th� h�c ���c v� c�ng, nh�n ���c c�p h�m, sau khi ho�n th�nh nhi�m v� xu�t s� l� c� th� xu�t s� d� d�ng. ��nh d�u nhi�m v� c�a ng��i l�: 17920. Ti�p theo nh�ng vi�c ng��i c� th� l�m l�: ",1,"Tr�ng ph�n s� m�n./trungphan") 
end;
end

-----------------------------------
function timhieusotruongluyencong()
if (GetLevel() >=10) and (GetLevel() < 20) then
Describe("H��ng Chi Nam: ��i v�i h� <color=red>Th�y H�n 10 c�p <color> nh� ng��i th� ��a �i�m luy�n c�ng t�t nh�t l�: G�n b�n b�n m�n, c�c th�nh th� n�i danh.",1,"K�t th�c ��i tho�i!/khonghoinua")  			
elseif (GetLevel() >=20) and (GetLevel() < 30) then
Describe("H��ng Chi Nam: ��i v�i h� <color=red>Th�y H�n 20 c�p <color> nh� ng��i th� ��a �i�m luy�n c�ng t�t nh�t l�: Ki�m C�c Trung Nguy�n, Ki�m C�c T�y Nam, Ki�m C�c T�y B�c, La Ti�u S�n, V� L�ng S�n, T�n L�ng.",1,"K�t th�c ��i tho�i!/khonghoinua")
elseif (GetLevel() >=30) and (GetLevel() < 40) then
Describe("H��ng Chi Nam: ��i v�i h� <color=red>Th�y H�n 30 c�p <color> nh� ng��i th� ��a �i�m luy�n c�ng t�t nh�t l�: B�ch V�n ��ng, Th�c C��ng s�n, th� ph� ��ng, v� Ph�c Ng�u S�n ��ng, Kim Quang ��ng.",1,"K�t th�c ��i tho�i!/khonghoinua")
elseif (GetLevel() >=40) and (GetLevel() < 50) then
Describe("H��ng Chi Nam: ��i v�i h� <color=red>Th�y H�n 40 c�p <color> nh� ng��i th� ��a �i�m luy�n c�ng t�t nh�t l�: Phong Nh�n ��ng, �i�m th��ng ��ng t�ng 1, Th�n Ti�n ��ng, v� Ph�c Ng�u S�n T�y, Kinh Ho�ng ��ng.",1,"K�t th�c ��i tho�i!/khonghoinua")
elseif (GetLevel() >=50) and (GetLevel() < 60) then
Describe("H��ng Chi Nam: ��i v�i h� <color=red>Th�y H�n 50 c�p <color> nh� ng��i th� ��a �i�m luy�n c�ng t�t nh�t l�: H��ng Th�y ��ng, Thi�n T�m Th�p t�ng 1,2, v� t�n t��ng T� ��a ��o, �c B� ��a ��o.",1,"K�t th�c ��i tho�i!/khonghoinua")
elseif (GetLevel() >=60) and (GetLevel() < 70) then
Describe("H��ng Chi Nam: ��i v�i h� <color=red>Th�y H�n 60 c�p <color> nh� ng��i th� ��a �i�m luy�n c�ng t�t nh�t l�: Thi�n T�m Th�p t�ng 3, 108 La H�n Tr�n, v� c�m ��a m� cung, Ho�nh S�n Ph�i.",1,"K�t th�c ��i tho�i!/khonghoinua")
elseif (GetLevel() >=70) and (GetLevel() < 80) then
Describe("H��ng Chi Nam: ��i v�i h� <color=red>Th�y H�n 70 c�p <color> nh� ng��i th� ��a �i�m luy�n c�ng t�t nh�t l�: Tr��ng Giang Nguy�n ��u, S�n B�o ��ng, v� ��o Hoa Nguy�n, D��c V��ng ��ng t�ng 2, L�m Du Quan.",1,"K�t th�c ��i tho�i!/khonghoinua")
elseif (GetLevel() >=80) and (GetLevel() < 90) then
Describe("H��ng Chi Nam: ��i v�i h� <color=red>Th�y H�n 80 c�p <color> nh� ng��i th� ��a �i�m luy�n c�ng t�t nh�t l�: Sa m�c ��a Bi�u, Phi Thi�n ��ng, Ph� Dung ��ng, D��ng Trung ��ng, C� D��ng ��ng, D��c V��ng ��ng t�ng 3, Tr��ng B�ch S�n C��c.",1,"K�t th�c ��i tho�i!/khonghoinua")
elseif (GetLevel() >=90) then
Describe("H��ng Chi Nam: ��i v�i h� <color=red>Th�y H�n 90 c�p <color> nh� ng��i th� ��a �i�m luy�n c�ng t�t nh�t l�: Sa m�c s�n ��ng t�ng 1,2,3, v� Kh�a Lang ��ng, Ti�n C�c ��ng, Tr��ng B�ch S�n Nam L�c, Tr��ng B�ch S�n B�c L�c.",1,"K�t th�c ��i tho�i!/khonghoinua")
end;
end


---------------------------------------------
function timhieuquyphai()
Describe("H��ng Chi Nam: Mu�n t�m hi�u c�i g�?",5,"Kh�i nguy�n m�n ph�i/khoinguyenmonphai","V� tr� ��a l�/vitridialy","��a v� giang h�/diavigiangho","��c s�c m�n ph�i/dacsacmonphai","Kh�ng h�i n�a!/khonghoinua")  			
end;



function khoinguyenmonphai()
Describe("H��ng Chi Nam: Mu�n th�i nh� ���ng k�, nh� s� �m bay khanh t�i Giang Ho�i m�t v�ng th��ng xuy�n t�p y�n x��ng ho�. M�i khi g�p nh� t�p, Th��ng r�t l�u h�nh, truy�n v� ca t�ng, ch�ng v�n nh�n m� danh m� t�i, t� c� ph� ki�n, l�y v�n h�i b�n, c�ng nghi�n t�p v� h�c. Sau n�n ph� v�n ng��i nh� th� d�n d�n t� th�nh m�t ph�i, s�ng ch� l�y C�m Ki�m l�m ch�, kh�ng b�n m� h�p �m lu�t ��c bi�t chi�u th�c, khai s�n l�p t�ng, ��i ngo�i t� x�ng Ti�u Dao ph�i.",4,"V� tr� ��a l�/vitridialy","��a v� giang h�/diavigiangho","��c s�c m�n ph�i/dacsacmonphai","Kh�ng h�i n�a!/khonghoinua") 			
end;

function vitridialy()
Describe("H��ng Chi Nam: Hoa S�n n�i ti�ng l� 'T� nh�c' trong 'ng� nh�c', ph�a B�c gi�p v�i b�nh nguy�n V� H� b�ng ph�ng v� s�ng Ho�ng H�, ph�a Nam gi�p T�n L�nh, tr�n gi� c�a T�y B�c ti�n v�o trung nguy�n. Hoa S�n kh�ng ch� h�ng v� hi�m tr�, m� ��a th� n�i non nguy nga �� s�, t� l�u �� ���c m�nh danh l� 'Hoa S�n thi�n h� hi�m', 'K� hi�m thi�n h� �� nh�t s�n'.",4,"Kh�i nguy�n m�n ph�i/khoinguyenmonphai","��a v� giang h�/diavigiangho","��c s�c m�n ph�i/dacsacmonphai","Kh�ng h�i n�a!/khonghoinua")  			
end;

function khonghoinua()
end;



function bietroi()
end;
