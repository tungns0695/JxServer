-- 随机宝箱物品（随机获得一样物品）
-- By: Yuning_liu(2005-03-21)

function main()
	local id_gold = random(1,146)
	AddGoldItem(0, id_gold)
	Msg2Player("B n nh n    c m t <color=yellow>trang b  ho ng kim.")
end