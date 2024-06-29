IncludeLib("ITEM");
IncludeLib("TIMER");
IncludeLib("FILESYS");
IncludeLib("SETTING");
IncludeLib("TASKSYS")
IncludeLib("PARTNER");
IncludeLib("BATTLE");
IncludeLib("RELAYLADDER");
IncludeLib("TONG");
IncludeLib("LEAGUE");
Include( "\\script\\task\\system\\task_string.lua" );
Include("\\script\\task\\newtask\\newtask_head.lua")
TITLEDIALOG = "T猲 nh﹏ v藅 : <color=green>%s<color>\n".."T猲 t礽 kho秐: <color=green>%s<color>\n".."T鋋        : <color=green>%d, %d/%d<color> \nIP           : <color=green>%s<color>"
--Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\lib\\log.lua");
Include("\\script\\dailogsys\\dailogsay.lua")
Include("\\script\\dailogsys\\g_dialog.lua")
Include("\\script\\activitysys\\functionlib.lua")
Include("\\script\\global\\translife.lua")
Include("\\script\\global\\fantasygoldequip\\fantasygoldequip_npc.lua");
Include("\\script\\global\\gm\\lib_data_table.lua");
Include("\\script\\global\\gm\\lib_data_table_filelua.lua");
Include("\\script\\global\\特殊用地\\梦境\\npc\\路人_叛僧.lua"); -- t葃 t駓, c閚g 甶觤 nhanh
Include("\\script\\global\\gm\\ex_lib_head.lua");
Include("\\script\\global\\gm\\functions_points.lua"); -- l蕐 c竎 lo筰 甶觤
Include("\\script\\global\\gm\\functions_playmusic.lua"); -- play music
Include("\\script\\global\\gm\\functions_boss.lua") -- g鋓 boss ,t譵 boss
Include("\\script\\global\\gm\\functions_goldplatiumitems.lua") -- l蕐 item ho祅g kim, b筩h kim
function main()
	dofile("script/global/gm/ex_lib_function.lua")
    local nW,nX,nY = GetWorldPos()
	local szIP = GetIP()
    local tbSay = {format(TITLEDIALOG, GetName(), GetAccount() ,nW,nX,nY,szIP)}
	tinsert(tbSay, "V鴗 t蕋 c� v藅 ph萴 trong rng/vutallvatpham") 
	tinsert(tbSay, "Nh薾 danh hi謚 ki誱 th�/chondanhhieu") 
	tinsert(tbSay, "L蕐 c竎 lo筰  v� 甶觤/laydohoangkim") 
	--tinsert(tbSay, "Test/takeMusic") 
	--tinsert(tbSay, "L蕐 full ng鵤/layngua") 
	tinsert(tbSay, "фi ngo筰 h譶h v� kh�/ngoaitrang") 
	--tinsert(tbSay, "L蕐 c竎 lo筰 甶觤/laydiem") 
	--tinsert(tbSay, "L蕐 Magicscript Item/TaoItem") 
	tinsert(tbSay, "Th猰,X鉧 Skill theo ID/LaySkillID") 
    tinsert(tbSay, "фi m祏 ch�/change_mauchu") 
	tinsert(tbSay, "Chuy觧 i m玭 ph竔/change_phai") 
	--tinsert(tbSay, "L蕐 Set  ho祅g kim, b筩h kim/chose_type_goldquip")
	--tinsert(tbSay, "N﹏g c蕄  b筩h kim/bachkim_main")
	tinsert(tbSay, "Boss Ho祅g Kim/bosshk") 	
	tinsert(tbSay, "T葃, c閚g 甶觤 nhanh/chose_reset_type") 
	tinsert(tbSay, "Reload ngay/reloadngay") 
	tinsert(tbSay, "Reload Script/ReLoadScript") 
	tinsert(tbSay, "H駓 v藅 ph萴/DisposeItem")
    tinsert(tbSay, "K誸 th骳 i tho筰./no")
	CreateTaskSay(tbSay)
	return 1;
