Include("\\script\\activitysys\\config\\22\\head.lua")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\activitysys\\playerfunlib.lua")

--杜康酒兑换奖励
function pActivity:AddDukangjiuAward(TSK_EXP_A,TSK_DATE_A,nCount)
	--检查背包是否至少有一个1*1的空位
	if(CalcFreeItemCellCount() < 1) then
		Say("H祅h trang kh玭g  ch�, c莕 輙 nh蕋 kh玭g gian 1*1", 0);
		return
	end
	--先从背包中扣除杜康酒
	if (ConsumeItem(3, nCount, 6,1,2572,-1) ~= 1) then
		return
	end
	
	--计算应该加的经验
	local nBigRateExp = 500000
	local nSmallRateExp = 1000000
	local nDailyUpExp = 20000000 
	local nTaskDailyCount = self:GetTaskA(TSK_EXP_A,TSK_DATE_A)
	local nTemp = nDailyUpExp - nTaskDailyCount
	if (nTemp < nBigRateExp) then
		nBigRateExp = nTemp
	end
	if (nTemp < nSmallRateExp) then
		nSmallRateExp = nTemp
	end
	--给奖励
	local tbAward = 
	{
		{
			[1] = {nExp = nBigRateExp},
			[2] = {szName="T﹜ H� Long T躰h Tr�", tbProp={6,1,2573,1,0,0},nCount = 3,nExpiredTime=20101213},
			[3] = 
			{
				pFun = function (tbItem, nItemCount, szLogTitle)
					%self:AddTaskA(%TSK_EXP_A, %TSK_DATE_A, %nBigRateExp * nItemCount)
				end
			},
			nRate = 80,
		},
		{
			[1] = {nExp = nSmallRateExp},
			[2] = {szName="T﹜ H� Long T躰h Tr�", tbProp={6,1,2573,1,0,0},nCount = 6,nExpiredTime=20101213},
			
			[3] = 
			{
				pFun = function (tbItem, nItemCount, szLogTitle)
					%self:AddTaskA(%TSK_EXP_A, %TSK_DATE_A, %nSmallRateExp * nItemCount)
				end
			},
			nRate = 20,
		}
	}
	tbAwardTemplet:GiveAwardByRate(tbAward, "Ph莕 thng i х Khang T鰑")
	Say("Ru ngon! Ru ngon, kh玭g ph秈 d� d祅g c� ngi  t� hi誹 th秓 nh� v藋. у  �, ta c� m閠 輙 T﹜ H� Long T躰h Tr� t苙g ngi n�!")
end

--打开丝绸香包得到奖励
function pActivity:AddSichouxiangbaoAward(TSK_EXP_A)
	local nUpExp = 1e6
	local nRateExp1 = 2000000
	local nRateExp2 = 2500000
	local nRateExp3 = 3000000
	local nTaskValue = self:GetTask(TSK_EXP_A)
	local nTemp = (nUpExp - nTaskValue) * 10000
	if (nTemp < nRateExp1) then
		nRateExp1 = nTemp
	end
	if(nTemp < nRateExp2) then
		nRateExp2 = nTemp
	end
	if(nTemp < nRateExp3) then
		nRateExp3 = nTemp
	end
	local tbAward = 
	{
		{
			[1] = {nExp = nRateExp1},
			[2] = 
			{
				pFun = function(tbItem, nItemCount, szLogTitle)
					%self:AddTask(%TSK_EXP_A, %nRateExp1 / 10000)
				end
			},
			nRate = 70,
		},
		{
			[1] = {nExp = nRateExp2},
			[2] = 
			{
				pFun = function(tbItem, nItemCount, szLogTitle)
					%self:AddTask(%TSK_EXP_A, %nRateExp2 / 10000)
				end
			},
			nRate = 20,
		},
		{
			[1] = {nExp = nRateExp3},
			[2] = 
			{
				pFun = function(tbItem, nItemCount, szLogTitle)
					%self:AddTask(%TSK_EXP_A, %nRateExp3 / 10000)
				end
			},
			nRate = 10,
		},
	}
	tbAwardTemplet:GiveAwardByRate(tbAward, "Ph莕 thng t� t籱 hng bao")
end

function pActivity:CheckFreeRoom(nWidth, nHeight, nCount, szMsg)
	if(CountFreeRoomByWH(nWidth,nHeight,1) >= nCount) then	
		return 1
	else
		szMsg = format("H祅h trang kh玭g , c莕 輙 nh蕋 h祅h trang c遪 th鮝 %d %d*%d � tr鑞g", nCount, nWidth, nHeight)
		Say(szMsg, 0)
	end	
end

