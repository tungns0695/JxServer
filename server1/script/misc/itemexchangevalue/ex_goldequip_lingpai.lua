-- ====================== 文件信息 ======================

-- 剑侠情缘网络版越南收费版 - 兑换新装备令牌（紫蟒等）
-- 文件名　：ex_goldequip_lingpai.lua
-- 创建者　：子非魚
-- 创建时间：2010-06-22 11:02:54

-- ======================================================


IncludeLib("ITEM")
Include("\\script\\misc\\itemexchangevalue\\ex_goldequip_head.lua")	-- 兑换新装备令牌（紫蟒等）
Include( "\\script\\task\\system\\task_string.lua" );
Include("\\script\\lib\\log.lua");

function exchange_lingpai2goldequip()
	local aryDescribe =
	{
		"<dec><npc>Ngi mu鑞 i lo筰 trang b� n祇?",
		format("B� trang b� Thanh C﹗/#take_xp_equip_1(1,%d)", 905),
		format("B� trang b� V﹏ L閏/#take_xp_equip_1(2,%d)", 1135),
		format("B� trang b� Thng Lang/#take_xp_equip_1(3,%d)", 1365),
		format("B� trang b� Huy襫 Vi猲/#take_xp_equip_1(4, %d)", 1595),
		format("B� trang b� T� M穘g/#take_xp_equip_1(5, %d)", 1825),
		format("B� trang b� Kim �/#take_xp_equip_1(6, %d)", 2055),
		format("B� trang b� B筩h H�/#take_xp_equip_1(7, %d)", 2285),
		format("B� trang b� X輈h L﹏/#take_xp_equip_1(8, %d)", 2515),
		format("B� trang b� Minh Ph鬾g/#take_xp_equip_1(9, %d)", 2745),
		format("B� trang b� Щng Long/#take_xp_equip_1(10, %d)", 2975),
		format("B� trang b� Tinh Sng/#take_xp_equip_1(11, %d)", 5379),
		format("B� trang b� Nguy謙 Khuy誸/#take_xp_equip_1(12, %d)", 5670),
		format("B� trang b� Di謚 Dng/#take_xp_equip_1(13, %d)", 6218),
		format("B� trang b� Anh H祇/#take_xp_equip_1(14, %d)", 8477),
		"L竧 n鱝 quay l筰 /no",
	};
	
	CreateTaskSay(aryDescribe);
end


function take_xp_equip_1(n_g, n_d)
	
	if (CalcItemCount(3, tbLingpai[n_g].tbProp[1],tbLingpai[n_g].tbProp[2],tbLingpai[n_g].tbProp[3],-1) <= 0) then
		Talk(1, "", "H譶h nh� i hi謕 qu猲 mang l謓h b礽 �?")
		return
	end
	
	CreateTaskSay({"<dec><npc>Чi hi謕 mu鑞 i trang b� c馻 h� ph竔 n祇 b猲 di:", 
						format("Thi誹 L﹎ Quy襫/#take_xp_equip_2(%d,%d, 1)", n_g, n_d),
						format("Thi誹 L﹎ C玭/#take_xp_equip_2(%d,%d, 2)", n_g, n_d),
						format("Thi誹 L﹎ 產o/#take_xp_equip_2(%d,%d, 3)", n_g, n_d),
						format("Thi猲 Vng Ch飝/#take_xp_equip_2(%d,%d, 4)", n_g, n_d),
						format("Thi猲 Vng Thng/#take_xp_equip_2(%d,%d, 5)", n_g, n_d),
						format("Thi猲 Vng o/#take_xp_equip_2(%d,%d, 6)", n_g, n_d),
						format("Nga Mi ki誱/#take_xp_equip_2(%d,%d, 7)", n_g, n_d),
						format("Nga Mi chng/#take_xp_equip_2(%d,%d, 8)", n_g, n_d),
						format("Th髖 Y猲 產o/#take_xp_equip_2(%d,%d, 9)", n_g, n_d),
						format("Thi誹 Y猲 n閕/#take_xp_equip_2(%d,%d, 10)", n_g, n_d),
						format("Ng� чc chng/#take_xp_equip_2(%d,%d, 11)", n_g, n_d),
						format("Ng� чc 產o/#take_xp_equip_2(%d,%d, 12)", n_g, n_d),
						format("Л阯g M玭 phi 產o/#take_xp_equip_2(%d,%d, 13)", n_g, n_d),
						format("Л阯g M玭 n�/#take_xp_equip_2(%d,%d, 14)", n_g, n_d),
						format("Л阯g M玭 t� ti詎/#take_xp_equip_2(%d,%d, 15)", n_g, n_d),
						format("Trang k� /#take_xp_equip_11(%d,%d)", n_g, n_d),
						"L竧 n鱝 quay l筰 /no"});
end