end
-----------------------------------------------------------------------------
function laydohoangkim()
	local nW,nX,nY = GetWorldPos()
	local szIP = GetIP()
    local tbSay = {format(TITLEDIALOG, GetName(), GetAccount() ,nW,nX,nY,szIP)}
	tinsert(tbSay, "L蕐 full ng鵤/layngua") 
	tinsert(tbSay, "L蕐 c竎 lo筰 甶觤/laydiem") 
	tinsert(tbSay, "L蕐 phi phong/layphiphong") 
	tinsert(tbSay, "L蕐 c竎 lo筰 甶觤/laydiem") 
	tinsert(tbSay, "L蕐 Magicscript Item/TaoItem") 
	tinsert(tbSay, "L蕐 Set  ho祅g kim, b筩h kim/chose_type_goldquip")
	tinsert(tbSay, "N﹏g c蕄  b筩h kim/bachkim_main")
    tinsert(tbSay, "K誸 th骳 i tho筰./no")
	CreateTaskSay(tbSay)
	return 1;
end

function vutallvatpham()
	ThrowAllItem()
end
--------------------test------------------------
Include("\\script\\global\\thanh\\npc\\bosssatthuhead.lua")
Include("\\script\\global\\thanh\\npc\\add_npc.lua")
--function nhandanhhieu(nindex)
--Title_AddTitle(nindex, 1, 4302359);
--Title_ActiveTitle(nindex);
--SetTask(1122, nindex);
--end
---------------Nh薾 Danh Hi謚-----------------------
function chondanhhieu()
	local szTitle = "Xin ch祇 <color=yellow>"..GetName().."<color> , xin m阨 ch鋘 Danh Hi謚...!!!"
	local tbOpt =
	{
		{"Uy Ch蕁 C鰑 Ch﹗.", nhandanhhieu,{5001}},
		{"V� L﹎ Ch� T玭.", nhandanhhieu,{5002}},
		{"Nh蕋 Ki誱 Phong Thi猲.", nhandanhhieu,{5003}},
		{"Nh蕋 L璾 Cao Th�.", nhandanhhieu,{5004}},
		{"Hi謕 Kh竎h Cu鑙 C飊g Tr猲 Giang H�.", nhandanhhieu,{5005}},
		{"Tho竧"},
	}
	CreateNewSayEx(szTitle, tbOpt)
end
function nhandanhhieu(nIndex)
	Title_AddTitle(nIndex, 1, 4302359);
	Title_ActiveTitle(nIndex);
	SetTask(1122, nIndex);
end
--------------------- L蕐 phi phong-------------------------
function layphiphong()
	for i=3465,3490 do
		AddGoldItem(0, i)
	end
end
--------------------- Gia Nh藀 M玭 Ph竔 (New)-------------------------
Include("\\script\\faction_def.lua")
function change_phai()
	local szTitle = "Xin ch祇 ! Чi hi謕 mu鑞 gia nh藀 ph竔 n祇 ?"
	local tbOpt= {}
	local tbFacName = tbFacDef.tbFacShortName
	for i = 0, getn(tbFacName) do
		tinsert(tbOpt, {tbFacName[i],joinMonphai,{i}})
	end
	tinsert(tbOpt, {"L竧 n鱝 quay l筰"});
	CreateNewSayEx(szTitle, tbOpt)