--打开五彩香包得到奖励
function pActivity:AddWucaixiangbaoAward(TSK_EXP_A)
	local nUpExp = 1e6
	local nRateExp1 = 5000000
	local nRateExp2 = 6000000
	local nRateExp3 = 8000000
	local nRateExp4 = 10000000
	local nRateExp5 = 20000000
	local nTaskValue = self:GetTask(TSK_EXP_A)
	local nTemp = (nUpExp - nTaskValue) * 10000
	if (nTemp < nRateExp1) then
		nRateExp1 = nTemp
	end
	if (nTemp < nRateExp2) then
		nRateExp2 = nTemp
	end
	if (nTemp < nRateExp3) then
		nRateExp3 = nTemp
	end
	if (nTemp < nRateExp4) then
		nRateExp4 = nTemp
	end
	if (nTemp < nRateExp5) then
		nRateExp5 = nTemp
	end
	local tbAwardEXP = 
	{
		{
			[1] = {nExp = nRateExp1},
			[2] = 
			{
				pFun = function(tbItem, nItemCount, szLogTitle)
					%self:AddTask(%TSK_EXP_A, %nRateExp1 / 10000)
				end
			},
			nRate = 67,
		},
		{
			[1] = {nExp = nRateExp2},
			[2] = 
			{
				pFun = function(tbItem, nItemCount, szLogTitle)
					%self:AddTask(%TSK_EXP_A, %nRateExp2 / 10000)
				end
			},
			nRate = 20,
		},
		{
			[1] = {nExp = nRateExp3},
			[2] = 
			{
				pFun = function(tbItem, nItemCount, szLogTitle)
					%self:AddTask(%TSK_EXP_A, %nRateExp3 / 10000)
				end
			},
			nRate = 10,
		},
		{
			[1] = {nExp = nRateExp4},
			[2] = 
			{
				pFun = function(tbItem, nItemCount, szLogTitle)
					%self:AddTask(%TSK_EXP_A, %nRateExp4 / 10000)
				end
			},
			nRate = 2,
		},
		{
			[1] = {nExp = nRateExp5},
			[2] = 
			{
				pFun = function(tbItem, nItemCount, szLogTitle)
					%self:AddTask(%TSK_EXP_A, %nRateExp5 / 10000)
				end
			},
			nRate = 1,
		},
	}
	local tbAward = 
	{
		{szName="Huy襫 Vi猲 Tr� Tu� Ch﹗ Li謒", tbProp={0,1595}, nQuality=1, nRate=0.002},	
		{szName="Huy襫 Vi猲 Tr� Tu� T╪g M穙", tbProp={0,1596}, nQuality=1, nRate=0.002},	
		{szName="Huy襫 Vi猲 Tr� Tu� Thng Gi韎", tbProp={0,1597}, nQuality=1, nRate=0.002},	
		{szName="Huy襫 Vi猲 Tr� Tu� H� Uy觧", tbProp={0,1598}, nQuality=1, nRate=0.002},	
		{szName="Huy襫 Vi猲 Tr� Tu� Y猽 Цi", tbProp={0,1599}, nQuality=1, nRate=0.002},	
		{szName="Huy襫 Vi猲 Tr� Tu� C� Sa", tbProp={0,1600}, nQuality=1, nRate=0.002},	
		{szName="Huy襫 Vi猲 Tr� Tu� Tri襫 Th�", tbProp={0,1601}, nQuality=1, nRate=0.002},	
		{szName="Huy襫 Vi猲 Tr� Tu� T╪g H礽", tbProp={0,1602}, nQuality=1, nRate=0.002},	
		{szName="Huy襫 Vi猲 Tr� Tu� Y猽 Tr魕", tbProp={0,1603}, nQuality=1, nRate=0.002},	
		{szName="Huy襫 Vi猲 Tr� Tu� H� Gi韎", tbProp={0,1604}, nQuality=1, nRate=0.002},	
		{szName="Huy襫 Vi猲 Vi猲 M穘 Ph藅 Ch﹗", tbProp={0,1605}, nQuality=1, nRate=0.002},	
		{szName="Huy襫 Vi猲 Vi猲 M穘 T╪g M穙", tbProp={0,1606}, nQuality=1, nRate=0.002},	
		{szName="Huy襫 Vi猲 Vi猲 M穘 Thng Gi韎", tbProp={0,1607}, nQuality=1, nRate=0.002},	
		{szName="Huy襫 Vi猲 Vi猲 M穘 H� Uy觧", tbProp={0,1608}, nQuality=1, nRate=0.002},	
		{szName="Huy襫 Vi猲 Vi猲 M穘 Y猽 Цi", tbProp={0,1609}, nQuality=1, nRate=0.002},	
		{szName="Huy襫 Vi猲 Vi猲 M穘 C� Sa", tbProp={0,1610}, nQuality=1, nRate=0.002},	
		{szName="Huy襫 Vi猲 Vi猲 M穘 T╪g C玭", tbProp={0,1611}, nQuality=1, nRate=0.002},	
		{szName="Huy襫 Vi猲 Vi猲 M穘 T╪g H礽", tbProp={0,1612}, nQuality=1, nRate=0.002},	
		{szName="Huy襫 Vi猲 Vi猲 M穘 Y猽 Tr魕", tbProp={0,1613}, nQuality=1, nRate=0.002},	
		{szName="Huy襫 Vi猲 Vi猲 M穘 H� Gi韎", tbProp={0,1614}, nQuality=1, nRate=0.002},	
		{szName="Huy襫 Vi猲 Ph藅 T﹎ H筺g Li謒", tbProp={0,1615}, nQuality=1, nRate=0.002},	
		{szName="Huy襫 Vi猲 Ph藅 T﹎ T╪g M穙", tbProp={0,1616}, nQuality=1, nRate=0.002},	
		{szName="Huy襫 Vi猲 Ph藅 T﹎ Thng Gi韎", tbProp={0,1617}, nQuality=1, nRate=0.002},	
		{szName="Huy襫 Vi猲 Ph藅 T﹎ H� Uy觧", tbProp={0,1618}, nQuality=1, nRate=0.002},	
		{szName="Huy襫 Vi猲 Ph藅 T﹎ Y猽 Цi", tbProp={0,1619}, nQuality=1, nRate=0.002},	
		{szName="Huy襫 Vi猲 Ph藅 T﹎ C� Sa", tbProp={0,1620}, nQuality=1, nRate=0.002},	
		{szName="Huy襫 Vi猲 Ph藅 T﹎ Gi韎 o", tbProp={0,1621}, nQuality=1, nRate=0.002},	
		{szName="Huy襫 Vi猲 Ph藅 T﹎ T╪g H礽", tbProp={0,1622}, nQuality=1, nRate=0.002},	
		{szName="Huy襫 Vi猲 Ph藅 T﹎ Y猽 Tr魕", tbProp={0,1623}, nQuality=1, nRate=0.002},	
		{szName="Huy襫 Vi猲 Ph藅 T﹎ H� Gi韎", tbProp={0,1624}, nQuality=1, nRate=0.002},	
		{szName="Huy襫 Vi猲 Xung Thi猲 H筺g Li謒", tbProp={0,1625}, nQuality=1, nRate=0.002},	
		{szName="Huy襫 Vi猲 Xung Thi猲 Kh玦", tbProp={0,1626}, nQuality=1, nRate=0.002},	
		{szName="Huy襫 Vi猲 Xung Thi猲 Thng Gi韎", tbProp={0,1627}, nQuality=1, nRate=0.002},	
		{szName="Huy襫 Vi猲 Xung Thi猲 Th骳 Uy觧", tbProp={0,1628}, nQuality=1, nRate=0.002},	
		{szName="Huy襫 Vi猲 Xung Thi猲 Y猽 Цi", tbProp={0,1629}, nQuality=1, nRate=0.002},	
		{szName="Huy襫 Vi猲 Xung Thi猲 Kh秈", tbProp={0,1630}, nQuality=1, nRate=0.002},	
		{szName="Huy襫 Vi猲 Xung Thi猲 Ch飝", tbProp={0,1631}, nQuality=1, nRate=0.002},	
		{szName="Huy襫 Vi猲 Xung Thi猲 Ngoa", tbProp={0,1632}, nQuality=1, nRate=0.002},	
		{szName="Huy襫 Vi猲 Xung Thi猲 B閕", tbProp={0,1633}, nQuality=1, nRate=0.002},	
		{szName="Huy襫 Vi猲 Xung Thi猲 H� Gi韎", tbProp={0,1634}, nQuality=1, nRate=0.002},	
		{szName="Huy襫 Vi猲 Phi V﹏ H筺g Li謒", tbProp={0,1635}, nQuality=1, nRate=0.002},	
		{szName="Huy襫 Vi猲 Phi V﹏ Kh玦", tbProp={0,1636}, nQuality=1, nRate=0.002},	
		{szName="Huy襫 Vi猲 Phi V﹏ Thng Gi韎", tbProp={0,1637}, nQuality=1, nRate=0.002},	
		{szName="Huy襫 Vi猲 Phi V﹏ Th骳 Uy觧", tbProp={0,1638}, nQuality=1, nRate=0.002},	
		{szName="Huy襫 Vi猲 Phi V﹏ Y猽 Цi", tbProp={0,1639}, nQuality=1, nRate=0.002},	
		{szName="Huy襫 Vi猲 Phi V﹏ Kh秈", tbProp={0,1640}, nQuality=1, nRate=0.002},	
		{szName="Huy襫 Vi猲 Phi V﹏ Thng", tbProp={0,1641}, nQuality=1, nRate=0.002},	
		{szName="Huy襫 Vi猲 Phi V﹏ Ngoa", tbProp={0,1642}, nQuality=1, nRate=0.002},	
		{szName="Huy襫 Vi猲 Phi V﹏ Y猽 Tr魕", tbProp={0,1643}, nQuality=1, nRate=0.002},	
		{szName="Huy襫 Vi猲 Anh D騨g H� Gi韎", tbProp={0,1644}, nQuality=1, nRate=0.002},	
		{szName="Huy襫 Vi猲 Anh D騨g H筺g Li謒", tbProp={0,1645}, nQuality=1, nRate=0.002},	
		{szName="Huy襫 Vi猲 Anh D騨g Kh玦", tbProp={0,1646}, nQuality=1, nRate=0.002},	
		{szName="Huy襫 Vi猲 Anh D騨g Thng Gi韎", tbProp={0,1647}, nQuality=1, nRate=0.002},	
		{szName="Huy襫 Vi猲 Anh D騨g Th骳 Uy觧", tbProp={0,1648}, nQuality=1, nRate=0.002},	
		{szName="Huy襫 Vi猲 Anh D騨g Y猽 Цi", tbProp={0,1649}, nQuality=1, nRate=0.002},	
		{szName="Huy襫 Vi猲 Anh D騨g Kh秈", tbProp={0,1650}, nQuality=1, nRate=0.002},	
		{szName="Huy襫 Vi猲 Anh D騨g B秓 o", tbProp={0,1651}, nQuality=1, nRate=0.002},	
		{szName="Huy襫 Vi猲 Anh D騨g Ngoa", tbProp={0,1652}, nQuality=1, nRate=0.002},	
		{szName="Huy襫 Vi猲 Anh D騨g Y猽 Tr魕", tbProp={0,1653}, nQuality=1, nRate=0.002},	
		{szName="Huy襫 Vi猲 Anh D騨g H� Gi韎", tbProp={0,1654}, nQuality=1, nRate=0.002},	
		{szName="Huy襫 Vi猲 T辬h  Ch﹗ Li謒", tbProp={0,1655}, nQuality=1, nRate=0.002},	
		{szName="Huy襫 Vi猲 T辬h  Ph竧 Цi", tbProp={0,1656}, nQuality=1, nRate=0.002},	
		{szName="Huy襫 Vi猲 T辬h  Thng Gi韎", tbProp={0,1657}, nQuality=1, nRate=0.002},	
		{szName="Huy襫 Vi猲 T辬h  H� Uy觧", tbProp={0,1658}, nQuality=1, nRate=0.002},	
		{szName="Huy襫 Vi猲 T辬h  Th骳 Y猽", tbProp={0,1659}, nQuality=1, nRate=0.002},	
		{szName="Huy襫 Vi猲 T辬h  Sa Y", tbProp={0,1660}, nQuality=1, nRate=0.002},	
		{szName="Huy襫 Vi猲 T辬h  Ki誱", tbProp={0,1661}, nQuality=1, nRate=0.002},	
		{szName="Huy襫 Vi猲 T辬h  H礽", tbProp={0,1662}, nQuality=1, nRate=0.002},	
		{szName="Huy襫 Vi猲 T辬h  Hng Nang", tbProp={0,1663}, nQuality=1, nRate=0.002},	
		{szName="Huy襫 Vi猲 T辬h  H� Gi韎", tbProp={0,1664}, nQuality=1, nRate=0.002},	
		{szName="Huy襫 Vi猲 H祅 B╪g Ch﹗ Li謒", tbProp={0,1665}, nQuality=1, nRate=0.002},	
		{szName="Huy襫 Vi猲 H祅 B╪g Ph竧 Цi", tbProp={0,1666}, nQuality=1, nRate=0.002},	
		{szName="Huy襫 Vi猲 H祅 B╪g Thng Gi韎", tbProp={0,1667}, nQuality=1, nRate=0.002},	
		{szName="Huy襫 Vi猲 H祅 B╪g H� Uy觧", tbProp={0,1668}, nQuality=1, nRate=0.002},	
		{szName="Huy襫 Vi猲 H祅 B╪g Th骳 Y猽", tbProp={0,1669}, nQuality=1, nRate=0.002},	
		{szName="Huy襫 Vi猲 H祅 B╪g Sam", tbProp={0,1670}, nQuality=1, nRate=0.002},	
		{szName="Huy襫 Vi猲 H祅 B╪g Tri襫 Th�", tbProp={0,1671}, nQuality=1, nRate=0.002},	
		{szName="Huy襫 Vi猲 H祅 B╪g H礽", tbProp={0,1672}, nQuality=1, nRate=0.002},	
		{szName="Huy襫 Vi猲 H祅 B╪g Hng Nang", tbProp={0,1673}, nQuality=1, nRate=0.002},	
		{szName="Huy襫 Vi猲 H祅 B╪g H� Gi韎", tbProp={0,1674}, nQuality=1, nRate=0.002},	
		{szName="Huy襫 Vi猲 Nguy謙 Hoa Ch﹗ Li謒", tbProp={0,1675}, nQuality=1, nRate=0.002},	
		{szName="Huy襫 Vi猲 Nguy謙 Hoa Tr﹎", tbProp={0,1676}, nQuality=1, nRate=0.002},	
		{szName="Huy襫 Vi猲 Nguy謙 Hoa Thng Gi韎", tbProp={0,1677}, nQuality=1, nRate=0.002},	
		{szName="Huy襫 Vi猲 Nguy謙 Hoa T�", tbProp={0,1678}, nQuality=1, nRate=0.002},	
		{szName="Huy襫 Vi猲 Nguy謙 Hoa Th骳 Y猽", tbProp={0,1679}, nQuality=1, nRate=0.002},	
		{szName="Huy襫 Vi猲 Nguy謙 Hoa Sam", tbProp={0,1680}, nQuality=1, nRate=0.002},	
		{szName="Huy襫 Vi猲 Nguy謙 Hoa o", tbProp={0,1681}, nQuality=1, nRate=0.002},	
		{szName="Huy襫 Vi猲 Nguy謙 Hoa Ngoa", tbProp={0,1682}, nQuality=1, nRate=0.002},	
		{szName="Huy襫 Vi猲 Nguy謙 Hoa Hng Nang", tbProp={0,1683}, nQuality=1, nRate=0.002},	
		{szName="Huy襫 Vi猲 Nguy謙 Hoa H� Gi韎", tbProp={0,1684}, nQuality=1, nRate=0.002},	
		{szName="Huy襫 Vi猲 Ph錸 Hoa Ch﹗ Li謒", tbProp={0,1685}, nQuality=1, nRate=0.002},	
		{szName="Huy襫 Vi猲 Ph錸 Hoa Tr﹎", tbProp={0,1686}, nQuality=1, nRate=0.002},	
		{szName="Huy襫 Vi猲 Ph錸 Hoa Thng Gi韎", tbProp={0,1687}, nQuality=1, nRate=0.002},	
		{szName="Huy襫 Vi猲 Ph錸 Hoa T�", tbProp={0,1688}, nQuality=1, nRate=0.002},	
		{szName="Huy襫 Vi猲 Ph錸 Hoa Y猽 Цi", tbProp={0,1689}, nQuality=1, nRate=0.002},	
		{szName="Huy襫 Vi猲 Ph錸 Hoa Sam", tbProp={0,1690}, nQuality=1, nRate=0.002},	
		{szName="Huy襫 Vi猲 Ph錸 Hoa Uy猲 Μng o", tbProp={0,1691}, nQuality=1, nRate=0.002},	
		{szName="Huy襫 Vi猲 Ph錸 Hoa Ngoa", tbProp={0,1692}, nQuality=1, nRate=0.002},	
		{szName="Huy襫 Vi猲 Ph錸 Hoa Hng Nang", tbProp={0,1693}, nQuality=1, nRate=0.002},	
		{szName="Huy襫 Vi猲 Ph錸 Hoa H� Gi韎", tbProp={0,1694}, nQuality=1, nRate=0.002},	
		{szName="Huy襫 Vi猲 筺 Trng H筺g Li謒", tbProp={0,1695}, nQuality=1, nRate=0.002},	
		{szName="Huy襫 Vi猲 筺 Trng Ph竧 Цi", tbProp={0,1696}, nQuality=1, nRate=0.002},	
		{szName="Huy襫 Vi猲 筺 Trng Thng Gi韎", tbProp={0,1697}, nQuality=1, nRate=0.002},	
		{szName="Huy襫 Vi猲 筺 Trng H� Uy觧", tbProp={0,1698}, nQuality=1, nRate=0.002},	
		{szName="Huy襫 Vi猲 筺 Trng Y猽 Цi", tbProp={0,1699}, nQuality=1, nRate=0.002},	
		{szName="Huy襫 Vi猲 筺 Trng B� Trang", tbProp={0,1700}, nQuality=1, nRate=0.002},	
		{szName="Huy襫 Vi猲 筺 Trng Tri襫 Th�", tbProp={0,1701}, nQuality=1, nRate=0.002},	
		{szName="Huy襫 Vi猲 筺 Trng Ngoa", tbProp={0,1702}, nQuality=1, nRate=0.002},	
		{szName="Huy襫 Vi猲 筺 Trng Y猽 Tr魕", tbProp={0,1703}, nQuality=1, nRate=0.002},	
		{szName="Huy襫 Vi猲 筺 Trng H� Gi韎", tbProp={0,1704}, nQuality=1, nRate=0.002},	
		{szName="Huy襫 Vi猲 Huy誸 S竧 H筺g Li謒", tbProp={0,1705}, nQuality=1, nRate=0.002},	
		{szName="Huy襫 Vi猲 Huy誸 S竧 Ph竧 Цi", tbProp={0,1706}, nQuality=1, nRate=0.002},	
		{szName="Huy襫 Vi猲 Huy誸 S竧 Thng Gi韎", tbProp={0,1707}, nQuality=1, nRate=0.002},	
		{szName="Huy襫 Vi猲 Huy誸 S竧 H� Uy觧", tbProp={0,1708}, nQuality=1, nRate=0.002},	
		{szName="Huy襫 Vi猲 Huy誸 S竧 Y猽 Цi", tbProp={0,1709}, nQuality=1, nRate=0.002},	
		{szName="Huy襫 Vi猲 Huy誸 S竧 B� Trang", tbProp={0,1710}, nQuality=1, nRate=0.002},	
		{szName="Huy襫 Vi猲 Huy誸 S竧 o", tbProp={0,1711}, nQuality=1, nRate=0.002},	
		{szName="Huy襫 Vi猲 Huy誸 S竧 Ngoa", tbProp={0,1712}, nQuality=1, nRate=0.002},	
		{szName="Huy襫 Vi猲 Huy誸 S竧 Y猽 Tr魕", tbProp={0,1713}, nQuality=1, nRate=0.002},	
		{szName="Huy襫 Vi猲 Huy誸 S竧 H� Gi韎", tbProp={0,1714}, nQuality=1, nRate=0.002},	
		{szName="Huy襫 Vi猲 L穘h T﹎ H筺g Li謒", tbProp={0,1715}, nQuality=1, nRate=0.002},	
		{szName="Huy襫 Vi猲 L穘h T﹎ Qu竛", tbProp={0,1716}, nQuality=1, nRate=0.002},	
		{szName="Huy襫 Vi猲 L穘h T﹎ Thng Gi韎", tbProp={0,1717}, nQuality=1, nRate=0.002},	
		{szName="Huy襫 Vi猲 L穘h T﹎ H� Uy觧", tbProp={0,1718}, nQuality=1, nRate=0.002},	
		{szName="Huy襫 Vi猲 L穘h T﹎ Tri襫 Y猽", tbProp={0,1719}, nQuality=1, nRate=0.002},	
		{szName="Huy襫 Vi猲 L穘h T﹎ Gi竝 Y", tbProp={0,1720}, nQuality=1, nRate=0.002},	
		{szName="Huy襫 Vi猲 L穘h T﹎ Phi o", tbProp={0,1721}, nQuality=1, nRate=0.002},	
		{szName="Huy襫 Vi猲 L穘h T﹎ L�", tbProp={0,1722}, nQuality=1, nRate=0.002},	
		{szName="Huy襫 Vi猲 L穘h T﹎ Tr魕", tbProp={0,1723}, nQuality=1, nRate=0.002},	
		{szName="Huy襫 Vi猲 L穘h T﹎ H� Gi韎", tbProp={0,1724}, nQuality=1, nRate=0.002},	
		{szName="Huy襫 Vi猲 V� T譶h H筺g Li謒", tbProp={0,1725}, nQuality=1, nRate=0.002},	
		{szName="Huy襫 Vi猲 V� T譶h Qu竛", tbProp={0,1726}, nQuality=1, nRate=0.002},	
		{szName="Huy襫 Vi猲 V� T譶h Thng Gi韎", tbProp={0,1727}, nQuality=1, nRate=0.002},	
		{szName="Huy襫 Vi猲 V� T譶h H� Uy觧", tbProp={0,1728}, nQuality=1, nRate=0.002},	
		{szName="Huy襫 Vi猲 V� T譶h Th骳 Y猽", tbProp={0,1729}, nQuality=1, nRate=0.002},	
		{szName="Huy襫 Vi猲 V� T譶h Gi竝", tbProp={0,1730}, nQuality=1, nRate=0.002},	
		{szName="Huy襫 Vi猲 V� T譶h T鬞i詎", tbProp={0,1731}, nQuality=1, nRate=0.002},	
		{szName="Huy襫 Vi猲 V� T譶h L�", tbProp={0,1732}, nQuality=1, nRate=0.002},	
		{szName="Huy襫 Vi猲 V� T譶h Y猽 Tr魕", tbProp={0,1733}, nQuality=1, nRate=0.002},	
		{szName="Huy襫 Vi猲 V� T譶h H� Gi韎", tbProp={0,1734}, nQuality=1, nRate=0.002},	
		{szName="Huy襫 Vi猲 H祅 Quang Li謒", tbProp={0,1735}, nQuality=1, nRate=0.002},	
		{szName="Huy襫 Vi猲 H祅 Quang Ph竧 Qu竛", tbProp={0,1736}, nQuality=1, nRate=0.002},	
		{szName="Huy襫 Vi猲 H祅 Quang Thng Gi韎", tbProp={0,1737}, nQuality=1, nRate=0.002},	
		{szName="Huy襫 Vi猲 H祅 Quang H� Uy觧", tbProp={0,1738}, nQuality=1, nRate=0.002},	
		{szName="Huy襫 Vi猲 H祅 Quang Th骳 Y猽", tbProp={0,1739}, nQuality=1, nRate=0.002},	
		{szName="Huy襫 Vi猲 H祅 Quang Gi竝 Y", tbProp={0,1740}, nQuality=1, nRate=0.002},	
		{szName="Huy襫 Vi猲 H祅 Quang Ti猽", tbProp={0,1741}, nQuality=1, nRate=0.002},	
		{szName="Huy襫 Vi猲 H祅 Quang L�", tbProp={0,1742}, nQuality=1, nRate=0.002},	
		{szName="Huy襫 Vi猲 H祅 Quang Tr魕", tbProp={0,1743}, nQuality=1, nRate=0.002},	
		{szName="Huy襫 Vi猲 H祅 Quang H� Gi韎", tbProp={0,1744}, nQuality=1, nRate=0.002},	
		{szName="Huy襫 Vi猲 Dng Cng H筺g Li謒", tbProp={0,1745}, nQuality=1, nRate=0.0025},	
		{szName="Huy襫 Vi猲 Dng Cng u Ho祅", tbProp={0,1746}, nQuality=1, nRate=0.0025},	
		{szName="Huy襫 Vi猲 Dng Cng Thng Gi韎", tbProp={0,1747}, nQuality=1, nRate=0.0025},	
		{szName="Huy襫 Vi猲 Dng Cng H� Uy觧", tbProp={0,1748}, nQuality=1, nRate=0.0025},	
		{szName="Huy襫 Vi猲 Dng Cng Th骳 Y猽", tbProp={0,1749}, nQuality=1, nRate=0.0025},	
		{szName="Huy襫 Vi猲 Dng Cng C竔 Y", tbProp={0,1750}, nQuality=1, nRate=0.0025},	
		{szName="Huy襫 Vi猲 Dng Cng Tri襫 Th�", tbProp={0,1751}, nQuality=1, nRate=0.0025},	
		{szName="Huy襫 Vi猲 Dng Cng Ngoa", tbProp={0,1752}, nQuality=1, nRate=0.0025},	
		{szName="Huy襫 Vi猲 Dng Cng Y猽 Tr魕", tbProp={0,1753}, nQuality=1, nRate=0.0025},	
		{szName="Huy襫 Vi猲 Dng Cng H� Gi韎", tbProp={0,1754}, nQuality=1, nRate=0.0025},	
		{szName="Huy襫 Vi猲 Chi課 Long H筺g Li謒", tbProp={0,1755}, nQuality=1, nRate=0.0025},	
		{szName="Huy襫 Vi猲 Chi課 Long u Ho祅", tbProp={0,1756}, nQuality=1, nRate=0.0025},	
		{szName="Huy襫 Vi猲 Chi課 Long Thng Gi韎", tbProp={0,1757}, nQuality=1, nRate=0.0025},	
		{szName="Huy襫 Vi猲 Chi課 Long H� Uy觧", tbProp={0,1758}, nQuality=1, nRate=0.0025},	
		{szName="Huy襫 Vi猲 Chi課 Long Th骳 Y猽", tbProp={0,1759}, nQuality=1, nRate=0.0025},	
		{szName="Huy襫 Vi猲 Chi課 Long C竔 Y", tbProp={0,1760}, nQuality=1, nRate=0.0025},	
		{szName="Huy襫 Vi猲 Chi課 Long Trng", tbProp={0,1761}, nQuality=1, nRate=0.0025},	
		{szName="Huy襫 Vi猲 Chi課 Long Ngoa", tbProp={0,1762}, nQuality=1, nRate=0.0025},	
		{szName="Huy襫 Vi猲 Chi課 Long Y猽 Tr魕", tbProp={0,1763}, nQuality=1, nRate=0.0025},	
		{szName="Huy襫 Vi猲 Chi課 Long H� Gi韎", tbProp={0,1764}, nQuality=1, nRate=0.0025},	
		{szName="Huy襫 Vi猲 L筩 H錸 H筺g Khuy猲", tbProp={0,1765}, nQuality=1, nRate=0.0025},	
		{szName="Huy襫 Vi猲 L筩 H錸 Kh玦", tbProp={0,1766}, nQuality=1, nRate=0.0025},	
		{szName="Huy襫 Vi猲 L筩 H錸 Thng Gi韎", tbProp={0,1767}, nQuality=1, nRate=0.0025},	
		{szName="Huy襫 Vi猲 L筩 H錸 H� Uy觧", tbProp={0,1768}, nQuality=1, nRate=0.0025},	
		{szName="Huy襫 Vi猲 L筩 H錸 Y猽 Цi", tbProp={0,1769}, nQuality=1, nRate=0.0025},	
		{szName="Huy襫 Vi猲 L筩 H錸 Gi竝 Y", tbProp={0,1770}, nQuality=1, nRate=0.0025},	
		{szName="Huy襫 Vi猲 L筩 H錸 Thng", tbProp={0,1771}, nQuality=1, nRate=0.0025},	
		{szName="Huy襫 Vi猲 L筩 H錸 Ngoa", tbProp={0,1772}, nQuality=1, nRate=0.0025},	
		{szName="Huy襫 Vi猲 L筩 H錸 B閕", tbProp={0,1773}, nQuality=1, nRate=0.0025},	
		{szName="Huy襫 Vi猲 L筩 H錸 H� Gi韎", tbProp={0,1774}, nQuality=1, nRate=0.0025},	
		{szName="Huy襫 Vi猲 Chc T譶h H筺g Li謒", tbProp={0,1775}, nQuality=1, nRate=0.0025},	
		{szName="Huy襫 Vi猲 Chc T譶h Qu竛 Mi謓", tbProp={0,1776}, nQuality=1, nRate=0.0025},	
		{szName="Huy襫 Vi猲 Chc T譶h Thng Gi韎", tbProp={0,1777}, nQuality=1, nRate=0.0025},	
		{szName="Huy襫 Vi猲 Chc T譶h H� Uy觧", tbProp={0,1778}, nQuality=1, nRate=0.0025},	
		{szName="Huy襫 Vi猲 Chc T譶h Y猽 Цi", tbProp={0,1779}, nQuality=1, nRate=0.0025},	
		{szName="Huy襫 Vi猲 Chc T譶h Gi竝 Y", tbProp={0,1780}, nQuality=1, nRate=0.0025},	
		{szName="Huy襫 Vi猲 Chc T譶h o", tbProp={0,1781}, nQuality=1, nRate=0.0025},	
		{szName="Huy襫 Vi猲 Chc T譶h Ngoa", tbProp={0,1782}, nQuality=1, nRate=0.0025},	
		{szName="Huy襫 Vi猲 Chc T譶h B閕", tbProp={0,1783}, nQuality=1, nRate=0.0025},	
		{szName="Huy襫 Vi猲 Chc T譶h H� Gi韎", tbProp={0,1784}, nQuality=1, nRate=0.0025},	
		{szName="Huy襫 Vi猲 Tam Phong Ph�", tbProp={0,1785}, nQuality=1, nRate=0.0025},	
		{szName="Huy襫 Vi猲 Tam Phong Qu竛", tbProp={0,1786}, nQuality=1, nRate=0.0025},	
		{szName="Huy襫 Vi猲 Tam Phong Thng Gi韎", tbProp={0,1787}, nQuality=1, nRate=0.0025},	
		{szName="Huy襫 Vi猲 Tam Phong T�", tbProp={0,1788}, nQuality=1, nRate=0.0025},	
		{szName="Huy襫 Vi猲 Tam Phong Ph竝 Цi", tbProp={0,1789}, nQuality=1, nRate=0.0025},	
		{szName="Huy襫 Vi猲 Tam Phong Чo B祇", tbProp={0,1790}, nQuality=1, nRate=0.0025},	
		{szName="Huy襫 Vi猲 Tam Phong Ki誱", tbProp={0,1791}, nQuality=1, nRate=0.0025},	
		{szName="Huy襫 Vi猲 Tam Phong L�", tbProp={0,1792}, nQuality=1, nRate=0.0025},	
		{szName="Huy襫 Vi猲 Tam Phong Ng鋍 B閕", tbProp={0,1793}, nQuality=1, nRate=0.0025},	
		{szName="Huy襫 Vi猲 Tam Phong H� Gi韎", tbProp={0,1794}, nQuality=1, nRate=0.0025},	
		{szName="Huy襫 Vi猲 Tu T﹎ Ph�", tbProp={0,1795}, nQuality=1, nRate=0.0025},	
		{szName="Huy襫 Vi猲 Tu T﹎ Qu竛", tbProp={0,1796}, nQuality=1, nRate=0.0025},	
		{szName="Huy襫 Vi猲 Tu T﹎ Thng Gi韎", tbProp={0,1797}, nQuality=1, nRate=0.0025},	
		{szName="Huy襫 Vi猲 Tu T﹎ T�", tbProp={0,1798}, nQuality=1, nRate=0.0025},	
		{szName="Huy襫 Vi猲 Tu T﹎ Ph竝 Цi", tbProp={0,1799}, nQuality=1, nRate=0.0025},	
		{szName="Huy襫 Vi猲 Tu T﹎ Чo B祇", tbProp={0,1800}, nQuality=1, nRate=0.0025},	
		{szName="Huy襫 Vi猲 Tu T﹎ Ki誱", tbProp={0,1801}, nQuality=1, nRate=0.0025},	
		{szName="Huy襫 Vi猲 Tu T﹎ L�", tbProp={0,1802}, nQuality=1, nRate=0.0025},	
		{szName="Huy襫 Vi猲 Tu T﹎ Ng鋍 B閕", tbProp={0,1803}, nQuality=1, nRate=0.0025},	
		{szName="Huy襫 Vi猲 Tu T﹎ H� Gi韎", tbProp={0,1804}, nQuality=1, nRate=0.0025},	
		{szName="Huy襫 Vi猲 Xuy猲 V﹏ H筺g Li謒", tbProp={0,1805}, nQuality=1, nRate=0.0025},	
		{szName="Huy襫 Vi猲 Xuy猲 V﹏ Чo Qu竛", tbProp={0,1806}, nQuality=1, nRate=0.0025},	
		{szName="Huy襫 Vi猲 Xuy猲 V﹏ Thng Gi韎", tbProp={0,1807}, nQuality=1, nRate=0.0025},	
		{szName="Huy襫 Vi猲 Xuy猲 V﹏ H� Uy觧", tbProp={0,1808}, nQuality=1, nRate=0.0025},	
		{szName="Huy襫 Vi猲 Xuy猲 V﹏ Y猽 Цi", tbProp={0,1809}, nQuality=1, nRate=0.0025},	
		{szName="Huy襫 Vi猲 Xuy猲 V﹏ Чo B祇", tbProp={0,1810}, nQuality=1, nRate=0.0025},	
		{szName="Huy襫 Vi猲 Xuy猲 V﹏ Nh蒼", tbProp={0,1811}, nQuality=1, nRate=0.0025},	
		{szName="Huy襫 Vi猲 Xuy猲 V﹏ Ngoa", tbProp={0,1812}, nQuality=1, nRate=0.0025},	
		{szName="Huy襫 Vi猲 Xuy猲 V﹏ B閕", tbProp={0,1813}, nQuality=1, nRate=0.0025},	
		{szName="Huy襫 Vi猲 Xuy猲 V﹏ H� Gi韎", tbProp={0,1814}, nQuality=1, nRate=0.0025},	
		{szName="Huy襫 Vi猲 Ph� B╪g Ph�", tbProp={0,1815}, nQuality=1, nRate=0.0025},	
		{szName="Huy襫 Vi猲 Ph� B╪g Чo Qu竛", tbProp={0,1816}, nQuality=1, nRate=0.0025},	
		{szName="Huy襫 Vi猲 Ph� B╪g Thng Gi韎", tbProp={0,1817}, nQuality=1, nRate=0.0025},	
		{szName="Huy襫 Vi猲 Ph� B╪g Th�", tbProp={0,1818}, nQuality=1, nRate=0.0025},	
		{szName="Huy襫 Vi猲 Ph� B╪g Y猽 Цi", tbProp={0,1819}, nQuality=1, nRate=0.0025},	
		{szName="Huy襫 Vi猲 Ph� B╪g Чo B祇", tbProp={0,1820}, nQuality=1, nRate=0.0025},	
		{szName="Huy襫 Vi猲 Ph� B╪g Trng Ki誱", tbProp={0,1821}, nQuality=1, nRate=0.0025},	
		{szName="Huy襫 Vi猲 Ph� B╪g Ngoa", tbProp={0,1822}, nQuality=1, nRate=0.0025},	
		{szName="Huy襫 Vi猲 Ph� B╪g B閕", tbProp={0,1823}, nQuality=1, nRate=0.0025},	
		{szName="Huy襫 Vi猲 Ph� B╪g H� Gi韎", tbProp={0,1824}, nQuality=1, nRate=0.0025},	
		{szName="H鏽 Nguy猲 Linh L�", tbProp={6,1,2312,1,0,0}, nCount=1, nRate=4},	
		{szName="Huy襫 Thi猲 C萴 Nang", tbProp={6,1,2355,1,0,0}, nCount=1, nRate=5, nExpiredTime=20101220},	
		{szName="Long Huy誸 Ho祅", tbProp={6,1,2117,1,0,0}, nCount=1, nRate=3, nExpiredTime=20101220},	
		{szName="H秈 Long Ch﹗", tbProp={6,1,2115,1,0,0}, nCount=1, nRate=3, nExpiredTime=20101220},	
		{szName="S竧 Th� Gi秐 l� h閜", tbProp={6,1,2339,1,0,0}, nCount=1, nRate=2, nExpiredTime=20101220},	
		{szName="M秐h b秐  s琻 h� x� t綾 (1000 m秐h)", tbProp={6,1,2514,1,0,0}, nCount=1, nRate=2, nExpiredTime=20101220},	
		{szName="M筩 B綾 Truy襫 T鑞g L謓h", tbProp={6,1,1448,1,0,0}, nCount=1, nRate=2, nExpiredTime=20101220},	
		{szName="Ng鋍 Qu竛", tbProp={6,1,2311,1,0,0}, nCount=1, nRate=5, nExpiredTime=20101220},	
		{szName="B竎h Ni猲 Tr﹏ L�", tbProp={6,1,2266,1,0,0}, nCount=1, nRate=2, nExpiredTime=20101220},	
		{szName="B筩h C﹗ Ho祅 c Bi謙", tbProp={6,1,1157,1,0,0}, nCount=1, nRate=4},	
		{szName="Thi猲 Tinh b筩h C﹗ Ho祅", tbProp={6,1,2183,1,0,0}, nCount=1, nRate=2},	
		{szName="Thi猲 Ni猲 Tr﹏ L�", tbProp={6,1,2267,1,0,0}, nCount=1, nRate=2, nExpiredTime=20101220},	
		{szName="V筺 Ni猲 Tr﹏ L�", tbProp={6,1,2268,1,0,0}, nCount=1, nRate=2, nExpiredTime=20101220},	
		{szName="Чi L鵦 ho祅 L� bao", tbProp={6,1,2517,1,0,0}, nCount=1, nRate=5},	
		{szName="Phi t鑓 ho祅 L� bao", tbProp={6,1,2520,1,0,0}, nCount=1, nRate=5},	
		{szName="B筩h C鑤 L謓h", tbProp={6,1,2255,1,0,0}, nCount=1, nRate=5, nExpiredTime=20101220},	
		{szName="Ti猲 Th秓 L� c bi謙", tbProp={6,1,1181,1,0,0}, nCount=1, nRate=5},	
		{szName="Ph� Qu� C萴 H筽", tbProp={6,1,2402,1,0,0}, nCount=1, nRate=14.6, nExpiredTime=20101220},	
		{szName="N課 B竧 Tr﹏ Ph骳 Nguy謙", tbProp={6,1,1817,1,0,0}, nCount=1, nRate=10},	
		{szName="Ng﹏ lng", nJxb =1000000, nRate=10},	
		{szName="Ng﹏ lng", nJxb =2000000, nRate=2},	
		{szName="Ng﹏ lng", nJxb =5000000, nRate=1},	
		{szName="Ng﹏ lng", nJxb =10000000, nRate=0.5},	
		{szName="Nh蕋 K� C祅 Kh玭 Ph�", tbProp={6,1,2126,1,0,0}, nCount=1, nRate=0.2, nExpiredTime=43200},	
		{szName="H錸g Bao Sum V莥", tbProp={6,1,2104,1,0,0}, nCount=1, nRate=0.2},	
		{szName="C萴 nang thay i tr阨 t", tbProp={6,1,1781,1,0,0}, nCount=1, nRate=3, tbParam={60}},	

	}
	tbAwardTemplet:GiveAwardByList(tbAward, "Ph莕 thng ng� s綾 hng bao")
	tbAwardTemplet:GiveAwardByList(tbAwardEXP, "Ph莕 thng EXP ng� s綾 hng bao")
