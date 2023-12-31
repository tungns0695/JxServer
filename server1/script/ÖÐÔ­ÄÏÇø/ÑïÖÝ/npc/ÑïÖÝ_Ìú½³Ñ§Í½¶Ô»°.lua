--中原南区 扬州府 铁匠学徒对话
Include("\\script\\global\\fantasygoldequip\\fantasygoldequip_npc.lua")

function main()
	local nNpcIndex = GetLastDiagNpc()
	local szNpcName = GetNpcName(nNpcIndex)
	if NpcName2Replace then
		szNpcName = NpcName2Replace(szNpcName)
	end
	local tbOption = {"<dec><npc>M閠 ng祔 l祄 tr� su鑤 i l祄 tr�.S� ph� n鉯 r錳,玭g 蕐 kh玭g c� con trai,100 n╩ sau c竔 ti謒 r蘮 n祔 s� l� c馻 ta"}
	if IS_FANTASY_OPEN == 1 then
		tinsert(tbOption, "T譵 hi觰 th玭g tin trang b� Huy襫 Kim/fantasygoldequip_entry")
	end
	tinsert(tbOption, "Ta ch� n ch琲/Cancel")

	CreateTaskSay(tbOption);
end

function fantasygoldequip_entry()

	local tbOption = {
		"<dec><npc>Х bao nhi猽 n╩ r錳,kh玭g ng� n t� ng祔 ta tho竧 kh醝 o Nguy謙 Ca  mai danh 萵 t輈h n nay nh璶g ngi v蒼 t譵 頲 ta,ngi c� � g�?",
		"N﹏g c蕄 Huy襫 Kim ho芻 Huy襫 Kim Chi Tinh/fantasygold_upgrade",
		"Ta t譵 頲 Huy襫 Kim Chi Tinh r錳,xin ch� t筼 trang b� Huy襫 Kim cho ta/gen_fantasygoldequip",
		"Ta t譵 頲 Huy襫 Kim r錳,xin n﹏g c蕄 trang b� Huy襫 Kim cho ta/upgrade_fantasygoldequip",
		"Xin th竜 trang b� Huy襫 Kim cho ta/split_fantasygoldequip",
		"Ngu錸 g鑓 trang b� Huy襫 Kim/fantasygoldequip_history",
		"Ta ch� n ch琲/calcel",
	};
	CreateTaskSay(tbOption);
end

function gen_fantasygoldequip()
	local tbOption = {
		"<dec><npc>C� th� t譵 頲 Huy襫 Kim Chi Tinh,th藅 kh玭g d� d祅g.L筰 t譵 頲 � ch� ta v藋 ta s� th� m閠 l莕",
		"Ta mu鑞 bi誸 thu閏 t輓h c馻 trang b� Huy襫 Kim sau khi ch� t筼/newgold_to_fantasygold_preview",
		"Xin ch� t筼 trang b� Huy襫 Kim cho ta/newgold_to_fantasygold",
		"Ta ch� n ch琲/cancel",
	};
	CreateTaskSay(tbOption);
end

function upgrade_fantasygoldequip()
	local tbOption = {
		"<dec><npc>C� th� t譵 頲 s� lng l韓 Huy襫 Kim,th藅 kh玭g d� d祅g.L筰 t譵 頲 � ch� ta v藋 ta s� th� m閠 l莕",
		"Ta mu鑞 bi誸 thu閏 t輓h c馻 trang b� Huy襫 Kim sau khi n﹏g c蕄/fantasygoldequip_upgrade_preview",
		"Xin n﹏g c蕄 trang b� Huy襫 Kim cho ta/fantasygoldequip_upgrade",
		"Ta ch� n ch琲/cancel",
	};
	CreateTaskSay(tbOption);
end

function split_fantasygoldequip()
	local tbOption = {
		"<dec><npc>Sau khi th竜 b� trang b� Huy襫 Kim th� s� c╪ c� theo tr筺g th竔 kh鉧 m� m� th阨 gian kh鉧 tng 琻g.Trang b� Huy襫 Kim c騨g s� v� tr筺g th竔 +0 v� s� tr� m閠 s� nguy猲 li謚 Huy襫 Kim.C� c莕 ta gi髉 kh玭g?",
		"H穣 gi髉 ta th竜 b� trang b� Huy襫 Kim/split_fantasygoldequip_configm",
		"Ta kh玭g th竜 b� n鱝/cancel",
	};
	CreateTaskSay(tbOption);
end

function fantasygoldequip_history()
	local tbOption = {
		"<dec><npc>Cha ta l� th� r蘮 binh nh蕋 tr猲 o Nguy謙 Ca,kh玭g mu鑞 i i ki誴 ki誴 ph秈 l祄 n� tr猲 o n猲  ngh� tr╩ c竎h cho ta r阨 kh醝 o v� truy襫 b� k輕 r蘮 l筰 cho ta.Ta mai danh 萵 t輓h n nay ch� mu鑞 l祄 m閠 ngi b譶h thng nh璶g ngi v蒼 t譵 n 頲 n誹 kh玭g gi髉 ngi ta ngh� ngi s� kh玭g  y猲 nh� v藋",
		"Xin h穣 gi髉 ta,ta s� kh玭g ti誸 l� b� m藅 n祔/fantasygoldequip_entry",
		"M閠 a h鋍 tr� nh� d竚 l鮝 d鑙 ta/cancel",
	};
	CreateTaskSay(tbOption);
end