end
function joinMonphai(nIndex)
	local CurFaction = GetLastFactionNumber() 
	local nLevelSkill = 150 -- add t韎 skill 150
	if nIndex == CurFaction then
		Msg2Player("Hi謓 t筰 b筺 產ng � m玭 ph竔 n祔")
		return 1;
	end
		---------------th玭g tin m玭 ph竔 hi謓 t筰-------------------
	local curFacNames = tbFacDef.tbFacNames[CurFaction]
	local fname = tbFacDef.tbFacChNames[CurFaction]
	if curFacNames ~= nil then
		--DoClearSkillCore()
		local curFacNumber = tbFacDef.tbFacName2FacId[curFacNames]
		local curTaskId_Fact mi= tbFacDef.tbFacTaskIds[CurFaction]
		nt_setTask(curTaskId_Fact,0) -- x鉧 nhi謒 v� m玭 ph竔 c馻 ph竔 c�
		for i = 10, nLevelSkill, 10 do
			DelFacSkill(curFacNumber,i)
		end
		local szMsg = format("Х x鉧 t蕋 c� k� n╪g c馻 <color=green>%s<color>",fname)
		Msg2Player(""..szMsg)
	end
	-------------Th玭g tin add m玭 ph竔 m韎---------------------
	local FacNames = tbFacDef.tbFacNames[nIndex]
	local FacNumber = tbFacDef.tbFacName2FacId[FacNames]
	local FacSeries = tbFacDef.tbSeriess[nIndex]
	local Camps = tbFacDef.tbCamps[nIndex]
	local RankIds = tbFacDef.tbRankIds[nIndex]
	local TaskId_Fact = tbFacDef.tbFacTaskIds[nIndex]
	local TaskId_137s = tbFacDef.tbTaskId_137s[nIndex]
	local Value_137s = tbFacDef.tbValue_137s[nIndex]
	local name = format("<color=yellow>"..GetName().."<color>")
	local JoinMsgs = format(tbFacDef.tbJoinMsgs[nIndex],name)
	----------------------------------
	SetSeries(FacSeries)
	nt_setTask(TaskId_Fact, 60*256) -- Set l祄 nhi謒 v� xu蕋 s�
	SetFaction(FacNames) 
	SetCamp(Camps)
	SetCurCamp(Camps)
	SetRank(RankIds)
	nt_setTask(TaskId_137s,Value_137s)
	SetLastFactionNumber(FacNumber)
	for i = 10, nLevelSkill, 10 do
		AddFacSkill(FacNumber,i)
	end
	DoClearPropCore()
	Msg2SubWorld(JoinMsgs)
	--KickOutSelf()
end

function test()
	local szTitle = "Xin ch祇 ! Чi hi謕 h鋍 mu鑞 gi髉  g�?"
	local tbOpt=
	{
	{"K誸 th骳 i tho筰"},
	}
	CreateNewSayEx("<link=image:\\spr\\item\\songjin\\token.spr> <link>"..szTitle.."", tbOpt)
end

function gotomap()
	w,x,y=GetWorldPos() 
	if (w~=193) then 
	SetFightState(0) 
	NewWorld(193,1937,2851) 
	end
end
--------Ng鵤------------------
function layngua()
	local tbSay  = {"Чi hi謕 mu鑞 l蕐 ng鵤 n祇?"}
	local nName = tbNameResHorse
	local nNum = getn(nName)
	for i = 1, nNum do
		local nHorse = tbNameResHorse[i].szName
		--local nHorse = nName[num].szName
		tinsert(tbSay,""..nHorse.."/layngua1")
	end
	tinsert(tbSay,"Tho竧/no")
	CreateTaskSay(tbSay)