function take_xp_equip_11(n_g, n_d)
	CreateTaskSay({"<dec><npc>Чi hi謕 mu鑞 i trang b� c馻 h� ph竔 n祇 b猲 di:", 
						format("C竔 Bang chng/#take_xp_equip_2(%d,%d, 16)", n_g, n_d),
						format("C竔 Bang c玭/#take_xp_equip_2(%d,%d, 17)", n_g, n_d),
						format("Thi猲 Nh蒼 chi課/#take_xp_equip_2(%d,%d, 18)", n_g, n_d),
						format("Thi猲 Nh蒼 ma/#take_xp_equip_2(%d,%d, 19)", n_g, n_d),
						format("V� ng kh�/#take_xp_equip_2(%d,%d, 20)", n_g, n_d),
						format("V� ng ki誱/#take_xp_equip_2(%d,%d, 21)", n_g, n_d),
						format("C玭 L玭 o/#take_xp_equip_2(%d,%d, 22)", n_g, n_d),
						format("C玭 L玭 Ki誱/#take_xp_equip_2(%d,%d, 23)", n_g, n_d),
						format("Hoa S琻 Ki誱 T玭g/#take_xp_equip_2(%d,%d, 24)", n_g, n_d),
						format("Hoa S琻 Kh� T玭g/#take_xp_equip_2(%d,%d, 25)", n_g, n_d),
						format("V� h錸 Thu蒼 Ph竝/#take_xp_equip_2(%d,%d, 26)", n_g, n_d),
						format("V� h錸 o Ph竝/#take_xp_equip_2(%d,%d, 27)", n_g, n_d),
						format("Ti猽 Dao c莔 ph竝/#take_xp_equip_2(%d,%d, 28)", n_g, n_d),
						format("Ti猽 Dao ki誱 ph竝/#take_xp_equip_2(%d,%d, 29)", n_g, n_d),
						format("Trang trc/#take_xp_equip_1(%d,%d)", n_g, n_d),
						"L竧 n鱝 quay l筰 /no"});
end


function take_xp_equip_2(n_g, n_d, n_p)
	local n_count = 10;
	
	if (n_g == 5) then		
		n_count = 5;
	end
	
	local n_s =(n_p - 1)*n_count + 1;
	
	local aryDescribe = {
		"<dec><npc>Чi hi謕 mu鑞 i trang b� c馻 h� ph竔 n祇 b猲 di:",
	};
	for i = n_s, n_s+n_count-1 do
		tinsert(aryDescribe, tbGoldEquip_Lingpai[n_g][i][1]..format("/#take_xp_equip_3(%d, %d, %d, %d)", n_g, n_d, n_p,i));
	end
	
	tinsert(aryDescribe, "L竧 n鱝 quay l筰 /no");
	CreateTaskSay(aryDescribe);
end

function take_xp_equip_3(n_g, n_d, n_p, n_x)
	if (CountFreeRoomByWH(2,4,1) < 1) then
		Talk(1, "", "H祅h trang kh玭g  � tr鑞g! Xin h穣 s緋 x誴 r錳 quay l筰 nh�.");
		return
	end
	
	local nLingpaiIdx = GetNextItemIndexInRoom(0, tbLingpai[n_g].tbProp[1],tbLingpai[n_g].tbProp[2],tbLingpai[n_g].tbProp[3],-1, 3);
	local n_bindstate = GetItemBindState(nLingpaiIdx);
	local n_expiredtime = ITEM_GetExpiredTime(nLingpaiIdx);
	
	if (ConsumeItem(3,1, tbLingpai[n_g].tbProp[1],tbLingpai[n_g].tbProp[2],tbLingpai[n_g].tbProp[3],-1) ~= 1) then
		Talk(1, "", "H譶h nh� i hi謕 qu猲 mang l謓h b礽 �?")
		return
	end
	
	local nItemIdx = AddGoldItem(0, tbGoldEquip_Lingpai[n_g][n_x][2]);
	
--	越南版本没有此需求
--	if (n_expiredtime ~= 0 ) then
--		ITEM_SetExpiredTime(nItemIdx,86400)
--		SyncItem(nItemIdx)
--	end
	
	if (n_bindstate ~= 0) then
		
		if (n_bindstate == -2) then
			n_new_bindtime = take_xp_equip_calc_binditem(tbLingpai_BindTime[n_g].nBindState);
		else
			n_new_bindtime = n_bindstate;
		end
		
		SetItemBindState(nItemIdx, n_new_bindtime);
	end
	
	Msg2Player("Nh薾 頲 棗"..GetItemName(nItemIdx));
	
	local szLog = format("%s\t%s\t%u",tbLingpai[n_g].szName, GetItemName(nItemIdx), ITEM_GetItemRandSeed(nItemIdx))
	
	_WritePlayerLog("Token Exchange Equip", szLog)
end

TIME_2000_1_1 = 946656000;		-- 2000年1月1日 相对于 1970年1月1日的秒数

function take_xp_equip_calc_binditem(nLingpaiBindTime)
	if (nLingpaiBindTime == -2) then
		return -2;
	end
	local n_new_bindtime = nLingpaiBindTime - 7*24 + floor((GetCurServerTime() - TIME_2000_1_1) / 3600);
	return n_new_bindtime;
end

