TB_SNOWMAN_ID = {
	[1319] = "snowman_green_special",
	[1320] = "snowman_red_special",
	[1321] = "snowman_special",
	[1322] = "snowman_green",
	[1323] = "snowman_red",
	[1324] = "snowman_normal",
}

function main(nItemIdx)	
	local nG, nD, nP = GetItemProp(nItemIdx);
	if (not TB_SNOWMAN_ID[nP]) then
		return 1;
	end;
	dostring(TB_SNOWMAN_ID[nP].."()");
end;

function snowman_green_special()
	AddOwnExp(20*1000000)
	SetTask(4000, GetTask(4000) + 200)	
	AddStackItem(100, 6, 1, 3203, 0, 0, 0)
	Msg2Player("Nh�n ���c 200 Ch�n Nguy�n v� 100 H� M�ch ��n")
	k = random(0,10)
	if k==0 then
		AddStackItem(200, 6, 1, 3203, 0, 0, 0)
		Msg2Player("May m�n nh�n ���c 200 H� M�ch ��n")
	elseif k==1 then
		AddItem(6,1,22,1,1,1)
		Msg2Player("May m�n nh�n ���c 1 T�y t�y kinh")
	end
end;

function snowman_red_special()
	AddOwnExp(40*1000000)
	SetTask(4000, GetTask(4000) + 400)	
	AddStackItem(200, 6, 1, 3203, 0, 0, 0)
	Msg2Player("Nh�n ���c 400 Ch�n Nguy�n v� 200 H� M�ch ��n")
	k = random(0,8)
	if k==0 then
		AddStackItem(300, 6, 1, 3203, 0, 0, 0)
		Msg2Player("May m�n nh�n ���c 300 H� M�ch ��n")
	elseif k==1 then
		AddItem(6,1,22,1,1,1)
		Msg2Player("May m�n nh�n ���c 1 T�y t�y kinh")
	end
end;

function snowman_special()
	AddOwnExp(60*1000000)
	SetTask(4000, GetTask(4000) + 1000)	
	AddStackItem(500, 6, 1, 3203, 0, 0, 0)
	Msg2Player("Nh�n ���c 1000 Ch�n Nguy�n v� 500 H� M�ch ��n")
	k = random(0,6)
	if k==0 then
		AddStackItem(400, 6, 1, 3203, 0, 0, 0)
		Msg2Player("May m�n nh�n ���c 400 H� M�ch ��n")
	elseif k==1 then
		AddItem(6,1,22,1,1,1)
		Msg2Player("May m�n nh�n ���c 1 T�y t�y kinh")
	end
end;

function snowman_green()
	AddOwnExp(10*1000000)
	SetTask(4000, GetTask(4000) + 200)	
	AddStackItem(100, 6, 1, 3203, 0, 0, 0)
	Msg2Player("Nh�n ���c 200 Ch�n Nguy�n v� 100 H� M�ch ��n")
	k = random(0,10)
	if k==0 then
		AddItem(6,1,26,1,1,1)
		Msg2Player("May m�n nh�n ���c 1 V� l�m m�t t�ch")
	elseif k==1 then
		AddItem(6,1,22,1,1,1)
		Msg2Player("May m�n nh�n ���c 1 T�y t�y kinh")
	end
end;

function snowman_red()
	AddOwnExp(30*1000000)
	SetTask(4000, GetTask(4000) + 400)	
	AddStackItem(200, 6, 1, 3203, 0, 0, 0)
	Msg2Player("Nh�n ���c 400 Ch�n Nguy�n v� 200 H� M�ch ��n")
	k = random(0,8)
	if k==0 then
		AddItem(6,1,26,1,1,1)
		Msg2Player("May m�n nh�n ���c 1 V� l�m m�t t�ch")
	elseif k==1 then
		AddItem(6,1,22,1,1,1)
		Msg2Player("May m�n nh�n ���c 1 T�y t�y kinh")
	end
end;

function snowman_normal()
	AddOwnExp(50*1000000)
	SetTask(4000, GetTask(4000) + 1000)	
	AddStackItem(500, 6, 1, 3203, 0, 0, 0)
	Msg2Player("Nh�n ���c 1000 Ch�n Nguy�n v� 500 H� M�ch ��n")
	k = random(0,6)
	if k==0 then
		AddStackItem(400, 6, 1, 3203, 0, 0, 0)
		Msg2Player("May m�n nh�n ���c 400 H� M�ch ��n")
	elseif k==1 then
		AddItem(6,1,22,1,1,1)
		Msg2Player("May m�n nh�n ���c 1 T�y t�y kinh")
	end
end;