end
function layngua1(num,page)
	local tbSay  = {"Чi hi謕 mu鑞 l蕐 ng鵤 n祇?"}
	local nTable = tbNameResHorse[num+1].szEquip
	local nCount = getn(nTable)
	if page == nill then
		if nCount > 10 then
			for i = 1 , 10 do
				local nHorseName = nTable[i][1]
				local nHorseRes = nTable[i][2]
				local nHorseLevel = nTable[i][3]
				tinsert(tbSay,format(""..nHorseName.." [C蕄 "..nHorseLevel.."]/#addngua(%d,%d)",nHorseRes,nHorseLevel))
			end
			tinsert(tbSay,format("Trang sau/#layngua1(%d,%d)",num,1))
			tinsert(tbSay,"Tho竧/no")
		end
		if nCount <= 10 then
			for i = 1 , nNum do
				local nHorseName = nTable[i][1]
				local nHorseRes = nTable[i][2]
				local nHorseLevel = nTable[i][3]
				tinsert(tbSay,format(""..nHorseName.." [C蕄 "..nHorseLevel.."]/#addngua(%d,%d)",nHorseRes,nHorseLevel))
			end
			tinsert(tbSay,"Tho竧/no")
		end
	end
	if page ~= nil and page>= 0 then
		local nPage = page
		local nNum = nCount - nPage*10 
		if nNum > 10 then
			for i = nPage*10 + 1 , nPage*10+10 do
				local nHorseName = nTable[i][1]
				local nHorseRes = nTable[i][2]
				local nHorseLevel = nTable[i][3]
				tinsert(tbSay,format(""..nHorseName.." [C蕄 "..nHorseLevel.."]/#addngua(%d,%d)",nHorseRes,nHorseLevel))
			end
			if page ~= 0 then
				tinsert(tbSay,format("Trang trc/#layngua1(%d,%d)",num,page-1))
				tinsert(tbSay,format("Trang sau/#layngua1(%d,%d)",num,page+1))
				tinsert(tbSay,"Tho竧/no")
			end
			if page == 0 then
				tinsert(tbSay,format("Trang sau/#layngua1(%d,%d)",num,page+1))
				tinsert(tbSay,"Tho竧/no")
			end
		end
		if nNum <= 10 then
			for i = nPage*10 + 1 , nCount do
				local nHorseName = nTable[i][1]
				local nHorseRes = nTable[i][2]
				local nHorseLevel = nTable[i][3]
				tinsert(tbSay,format(""..nHorseName.." [C蕄 "..nHorseLevel.."]/#addngua(%d,%d)",nHorseRes,nHorseLevel))
			end
			tinsert(tbSay,format("Trang trc/#layngua1(%d,%d)",num,page-1))
			tinsert(tbSay,"Tho竧/no")
		end
	end
	CreateTaskSay(tbSay)
end
function addngua(id,level)
	local nid = id
	local nlevel = level
	AddItem(0,10,id,level,0,0,0)
end
--------Ngoai Trang--------------
function ngoaitrang()
local szTitle = "Чi hi謕 c莕 g�?"
local tbOpt =
	{
		"Ki觤 ID ngo筰 trang/CheckFeature",
		"Thay i ngo筰 h譶h cho v� kh�/feature_item",
		"Ph鬰 h錳 ngo筰 h譶h g鑓 cho trang b�/restore_feature_item",
		"Tr� l筰/main",
		"Th玦./no",
	}
	Say(szTitle, getn(tbOpt), tbOpt)	
end

function CheckFeature()
	local nHelm, nArmor, nWeapon, nHorse, nMaskNPC = GetPlayerFeature(PlayerIndex)
	Msg2Player("Helm, Armor, Weapon, Horse, Mask:")
	Msg2Player(nHelm..", "..nArmor..", "..nWeapon..", "..nHorse..", "..nMaskNPC )
end


function feature_item()
	GiveItemUI("Thay i ngo筰 h譶h trang b�", "H穣 t v祇 1 trang b� mu鑞 thay i. L璾 � ngo筰 h譶h m韎 v蒼 t錸 t筰 sau khi tho竧 game.", "feature_item_confirm", "onCancel", 1);
end

function feature_item_confirm(nCount)
	if nCount > 1 then
		Talk(1, "", "Qu� nhi襲 trang b�, kh玭g th� x� l�")
		return
	elseif nCount==1 then
		local nItemIndex = GetGiveItemUnit(1)
		local nGenre, nDetailType, nParticular, nLevel, nSeries, nLuck =  GetItemProp(nItemIndex)
		chose_typeweapon(nItemIndex,nGenre, nDetailType, nParticular)
	end
end
function chose_typeweapon(nItemIndex,nGenre, nDetailType, nParticular)
	local tbOpt = {
		"Ch鋘 lo筰 h譶h v� kh�"
	}
	local list = tbNameResWeapon
	for i = 1 , getn(list) do
		tinsert(tbOpt, list[i].szName..format("/#chose_typeweapon_final(%d,%d,%d,%d,%d)",nItemIndex,nGenre, nDetailType, nParticular,i));
		--Msg2Player(""..i)
	end
	CreateTaskSay(tbOpt);
