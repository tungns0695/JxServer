-------------------------------------------------------------------------
-- FileName		:	路人_郦秋水.lua
-- Author		:	xiaoyang
-- CreateTime	:	2004-12-27 14:40:10
-- Desc			:	翠烟90级任务？？
-------------------------------------------------------------------------

Include("\\script\\task\\newtask\\master\\zhongli\\zhonglitasknpc.lua")
Include("\\script\\task\\newtask\\newtask_head.lua")
Include("\\script\\misc\\eventsys\\eventsys.lua")
Include("\\script\\dailogsys\\dailog.lua")

function main()
	local nNpcIndex = GetLastDiagNpc()
	local szNpcName = GetNpcName(nNpcIndex)
	if NpcName2Replace then
		szNpcName = NpcName2Replace(szNpcName)
	end
	local tbDailog = DailogClass:new(szNpcName)
	EventSys:GetType("AddNpcOption"):OnEvent(szNpcName,tbDailog , nNpcIndex)
	if getn(tbDailog.tbOptionList) > 0 then
		tbDailog:AddOptEntry("Ta n t譵 玭g c� vi謈 kh竎", old_main)
		tbDailog:Show()
	else
		old_main()
	end
end
function old_main()
	Uworld126 = nt_getTask(126)
	Uworld1002 = nt_getTask(1002)
	Say(" Ngi s鑞g tr猲 i c莕 ph秈 bi誸 tr﹏ tr鋘g h筺h ph骳.",3,
		"Ta n l祄 nhi謒 v� ch輓h tuy課/branch_branchliqiushui",
		"Ta n l祄 nhi謒 v� c蕄 90/tasknpc_nity",
		"Kh玭g h醝 n鱝!/no")
end

function tasknpc_nity()
Uworld126 = nt_getTask(126)
	if (Uworld126 == 10) and (HaveItem(391) == 1) then
		Talk(4,"Uworld126_lose","L� ti觰 th�! C� c� th�!","祅 T� Th祅h c騨g c� ng祔 h鑙 h薾? Qu� tr� r錳! Ta ch糿g c遪 tin tng v祇 n 玭g n鱝.","C� nng h� t蕋 ph秈 c� ch蕄, t鬰 ng� c� c﹗ 'S� bi謙 tam nh藅, 琻g qu竧 m鬰 tng khan', l� n穙 kh玭g th� cho 祅 c玭g t� m閠 c� h閕 sao?","Cho h緉 c� h閕? L骳 h緉 r阨 xa ta sao h緉 kh玭g cho ta m閠 c� h閕 kh玭g? Ta kh玭g mu鑞 n鉯 n鱝, ngi r秐h r鏸 th� h穣 甶 t譵 Chng m玭, b� ta th輈h n鉯 nh鱪g chuy謓 n祔.")
	elseif (Uworld126 == 10) then			-- 没有书信
		Talk(3,"","L� ti觰 th�! C� c� th�!","Th� g� v藋?","�! Ta  qu猲 � ch� 祅 T� Th祅h.")
	elseif (Uworld126 == 30)then
   	Talk(3,"Uworld126_cant","L� ti觰 th�!",".....","Xem ra ph秈 quay l筰 g苝 祅 c玭g t� t譵 bi謓 ph竝 m韎 頲.")
   elseif (Uworld126 == 60)then
   	Talk(12,"Uworld126_beleive","L� ti觰 th�! Kh玭g xong r錳! ","V閕 c竔 g�! C� g� t� t� n鉯.","祅 c玭g t鰠.","H緉 th� n祇?","祅 c玭g t� v� b秓 v� c� b� k� th� nh tr鋘g thng, t輓h m筺g 產ng nguy hi觤!","Ngi kh玭g c莕 b轪 t, ta quy誸 kh玭g tin ngi u!","T筰 h� l蕐 danh ti課g c馻 m譶h tr猲 giang h� ra b秓 m, ta kh玭g g箃 c� nng u..","Ch糿g l�.....T� Th祅h. Qua nhi襲 n╩ nh� th� r錳 ngi h� t蕋 ph秈 thay ngi kh竎 ch辵 tr薾, nh鱪g n╩ g莕 y t輓h t譶h ta  thay i,  t筼 ra nhi襲 h薾 th�, ngi kh玭g c� v� c玭g th藅 l� chu鑓 kh� v祇 th﹏.","N誹 ng祔 蕐 c� ch辵 tha th� cho h緉 th� u n n鏸.","M蕐 ng祔 n祔 ta kh玭g sao ng� 頲, trong l遪g lu玭 ngh� v� y, b﹜ gi� y 產ng � u?","Чi L�!","Ta s� n  ngay, t蕋 c� nh鱪g th� h薾  k誸 th骳!")	
   elseif (Uworld126 > 10) and (Uworld126 < 60) then				-- 任务中的缺省对话
   	Talk(1,"","Ta v� T� Th祅h kh玭g li猲 can g� nhau, ngi ng l緈 l阨! ")
   else
   	Talk(1,"","M玭 ch� kh玭g th� th祅h th﹏ v韎 Л阯g Nh蕋 Tr莕, nh� th� s� ph筸 m玭 quy.....")
   end
end

function Uworld126_lose()
	DelItem(391)
	nt_setTask(126,20)
	Msg2Player("Sau khi xem th�, L� Thu Th駓 kh玭g ch髏 x骳 ng, b筺 quy誸 nh 甶 t譵 Do穘 H祄 Y猲 gi髉 .")
	AddNote("Sau khi xem th�, L� Thu Th駓 kh玭g ch髏 x骳 ng, b筺 quy誸 nh 甶 t譵 Do穘 H祄 Y猲 gi髉 .")
end

function Uworld126_cant()
	nt_setTask(126,40)
	Msg2Player("L� Thu Th駓 kh玭g nghe l阨 khuy猲, b筺 quy誸 nh tr� v� t譵 祅 T� Th祅h.")
	AddNote("L� Thu Th駓 kh玭g nghe l阨 khuy猲, b筺 quy誸 nh tr� v� t譵 祅 T� Th祅h.")
end

function Uworld126_beleive()
	nt_setTask(126,70)
	Msg2Player("Trong l遪g L� Thu Th駓 v蒼 c遪 vng v蕁 祅 T� Th祅h, quy誸 nh 甶 g苝 m苩 h緉 l莕 cu鑙! K� ho筩h th祅h c玭g.")
	AddNote("Trong l遪g L� Thu Th駓 v蒼 c遪 vng v蕁 祅 T� Th祅h, quy誸 nh 甶 g苝 m苩 h緉 l莕 cu鑙! K� ho筩h th祅h c玭g.")
end

function branch_branchliqiushui()
	Uworld1002 = nt_getTask(1002)
   	liqiushui()
end

function no()
end