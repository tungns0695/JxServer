--by 廖志山 [2006-09-12]
--2006中秋活动之活动二：寻找云游图和仙舞图.
--Illustration: 仙女 -- fairy au06- -- midautumn2006

Include([[\script\event\mid_autumn06\head.lua]]);

--仙女活动入口函数
function au06_entrance_fairy()
	if (au06_IsPayed_player() == 0) then
		Say("Ch� c� ngi ch琲 n筽 th� m韎 c� th� tham gia ho箃 ng Trung thu", 0);
		return
	end;
	
	local tab_Content = {
		"Ta  thu th藀  c竎 m秐h tranh./handup_picture",
		"Ch� n th╩ 玭g ch髏 th玦!/oncancel"
	};
	Describe("Li評 蕋 thng nh﹏ 產ng mu鑞 t譵 hai b鴆 danh h鋋 H籲g Nga Ti猲 T�. 2 b鴆 tranh n祔  b� ph﹏ th祅h nhi襲 m秐h t秐 l筩 kh緋 n琲. Nghe n鉯 D� T萿 產ng c�  c竎 m秐h tranh . N誹 ngi c� 頲 nh鱪g m秐h n祔, ta s� gi髉 ngi gh衟 l筰.", getn(tab_Content), tab_Content);
end;

--给予界面
function handup_picture()
	--如果经验达到上限
	GiveItemUI("Giao tranh", "C竎h gh衟: x誴 theo ng v� tr�, d飊g � u ti猲 b猲 tr竔 l祄 chu萵  gh衟 tranh.", "pic_award", "oncancel");
end;

tab_boxcheck = 
{{1207, 1208, 1209, 1210, 1211, 1212},
 {1213, 1214, 1215, 1216, 1217, 1218}
}
--判断是否给奖励
function pic_award(nCount)
	local bCorrectItem = 0
	local idxItem = 0

	if (nCount ~= 6) then
		Describe("M閠 b鴆 tranh c� s竨 m秐h, ngi 甧m n ch璦 .", 1, "V藋 ta xin c竜 t�./oncancel");
		return
	end
	
	bFull = 1;
	idxItem = GetGiveItemUnit(1);
	local g, d, p = GetItemProp(idxItem);
	local nIndex = 0;
	if (p <= 1212 and p >= 1207 and d == 1 and g == 6) then
		nIndex = 1;
	elseif(p <= 1218 and p >= 1213 and d == 1 and g == 6) then
		nIndex = 2;
	end;
	if (0 == nIndex) then
		Describe("Nh鱪g m秐h tranh c馻 ngi kh玭g   gh衟, h穣 t譵  r錳 quay v� g苝 ta.", 1, "V藋 ta xin c竜 t�./oncancel");
		return
	end

	tab_items = {};
	for i = 1, nCount do
		idxItem = GetGiveItemUnit(i)
		g, d, p = GetItemProp(idxItem)
		if (d ~= 1 or g ~= 6) then
			bFull = 0;
			break
		end
		tab_items[i] = p;
	end
	
	tab_items = au06_sort(tab_items); -- 升序排序
	
	for i = 1, getn(tab_items) do
		if (tab_items[i] ~= tab_boxcheck[nIndex][i]) then
			bFull = 0;
			break;
		end;
	end;
	
	if (0 == bFull) then
		Describe("Nh鱪g m秐h tranh c馻 ngi kh玭g   gh衟, h穣 t譵  r錳 quay v� g苝 ta.", 1, "V藋 ta xin c竜 t�./oncancel");
		return
	end
	
	--删除画
	for i = 1, nCount do
		idxItem = GetGiveItemUnit(i);
		RemoveItemByIndex(idxItem);
	end
	
	--给奖励
	local str = "1 <color=yellow>Thng C� L謓h B礽<color>";
	AddItem(6, 1, 1252, 1, 0, 0, 0);
	
	--给提示
	Describe("Th藅 kh玭g ng� ngi c� th� t譵  b�. Зy l� <color=yellow>Thng C� L謓h B礽<color>, mang  10 t蕀 l謓h b礽 n祔 n g苝 Li評 蕋 thng nh﹏ � Tng Dng  i l蕐 b竛h trung thu th莕 k�", 1, "Nh薾 ph莕 thng/oncancel")
	Msg2Player("B筺 t 頲"..str);
end;

function au06_sort(table)
	if (not table or type(table) ~= "table") then
		return {};
	end;
	
	local nCount = getn(table);
	for i = 2, nCount do	--采用一个冒泡排序
		for j = nCount, i, -1 do
			if (table[j] < table[j - 1]) then	--采用降升序排序
				temptab = table[j];
				table[j] = table[j - 1];
				table[j - 1] = temptab;
			end;
		end;
	end;
	
	return table;
end