end

--打开中药香包得到奖励
function pActivity:AddZhongyaoxiangbaoAward(TSK_EXP_A)
	local nUpExp = 1e6
	local nRateExp1 = 25000000
	local nRateExp2 = 30000000
	local nRateExp3 = 40000000
	local nRateExp4 = 50000000
	local nRateExp5 = 100000000
	local nTaskValue = self:GetTask(TSK_EXP_A)
	local nTemp = (nUpExp - nTaskValue) * 10000
	if (nTemp < nRateExp1) then
		nRateExp1 = nTemp
	end
	if (nTemp < nRateExp2) then
		nRateExp2 = nTemp
	end
	if (nTemp < nRateExp3) then
		nRateExp3 = nTemp
	end
	if (nTemp < nRateExp4) then
		nRateExp4 = nTemp
	end
	if (nTemp < nRateExp5) then
		nRateExp5 = nTemp
	end
	local tbAwardEXP = 
	{
		{
			[1] = {nExp = nRateExp1},
			[2] = 
			{
				pFun = function(tbItem, nItemCount, szLogTitle)
					%self:AddTask(%TSK_EXP_A, %nRateExp1 / 10000)
				end
			},
			nRate = 60,
		},
		{
			[1] = {nExp = nRateExp2},
			[2] = 
			{
				pFun = function(tbItem, nItemCount, szLogTitle)
					%self:AddTask(%TSK_EXP_A, %nRateExp2 / 10000)
				end
			},
			nRate = 27,
		},
		{
			[1] = {nExp = nRateExp3},
			[2] = 
			{
				pFun = function(tbItem, nItemCount, szLogTitle)
					%self:AddTask(%TSK_EXP_A, %nRateExp3 / 10000)
				end
			},
			nRate = 10,
		},
		{
			[1] = {nExp = nRateExp4},
			[2] = 
			{
				pFun = function(tbItem, nItemCount, szLogTitle)
					%self:AddTask(%TSK_EXP_A, %nRateExp4 / 10000)
				end
			},
			nRate = 2,
		},
		{
			[1] = {nExp = nRateExp5},
			[2] = 
			{
				pFun = function(tbItem, nItemCount, szLogTitle)
					%self:AddTask(%TSK_EXP_A, %nRateExp5 / 10000)
				end
			},
			nRate = 1,
		},
	}
	local tbAward = 
	{
		{szName="Huy襫 Vi猲 L謓h", tbProp={6,1,2351,1,0,0}, nRate=1, nCount=1},	
		{szName="H鏽 Nguy猲 Linh L�", tbProp={6,1,2312,1,0,0}, nRate=4, nCount=5},	
		{szName="Thi猲 Long L謓h", tbProp={6,1,2256,1,0,0}, nRate=5, nCount=5, nExpiredTime=20101220},	
		{szName="Ti猲 Th秓 L� c bi謙", tbProp={6,1,1181,1,0,0}, nRate=10, nCount=2, nExpiredTime=20101220},	
		{szName="Ph� Qu� C萴 H筽", tbProp={6,1,2402,1,0,0}, nRate=17.7, nCount=5, nExpiredTime=20101220},	
		{szName="V筺 Ni猲 Tr﹏ L�", tbProp={6,1,2268,1,0,0}, nRate=10, nCount=2, nExpiredTime=20101220},	
		{szName="V筺 Ni猲 Ng� Th竔 Hoa", tbProp={6,1,2265,1,0,0}, nRate=1, nCount=1},	
		{szName="Thi猲 Ni猲 Th蕋 Tinh Th秓", tbProp={6,1,1675,1,0,0}, nRate=1, nCount=1},	
		{szName="B筩h C﹗ Ho祅 c Bi謙", tbProp={6,1,1157,1,0,0}, nRate=14, nCount=1},	
		{szName="Thi猲 Tinh b筩h C﹗ Ho祅", tbProp={6,1,2183,1,0,0}, nRate=6, nCount=1},	
		{szName="Ng﹏ lng", nJxb =10000000, nRate=5},	
		{szName="Ng﹏ lng", nJxb =20000000, nRate=2},	
		{szName="Ng﹏ lng", nJxb =50000000, nRate=1},	
		{szName="Ng﹏ lng", nJxb =100000000, nRate=0.2},	
		{szName="Nh蕋 K� C祅 Kh玭 Ph�", tbProp={6,1,2126,1,0,0}, nRate=2, nCount=1, nExpiredTime=43200},	
		{szName="C祅 Kh玭 Song Tuy謙 B閕", tbProp={6,1,2219,1,0,0}, nRate=0.1, nCount=1, nExpiredTime=86400},	
		{szName="Чi L鵦 ho祅 L� bao", tbProp={6,1,2517,1,0,0}, nRate=5, nCount=5},	
		{szName="Phi t鑓 ho祅 L� bao", tbProp={6,1,2520,1,0,0}, nRate=5, nCount=5},	
		{szName="H錸g Bao Sum V莥", tbProp={6,1,2104,1,0,0}, nRate=3, nCount=1},	
		{szName="H錸g Bao An Khang", tbProp={6,1,2105,1,0,0}, nRate=1, nCount=1},	
		{szName="C萴 nang thay i tr阨 t", tbProp={6,1,1781,1,0,0}, nRate=6, nCount=5, tbParam={60}},	
	}
	tbAwardTemplet:GiveAwardByList(tbAward, "Ph莕 thng trung dc hng bao")
	tbAwardTemplet:GiveAwardByList(tbAwardEXP, "Ph莕 thng EXP trung dc hng bao")