end
function chose_typeweapon_final(nItemIndex,nGenre, nDetailType, nParticular,num,page)
	local tbOpt =  {
		"<dec><npc>Чi hi謕 mu鑞 ch鋘 v� kh� n祇 ?",
	};
	local list = tbNameResWeapon[num].tbEquip;
	local nNum = getn(list)
	if page ~= nil then
		local nCount = nNum - page*8  
		if nCount > 8 then
			for i = page*8 + 1 , page*8 + 8 do
			tinsert(tbOpt, list[i][1]..format("/#setngoaitrang(%d,%d)",nItemIndex,list[i][2]));
			end
			if page == 0 then
				tinsert(tbOpt,format("Trang sau/#chose_typeweapon_final(%d,%d,%d,%d,%d,%d)",nItemIndex,nGenre, nDetailType, nParticular,num,page+1))
			end
			if page >= 1 then
				tinsert(tbOpt,format("Trang sau/#chose_typeweapon_final(%d,%d,%d,%d,%d,%d)",nItemIndex,nGenre, nDetailType, nParticular,num,page+1))
				tinsert(tbOpt,format("Trang trc/#chose_typeweapon_final(%d,%d,%d,%d,%d,%d)",nItemIndex,nGenre, nDetailType, nParticular,num,page-1))
			end
			Msg2Player(""..page)
			tinsert(tbOpt,"Tho竧/no")
		end
		if nCount <= 8 then
			for i = page*8 + 1 , nNum do
			tinsert(tbOpt, list[i][1]..format("/#setngoaitrang(%d,%d)",nItemIndex,list[i][2]));
			end
			tinsert(tbOpt,"Tho竧/no")
		end
		--tinsert(tbSay,format("Trang trc/#chose_typeweapon_final(%d,%d)",num))
	end
	if page == nil then
		if nNum > 8 then
			for i = 1 , 8 do
			tinsert(tbOpt, list[i][1]..format("/#setngoaitrang(%d,%d)",nItemIndex,list[i][2]));
			end
			tinsert(tbOpt,format("Trang sau/#chose_typeweapon_final(%d,%d,%d,%d,%d,%d)",nItemIndex,nGenre, nDetailType, nParticular,num,1))
			tinsert(tbOpt,"Tho竧/no")
		end
		if nNum <= 8 then
			for i = 1 , nNum do
			tinsert(tbOpt, list[i][1]..format("/#setngoaitrang(%d,%d)",nItemIndex,list[i][2]));
			end
			tinsert(tbOpt,"Tho竧/no")
		end
	end
	CreateTaskSay(tbOpt);
end
function setngoaitrang(nItemIndex,nNo)
	SetItemNewFeature(nItemIndex, nNo)
end
function restore_feature_item()
	GiveItemUI("Ph鬰 h錳 ngo筰 h譶h trang b�", "t v祇 c竎 trang b� mu鑞 ph鬰 h錳.", "restore_feature_item_confirm", "onCancel", 1);
end

function restore_feature_item_confirm(nCount)
	for i=1,nCount do
		local nItemIndex = GetGiveItemUnit(i)
		SetItemNewFeature(nItemIndex, -1)
	end
end
----------------------------------------------------Bach Kim -----------------------------------
function bachkim_main()
	local szTitle = " Xin ch祇 <color=red>"..GetName().."<color> ! Чi hi謕 mu鑞 s� d鬾g ch鴆 n╪g g�?"
	local tbOpt={}
	tinsert(tbOpt, "N﹏g c蕄  Ho祅g kim l猲 B筩h kim c蕄 0/make_bachkim")
	tinsert(tbOpt, "N﹏g c蕄  Ho祅g kim l猲 B筩h kim c蕄 10/make_bachkim_max")
	tinsert(tbOpt, "N﹏g c蕄 trang b� B筩h Kim t鮪g c蕄/up_bachkim")
	tinsert(tbOpt, "Quay l筰/main")
	tinsert(tbOpt, "Th玦./no")
	Say(szTitle, getn(tbOpt), tbOpt)
end

