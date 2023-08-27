Include("\\script\\dailogsys\\dailogsay.lua")

function main()
 dofile("script\global\anhhau\hangnga_doibanh.lua")

 local szTitle = "Trung Thu S�p ��n ch�c c�c h� v� gia ��nh s�c kh�e may m�n";
 tbOpt ={};
 tinsert(tbOpt,{"Ta ��i 1 b�nh trung thu th��ng",doi1banh})
 tinsert(tbOpt,{"Ta ��i 1 b�nh trung thu ��c Bi�t",doi1banhdacbiet})
 tinsert(tbOpt, {"�� ta suy ngh� l�i ��!", no})
 CreateNewSayEx(szTitle,tbOpt)

end

function doi1banh()
local tien = 100000
	if (GetCash() < tien) then
		Say("Ng��i kh�ng c� �� ng�n l��ng �� ��i v�t ph�m")
		return
	end
        if       CalcEquiproomItemCount(6,1,1503,1) >= 5 and
                 CalcEquiproomItemCount(6,1,1504,1) >= 5 and
                 CalcEquiproomItemCount(6,1,1505,1) >= 5 and
                CalcEquiproomItemCount(6,1,1506,1) >= 5 and
                CalcEquiproomItemCount(6,1,1507,1) >= 3 then
				 
                 ConsumeEquiproomItem(5,6,1,1503,1)
                 ConsumeEquiproomItem(5,6,1,1504,1)
                 ConsumeEquiproomItem(5,6,1,1505,1)
                 ConsumeEquiproomItem(5,6,1,1506,1)
                 ConsumeEquiproomItem(3,6,1,1507,1)
				 
				  local k = random(1510,1511)
                 AddItem(6,1,k,0,0,0,0)
		pay(100000)
         	SaveNow();
				Say("C�c h� �� ��i th�nh c�ng <color=yellow>B�nh Trung Thu Kinh ��<color>!", 0);
           else
               Say("Kh�ng �� nguy�n li�u m� ��i ��i b�nh ?", 0);
            end

 
end

function doi1banhdacbiet()
local tien = 500000
	if (GetCash() < tien) then
		Say("Ng��i kh�ng c� �� ng�n l��ng �� ��i v�t ph�m")
		return
	end
        if       CalcEquiproomItemCount(6,1,1503,1) >= 5 and
                 CalcEquiproomItemCount(6,1,1504,1) >= 5 and
                 CalcEquiproomItemCount(6,1,1505,1) >= 5 and
                 CalcEquiproomItemCount(6,1,1506,1) >= 5 and
                 CalcEquiproomItemCount(6,1,1507,1) >= 3 and
                 CalcEquiproomItemCount(6,1,1508,1) >= 1 and
                 CalcEquiproomItemCount(6,1,1509,1) >= 1 then
				 
                 ConsumeEquiproomItem(5,6,1,1503,1)
                 ConsumeEquiproomItem(5,6,1,1504,1)
                 ConsumeEquiproomItem(5,6,1,1505,1)
                 ConsumeEquiproomItem(5,6,1,1506,1)
                 ConsumeEquiproomItem(3,6,1,1507,1)
                 ConsumeEquiproomItem(1,6,1,1508,1)
                 ConsumeEquiproomItem(1,6,1,1509,1)
				 
				  --local k = random(1512,1513)
                 AddItem(6,1,k,0,0,0,0)
			pay(500000)
         	SaveNow();
				Say("C�c h� �� ��i th�nh c�ng <color=yellow>B�nh Trung Thu Kinh ��<color>!", 0);
           else
               Say("Kh�ng �� nguy�n li�u m� ��i ��i b�nh ?", 0);
            end 
end


