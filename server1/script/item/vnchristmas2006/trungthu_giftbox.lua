-- Created by Danielsun 2006-12-07
-- 圣诞礼盒
-- 按几率获得圣诞礼物材料

TB_Giftbox = {
 --1.物品名	    2.物品ID	3.掉落几率
	{"T骾 b閠", 			1503,		20	},
	{"T骾 阯g",		1504,		20	},
	{"T骾 tr鴑g",	1505,		20	},
	{"T骾 u xanh",		1506,		18	},
	{"T骾 h箃 sen",	1507,		11	},
	{"T骾 th辴 g�",	1508,		10		},
	{"T骾 th辴 heo",		1509,		1		},
}

function main()
	
	local PItem = 0;
	local PGetItem = random();
	local PGetItem = PGetItem * 100;
	for ngift,mgift in TB_Giftbox do
		PItem = PItem + TB_Giftbox[ngift][3];
		if(PGetItem < PItem) then
			AddItem(6,1,TB_Giftbox[ngift][2],1,0,0,0);
			Msg2Player("B筺 nh苩 頲 nguy猲 li謚 trung thu:"..TB_Giftbox[ngift][1]);
			return
		end
	end
	return 1;
end