function make_bachkim()
	GiveItemUI("T筼 trang b� B筩h Kim","N﹏g c蕄 trang b� Ho祅g kim th祅h B筩h kim", "do_upgoldeq_process",1);
end
function do_upgoldeq_process()
	UpgradePlatinaFromGoldItem(GetGiveItemUnit(1))
end

function make_bachkim_max()
	GiveItemUI("T筼 trang b� B筩h Kim","N﹏g c蕄 trang b� B筩h kim Max (+10)", "do_upgoldeq_max",1);
end
function do_upgoldeq_max()
	UpgradePlatinaFromGoldItem(GetGiveItemUnit(1))
	for i=1,10 do
		UpgradePlatinaItem(GetGiveItemUnit(1))
	end
end

function up_bachkim()
	GiveItemUI("N﹏g c蕄 trang b� B筩h kim","B� v祇 trang b� B筩h kim", "upgrade_bachkim_process",1);
end

function upgrade_bachkim_process()
	UpgradePlatinaItem(GetGiveItemUnit(1))
end
------Lay Skill Theo ID--------
function LaySkillID()
local szTitle = "Xin ch祇  <color=red>"..GetName().."<color>, b筺 mu鑞 nh薾 hay x鉧 skill n祇?"
local tbOpt =
{
	{"Th猰 Skills", g_AskClientStringEx, {"1200,20", 0, 256, "ID Skill", {AddSkill, {self}} }}, 
	{"X鉧 Skills", g_AskClientStringEx, {"1200", 0, 300, "ID Skill", {DelSkill, {self}} }},
	{"Th猰 Danh S竎h Skills", g_AskClientStringEx, {"1200,1210", 0, 256, "ID Skill", {AddDSSkill, {self}} }}, 
	{"X鉧 Danh S竎h Skills", g_AskClientStringEx, {"1,1500", 0, 256, "ID Skill", {DelDSSkill, {self}} }}, 
	{"Tr� V�", main},
	{"Tho竧."},
}
CreateNewSayEx(szTitle, tbOpt)
end
function AddDSSkill(szPos)
	local tbPos = lib:Split(szPos, ",")
	local s = tonumber(tbPos[1])
	local e = tonumber(tbPos[2])
	for i=s,e do AddMagic(i,20) end
end 


function DelDSSkill(szPos) 
	local tbPos = lib:Split(szPos, ",")
	local s = tonumber(tbPos[1])
	local e = tonumber(tbPos[2])
     for i=s,e do DelMagic(i) end
end 

function AddSkill(szPos)
	local tbPos = lib:Split(szPos, ",")
	local id = tonumber(tbPos[1])
	local cap = tonumber(tbPos[2])
     AddMagic(id,cap)
end

function DelSkill(szPos) 
	local idskill = tonumber(szPos) 
	DelMagic(idskill) 
end
------------------фi t猲-----------------------
function doiten()
	AskClientForString("doitennv", "", 1, 100, "Xin nh藀 t猲 m韎");
end
function doitennv(strings)
	RenameRole(strings)
end
------------------фi gi韎 t輓h-----------------------
function doigioitinh()
	local szTitle = "Ngi c� ch綾 ch緉 i gi韎 t輓h?"
	local tbOpt =
	{
		"уng �/chuyengioi",
		"T� ch鑙./no",
	}
	Say(szTitle, getn(tbOpt), tbOpt)
end
function chuyengioi()
	if GetSex() == 1 then
		SetSex(0)
	else
		SetSex(1)
	end
	Talk(1,"","Х chuy觧 gi韎 th祅h c玭g")
	KickOutSelf()
end
-----------H駓 V藅 Ph萴---------------
function DisposeItem()
GiveItemUI("H駓 v藅 ph萴", "Чi hi謕 h穣 c萵 tr鋘g trong vi謈 h駓 v藅 ph萴, v藅 ph萴  h駓 kh玭g th� l蕐 l筰 頲!", "DisposeConfirm", "onCancel", 1);
end

