-- Created by Danielsun 2006-12-07
-- Ê¥µ®ÀñºĞ
-- °´¼¸ÂÊ»ñµÃÊ¥µ®ÀñÎï²ÄÁÏ

TB_Giftbox = {
 --1.ÎïÆ·Ãû	    2.ÎïÆ·ID	3.µôÂä¼¸ÂÊ
	{"Tói bét", 			1503,		20	},
	{"Tói ®­êng",		1504,		20	},
	{"Tói trøng",	1505,		20	},
	{"Tói ®Ëu xanh",		1506,		18	},
	{"Tói h¹t sen",	1507,		11	},
	{"Tói thŞt gµ",	1508,		10		},
	{"Tói thŞt heo",		1509,		1		},
}

function main()
	
	local PItem = 0;
	local PGetItem = random();
	local PGetItem = PGetItem * 100;
	for ngift,mgift in TB_Giftbox do
		PItem = PItem + TB_Giftbox[ngift][3];
		if(PGetItem < PItem) then
			AddItem(6,1,TB_Giftbox[ngift][2],1,0,0,0);
			Msg2Player("B¹n nhÆt ®­îc nguyªn liÖu trung thu:"..TB_Giftbox[ngift][1]);
			return
		end
	end
	return 1;
end