end

function pActivity:ResetTaskA(TSK_EXP_A, TSK_DATE_A)
	local nCurDate = tonumber(GetLocalDate("%Y%m%d"))
	local nRecordDate = self:GetTask(TSK_DATE_A)
	
	if nCurDate ~= nRecordDate then
		self:SetTask(TSK_DATE_A, nCurDate)
		self:SetTask(TSK_EXP_A, 0)
	end
end

function pActivity:CheckTaskA(TSK_EXP_A, TSK_DATE_A, nTargetValue, szFailMsg, szOption)

	self:ResetTaskA(TSK_EXP_A, TSK_DATE_A)
	return self:CheckTask(TSK_EXP_A, nTargetValue, szFailMsg, szOption)
end

function pActivity:AddTaskA(TSK_EXP_A, TSK_DATE_A, nAddValue)
	self:ResetTaskA(TSK_EXP_A, TSK_DATE_A)
	return self:AddTask(TSK_EXP_A, nAddValue)
end

function pActivity:GetTaskA(TSK_EXP_A, TSK_DATE_A)
	self:ResetTaskA(TSK_EXP_A, TSK_DATE_A)
	return self:GetTask(TSK_EXP_A)
end

function pActivity:AddExpB(TSK_EXP_B,nTskBExpLimit,nAddExp,nbStack,szLogTitle, szFailMsg)
	
	if self:GetTask(TSK_EXP_B) >= nTskBExpLimit then
		return Msg2Player(szFailMsg)
	end
	
	DynamicExecuteByPlayer(PlayerIndex, "\\script\\activitysys\\playerfunlib.lua", "PlayerFunLib:AddExp", nAddExp, nbStack, szLogTitle)
	self:AddTask(TSK_EXP_B, nAddExp)