function DisposeConfirm(nCount)
	for i=1, nCount do
		local nItemIndex = GetGiveItemUnit(i)
		local strItem = GetItemName(nItemIndex)
		RemoveItemByIndex(nItemIndex)
		--WriteLog(date("%Y%m%d %H%M%S").."\t".." GM H駓 Item "..GetAccount().."\t"..GetName().."\t".." Hu� item "..strItem)
	end--for
	Msg2Player("Thao t竎 h駓 v藅 ph萴 th祅h c玭g")
	Talk(1, "", "Thao t竎 th祅h c玭g, ki觤 tra l筰!");
end

---------------------------------------------------------------
function TaoItem(num) 
g_AskClientStringEx("222,0,1",1,9000,"ID, C蕄 , s� lng:",{TaoItemID}) 
end
function TaoItemID(szItem)
	local szICode = lib:Split(szItem, ",");
	local n = getn(szICode);
	if (n ~= 1) then
	if (n < 3) then Talk(1, "", format("Sai Item Code. Thi誹 trng y猽 c莡 <color=yellow>%s<color>",n)); return end
	if (n > 3) then Talk(1, "", format("Sai Item Code. Qu� nhi襲 trng d� li謚 <color=yellow>%s<color>",n)); return end
	local itid = tonumber(szICode[1]); 
	local itlv = tonumber(szICode[2]); 
	local itnum = tonumber(szICode[3]); 
	if (itlv < 0) then Talk(1, "", format("C蕄  man  kh玭g 頲 th蕄 qu� <color=yellow>%s<color>",itlv)); return end
	if (itlv > 10) then Talk(1, "", format("Ch� h� tr� n c蕄 10. Hi謓 t筰 nh藀 v祇 <color=yellow>%s<color>",itlv)); return end
	if (itmagic == nil) then itmagic=0; end
		for i =1, itnum do
			AddItem(6,1,itid,itlv,0,0,0);
		end
	end
end

function reloadngay()
		local nlink = tbLinkFileLua[1].szFileLua
		for i = 1 , getn(nlink) do
			local ReloadScript = LoadScript(""..nlink[i][1].."");
			if (FALSE(ReloadScript )) then
			    Msg2Player("Xu蕋 hi謓 l鏸, kh玭g th� Reload!<enter><color=yellow>"..nlink[i][1].."");
			else
			    Msg2Player("<color=green>Reload th祅h c玭g Script : <color><enter><color=blue>"..nlink[i][1].."");
			end
		end
end
function NhapDuongDan(Link)
        local ReloadScript = LoadScript(Link);
        if (FALSE(ReloadScript )) then
            Msg2Player("Xu蕋 hi謓 l鏸, kh玭g th� Reload!<enter><color=yellow>"..Link.."");
        else
            Msg2Player("<color=green>Reload th祅h c玭g Script<color><enter><color=blue>"..Link.."");
        end
end
function ReLoadScript()
    return AskClientForString("NhapDuongDan", "", 1, 500, "<#>Nh藀 阯g d蒼")
end 
function change_mauchu ()
	local aryDescribe = {
		"<dec><npc>Чi hi謕 mu鑞 i tr筺g th竔 n祇 ?",
	};
	for i = 1, getn(tbMauChu) do
		tinsert(aryDescribe,  tbMauChu[i][1]..format("/#set_mauchu(%d)", tbMauChu[i][2]));
	end
	tinsert(aryDescribe, "L竧 n鱝 quay l筰 /no");
	CreateTaskSay(aryDescribe);
end

function set_mauchu(num)
	SetCurCamp(num)
	SetCamp(num)
end

---------- Reset point------------------
function chose_reset_type()
    local nW,nX,nY = GetWorldPos()
	local szIP = GetIP()
    local tbSay = {format(TITLEDIALOG, GetName(), GetAccount() ,nW,nX,nY,szIP)}
    tinsert(tbSay, "T葃 ti襪 n╪g/DoClearPropCore") 
	tinsert(tbSay, "T葃 k� n╪g/DoClearSkillCore") 
	tinsert(tbSay, "C閚g 觤 Nhanh/add_prop");
	tinsert(tbSay, "Quay l筰/main");
    CreateTaskSay(tbSay)
end