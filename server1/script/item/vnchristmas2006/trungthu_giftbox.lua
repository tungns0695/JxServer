-- Created by Danielsun 2006-12-07
-- ʥ�����
-- �����ʻ��ʥ���������

TB_Giftbox = {
 --1.��Ʒ��	    2.��ƷID	3.���伸��
	{"T�i b�t", 			1503,		20	},
	{"T�i ���ng",		1504,		20	},
	{"T�i tr�ng",	1505,		20	},
	{"T�i ��u xanh",		1506,		18	},
	{"T�i h�t sen",	1507,		11	},
	{"T�i th�t g�",	1508,		10		},
	{"T�i th�t heo",		1509,		1		},
}

function main()
	
	local PItem = 0;
	local PGetItem = random();
	local PGetItem = PGetItem * 100;
	for ngift,mgift in TB_Giftbox do
		PItem = PItem + TB_Giftbox[ngift][3];
		if(PGetItem < PItem) then
			AddItem(6,1,TB_Giftbox[ngift][2],1,0,0,0);
			Msg2Player("B�n nh�t ���c nguy�n li�u trung thu:"..TB_Giftbox[ngift][1]);
			return
		end
	end
	return 1;
end