end

function pActivity:AddDialogNpc(szNpcName, nNpcId, tbNpcPos)
	for i=1, getn(tbNpcPos) do
		local pPos = tbNpcPos[i]
		
		local nMapIndex = SubWorldID2Idx(pPos[1])
		if nMapIndex > 0 then
			local nNpcIndex = AddNpc(nNpcId, 1, nMapIndex, pPos[2] * 32, pPos[3] * 32, 0, szNpcName);
			SetNpcScript(nNpcIndex, "\\script\\activitysys\\npcdailog.lua");	
		end		
	end
end

function pActivity:Give5SHB(nEXP_Give_NSHB, TSK_Date_Give_NSHB)
	
	if (PlayerFunLib:CheckTaskDaily(TSK_Date_Give_NSHB,8,"M鏸 ng祔 ch� c� th� t苙g 8 Ng� S綾 Hng Bao !","<") ~= 1) then
			return
	end
	if (ConsumeEquiproomItem(1, 6,1,2578,-1) ~= 1) then
		return
	end
	PlayerFunLib:AddTaskDaily(TSK_Date_Give_NSHB,1)
	AddOwnExp(nEXP_Give_NSHB)
	Msg2Player("Ban nh薾 頲 8000000 甶觤 kinh nghi謒")
	WriteLog(date("%Y%m%d %H%M%S").."\t".."Event 20112010"..GetAccount().."\t"..GetName().."\t".."T苙g Ng� S綾 Hng Bao ")
end