--2007越南国庆活动
--2007-08-08
--by 小浪多多
--获取百宝箱

TB_Material = {
 --1.物品名	2.数量
	["0,10,5"] = "Ng鵤 c蕄 80",
	["4,490,1"] =	"M秐h T祅g B秓 у 1",
	["4,491,1"] =	"M秐h T祅g B秓 у 2",
	["4,492,1"] =	"M秐h T祅g B秓 у 3",
	["4,493,1"] =	"M秐h T祅g B秓 у 4",
	["4,494,1"] =	"M秐h T祅g B秓 у 5",
	["4,495,1"] =	"M秐h T祅g B秓 у 6",
	["4,496,1"] =	"M秐h T祅g B秓 у 7",
	["4,497,1"] =	"M秐h T祅g B秓 у 8",
	["4,498,1"] =	"M秐h T祅g B秓 у 9",
	["4,499,1"] =	"M秐h T祅g B秓 у 10",
	["4,500,1"] =	"M秐h T祅g B秓 у 11",
	["4,501,1"] =	"M秐h T祅g B秓 у 12",
}
function BaiBaoXiang_Give_UI()
	GiveItemUI("B竎h b秓 rng","襲 ki謓  i B竎h b秓 rng l� ph秈 m� r閚g rng th� hai, c飊g v韎 m閠 con ng鵤 c蕄 80 b蕋 k� v� m閠 b� m秐h T祅g b秓  t� 1 n 12.","BaiBaoXiang_Get","no",1)
end			

function BaiBaoXiang_Get(nItemCount)
	if CheckStoreBoxState(2) > 0 then
		Say("Th莕 b� thng nh﹏: Чi hi謕  c� B竎h b秓 rng r錳, c莕 g� n ta n鱝.",1,"уng �!/no");
		return 1;
	end
	if	CheckStoreBoxState(1) == 0 then
		Say("Th莕 b� thng nh﹏: Чi hi謕 v蒼 ch璦 m� rng th� hai, ta kh玭g th� trao i B竎h b秓 rng 頲. H穣 n Ba L╪g Huy謓 m� rng th� hai trc r錳 h穣 t譵 ta.",1,"уng �!/no");
		return 1;	
	end
	local tb_enhanceitem_count = {};
	for szkey, tb_item in TB_Material do
		tb_enhanceitem_count[szkey] = {};
		tb_enhanceitem_count[szkey][1] = 0;
	end
	--检测物品匹配
	for i = 1, nItemCount do
		local nCurItemIdx = GetGiveItemUnit(i);
		local nCurItemName = GetItemName(nCurItemIdx);
		local nCurItemQuality = GetItemQuality(nCurItemIdx);
		local tbCurItemProp = pack(GetItemProp(nCurItemIdx));
		
		local szItemKey = tbCurItemProp[1]..","..tbCurItemProp[2]..","..tbCurItemProp[3];
		
		
		if (TB_Material[szItemKey] == nil) then
				Say("Th莕 b� thng nh﹏: Kh玭g 頲 r錳, ta ch� c莕 1 b� t祅g b秓  v� 1 con ng鵤 c蕄 80, kh玭g c莕 nh鱪g th� kh竎.",2,"Ha ha,  ta th� l筰 v藋./BaiBaoXiang_Give_UI","Th藅 ng筰 qu�, ta s� quay l筰 sau./no");
				return
		end
		tb_enhanceitem_count[szItemKey][1] = tb_enhanceitem_count[szItemKey][1] + GetItemStackCount(nCurItemIdx);
	end
	
		for szkey, tb_item in TB_Material do
				if (tb_enhanceitem_count[szkey][1] ~= 1) then
					Say("Th莕 b� thng nh﹏: Kh玭g 頲 r錳, v藅 ph萴 ta y猽 c莡 kh玭g v蒼 ch璦 .",2,"Ha ha,  ta th� l筰 v藋./BaiBaoXiang_Give_UI","Th藅 ng筰 qu�, ta s� quay l筰 sau./no");
				return
				end
		end
		
		--删材料
		for i=1, nItemCount do
			local nIdx = GetGiveItemUnit(i)
			if (RemoveItemByIndex(nIdx) ~= 1) then
				WriteLog(format("[GuoQing2007_BaiBaoXiang]Date:%s\t Account:%s\t Name:%s\t DelItemFail:%s",GetLocalDate("%Y-%m-%d %H:%M:%S"),GetAccount(),GetName(),GetItemName(GetGiveItemUnit(i)) ));
				return
			end
		end
		
		 --给物品
		Msg2Player("B筺  nh薾 頲 <color=yellow>B竎h b秓 rng<color>.");
		Say("Th莕 b� thng nh﹏: Xin ch骳 m鮪g, i hi謕  nh薾 頲 B竎h b秓 rng.",1,"уng �!/no");
		OpenStoreBox(2);
		WriteLog(format("[GuoQing2007_BaiBaoXiang]\t Date:%s\t Account:%s\t Name:%s\t Effect:Get BaiBaoXiang",GetLocalDate("%y-%m-%d %H:%M:%S"),GetAccount(),GetName()));

end

function pack(...)
	return arg
end