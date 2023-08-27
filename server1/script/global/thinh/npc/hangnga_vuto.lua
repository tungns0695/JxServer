Include("\\script\\lib\\string.lua");
Include("\\script\\dailogsys\\g_dialog.lua")
Include("\\script\\lib\\compose_jinnang.lua")
--Include("\\script\\global\\anhhau\\taskctrl.lua");
local banhthuong_tbFormulaList = 
{
	[1] =
	{
		szFailMsg = "ChØ dïng mÊy nguyªn liÖu nµy th× kh«ng thÓ ®æi phÇn th­ëng <color=yellow>B¸nh Ch­ng<color> ®­îc, ®¹i hiÖp ph¶i t×m ®ñ nguyªn liÖu ®i ®·!",
		nFreeItemCellLimit = 1,
		tbMaterial =
		{
			{szName = "Bét ", tbProp={6, 1, 1503, 1, 0, 0}, nCount = 30},
			{szName = "§ußng ", tbProp={6, 1, 1504, 1, 0, 0}, nCount = 30},
			{szName = "Trøng ", tbProp={6, 1, 1505, 1, 0, 0}, nCount = 30},
			{szName = "§Ëu Xanh", tbProp={6, 1, 1506, 1, 0, 0}, nCount = 30},
			{szName = "H¹t Sen ", tbProp={6, 1, 1507, 1, 0, 0}, nCount = 20},
		},
		tbProduct = 
		{
		szName = "B¸nh Trung Thu Ra Lß !",
		[1] =
		{ 
		{szName="B¸nh Trung Thu", 	tbProp={6, 1, random(1510,1511), 1, 0, 0},nCount = 10,nRate = 100},
			},
		},
},
}
local banhthuong10_tbFormulaList = 
{
	[1] =
	{
		szFailMsg = "ChØ dïng mÊy nguyªn liÖu nµy th× kh«ng thÓ ®æi phÇn th­ëng <color=yellow>B¸nh Ch­ng<color> ®­îc, ®¹i hiÖp ph¶i t×m ®ñ nguyªn liÖu ®i ®·!",
		nFreeItemCellLimit = 1,
		tbMaterial =
		{
			{szName = "Bét", tbProp={6, 1, 1503, 1, 0, 0}, nCount = 150},
			{szName = "§ußng", tbProp={6, 1, 1504, 1, 0, 0}, nCount = 150},
			{szName = "Trøng", tbProp={6, 1, 1505, 1, 0, 0}, nCount = 150},
			{szName = "§Ëu Xanh", tbProp={6, 1, 1506, 1, 0, 0}, nCount = 150},
			{szName = "H¹t Sen", tbProp={6, 1, 1507, 1, 0, 0}, nCount = 100},
		},
		tbProduct = 
		{
		szName = "B¸nh Trung Thu Ra Lß !",
		[1] =
		{ 
		{szName="B¸nh Trung Thu", 	tbProp={6, 1, random(1510,1511), 1, 0, 0},nCount = 50,nRate = 100},
			},
		},
},
}
local banhdacbiet_tbFormulaList = 
{
	[1] =
	{
		szFailMsg = "ChØ dïng mÊy nguyªn liÖu nµy th× kh«ng thÓ ®æi phÇn th­ëng <color=yellow>B¸nh Ch­ng<color> ®­îc, ®¹i hiÖp ph¶i t×m ®ñ nguyªn liÖu ®i ®·!",
		nFreeItemCellLimit = 1,
		tbMaterial =
		{
			{szName = "Bét", tbProp={6, 1, 1503, 1, 0, 0}, nCount = 30},
			{szName = "§ußng", tbProp={6, 1, 1504, 1, 0, 0}, nCount = 30},
			{szName = "Trøng", tbProp={6, 1, 1505, 1, 0, 0}, nCount = 30},
			{szName = "§Ëu Xanh", tbProp={6, 1, 1506, 1, 0, 0}, nCount = 30},
			{szName = "H¹t Sen", tbProp={6, 1, 1507, 1, 0, 0}, nCount = 20},
			{szName = "ThÞt Gµ", tbProp={6, 1, 1508, 1, 0, 0}, nCount = 10},
			{szName = "ThÞt Heo", tbProp={6, 1, 1509, 1, 0, 0}, nCount = 10},
		},
		tbProduct = 
		{
		szName = "B¸nh Trung Thu Ra Lß !",
		[1] =
		{ 
		{szName="B¸nh Trung Thu §Æc biÖt", 	tbProp={6, 1, random(1512,1512), 1, 0, 0},nCount = 10,nRate = 100},
			},
		},
},
}
local banhdacbiet10_tbFormulaList = 
{
	[1] =
	{
		szFailMsg = "ChØ dïng mÊy nguyªn liÖu nµy th× kh«ng thÓ ®æi phÇn th­ëng <color=yellow>B¸nh Ch­ng<color> ®­îc, ®¹i hiÖp ph¶i t×m ®ñ nguyªn liÖu ®i ®·!",
		nFreeItemCellLimit = 1,
		tbMaterial =
		{
			{szName = "Bét", tbProp={6, 1, 1503, 1, 0, 0}, nCount = 150},
			{szName = "§ußng", tbProp={6, 1, 1504, 1, 0, 0}, nCount = 150},
			{szName = "Trøng ", tbProp={6, 1, 1505, 1, 0, 0}, nCount = 150},
			{szName = "§Ëu Xanh", tbProp={6, 1, 1506, 1, 0, 0}, nCount = 150},
			{szName = "H¹t Sen", tbProp={6, 1, 1507, 1, 0, 0}, nCount = 100},
			{szName = "ThÞt Gµ", tbProp={6, 1, 1508, 1, 0, 0}, nCount = 50},
			{szName = "ThÞt Heo", tbProp={6, 1, 1509, 1, 0, 0}, nCount = 50},
		},
		tbProduct = 
		{
		szName = "B¸nh Trung Thu Ra Lß !",
		[1] =
		{ 
		{szName="B¸nh Trung Thu §Æc biÖt", 	tbProp={6, 1, random(1512,1512), 1, 0, 0},nCount = 50,nRate = 100},
			},
		},
},
}
function main()
dofile("script/global/anhhau/hangnga_doibanh.lua")
	epbanhtrungthu_main();
end
function epbanhtrungthu_main()
	if (GetLevel() < 50) then
		Say("§¹i hiÖp vÉn ch­a ®ñ cÊp 50 nªn kh«ng thÓ tham gia ho¹t ®éng nµy.", 0);
		return 1;
	end
	local tb = {};
	tinsert(tb,"<dec>Ho¹t ®éng Trung Thu diÔn ra  <color=yellow>Do Th»ng Duy gaming Nã Høng c¸c vÞ nh©n sÜ vâ l©m khi hµnh tÈu giang hå sÏ ®­îc ¨n ngÆp mÆt Sù KiÖn nµy<color>!!!");
	tinsert(tb,"10 B¸nh Trung Thu Lo¹i Th­êng/#trungthu_banhthuong_dialogmain()");
	tinsert(tb,"50 B¸nh Trung Thu Lo¹i Th­êng/#trungthu_banhthuong10_dialogmain()");
	tinsert(tb,"10 B¸nh Trung Thu Lo¹i §Æc BiÖt/#trungthu_banhdacbiet_dialogmain()");
	tinsert(tb,"50 B¸nh Trung Thu Lo¹i §Æc BiÖt/#trungthu_banhdacbiet10_dialogmain()");
	tinsert(tb,"§Ó ta suy nghÜ thªm/Cancel");
	CreateTaskSay(tb);
end
---------------------------------------10 c¸i-------------------------------
function trungthu_banhthuong_dialogmain(tbFormulaList, nItemIndex, szDescLink)
	tbFormulaList = tbFormulaList or %banhthuong_tbFormulaList
	trungthu_banhthuong_MakeComposeClas(tbFormulaList)
	nItemIndex = nItemIndex or -1
	szDescLink = szDescLink or " "
	
	local tbSay = trungthu_banhthuong_Compose:MakeOptByProductName("Ta muèn lµm b¸nh: ", nItemIndex, szDescLink);
	tinsert(tbSay , 1, "<dec>"..szDescLink.."NÕu nh­ t×m ®ñ c¸c lo¹i nguyªn liÖu  th× sÏ ®­îc 1 chiÕc b¸nh ngon lµnh.");
	tinsert(tbSay , getn(tbSay)+1, "KÕt thóc ®èi tho¹i/OnCancel");
	CreateTaskSay(tbSay);
end

function trungthu_banhthuong_MakeComposeClas(tbFormulaList)
	if  type(trungthu_banhthuong_Compose) ~= "table" then
		local tbComposeList = tbComposeListForJinNang:new("trungthu_banhthuong_Compose", tbFormulaList)
	end
end
-----------------------------------------------------------------------------------50 c¸i-------------------------------
function trungthu_banhthuong10_dialogmain(tbFormulaList, nItemIndex, szDescLink)
	tbFormulaList = tbFormulaList or %banhthuong10_tbFormulaList
	trungthu_banhthuong10_MakeComposeClas(tbFormulaList)
	nItemIndex = nItemIndex or -1
	szDescLink = szDescLink or " "
	
	local tbSay = trungthu_banhthuong10_Compose:MakeOptByProductName("Ta muèn lµm b¸nh: ", nItemIndex, szDescLink);
	tinsert(tbSay , 1, "<dec>"..szDescLink.."NÕu nh­ t×m ®ñ c¸c lo¹i nguyªn liÖu  th× sÏ ®­îc 1 chiÕc b¸nh ngon lµnh.");
	tinsert(tbSay , getn(tbSay)+1, "KÕt thóc ®èi tho¹i/OnCancel");
	CreateTaskSay(tbSay);
end

function trungthu_banhthuong10_MakeComposeClas(tbFormulaList)
	if  type(trungthu_banhthuong10_Compose) ~= "table" then
		local tbComposeList = tbComposeListForJinNang:new("trungthu_banhthuong10_Compose", tbFormulaList)
	end
end
----------------------------------------------------------------------------------------------dacbiet--------------------------------------------------------------------------------------------------------------
function trungthu_banhdacbiet_dialogmain(tbFormulaList, nItemIndex, szDescLink)
	tbFormulaList = tbFormulaList or %banhdacbiet_tbFormulaList
	trungthu_banhdacbiet_MakeComposeClas(tbFormulaList)
	nItemIndex = nItemIndex or -1
	szDescLink = szDescLink or " "
	
	local tbSay = trungthu_banhdacbiet_Compose:MakeOptByProductName("Ta muèn lµm b¸nh: ", nItemIndex, szDescLink);
	tinsert(tbSay , 1, "<dec>"..szDescLink.."NÕu nh­ t×m ®ñ c¸c lo¹i nguyªn liÖu  th× sÏ ®­îc 1 chiÕc b¸nh ngon lµnh.");
	tinsert(tbSay , getn(tbSay)+1, "KÕt thóc ®èi tho¹i/OnCancel");
	CreateTaskSay(tbSay);
end

function trungthu_banhdacbiet_MakeComposeClas(tbFormulaList)
	if  type(trungthu_banhdacbiet_Compose) ~= "table" then
		local tbComposeList = tbComposeListForJinNang:new("trungthu_banhdacbiet_Compose", tbFormulaList)
	end
end
-----------------------------------------------------------------------------------50 c¸i-------------------------------
function trungthu_banhdacbiet10_dialogmain(tbFormulaList, nItemIndex, szDescLink)
	tbFormulaList = tbFormulaList or %banhdacbiet10_tbFormulaList
	trungthu_banhdacbiet10_MakeComposeClas(tbFormulaList)
	nItemIndex = nItemIndex or -1
	szDescLink = szDescLink or " "
	
	local tbSay = trungthu_banhdacbiet10_Compose:MakeOptByProductName("Ta muèn lµm b¸nh: ", nItemIndex, szDescLink);
	tinsert(tbSay , 1, "<dec>"..szDescLink.."NÕu nh­ t×m ®ñ c¸c lo¹i nguyªn liÖu  th× sÏ ®­îc 1 chiÕc b¸nh ngon lµnh.");
	tinsert(tbSay , getn(tbSay)+1, "KÕt thóc ®èi tho¹i/OnCancel");
	CreateTaskSay(tbSay);
end

function trungthu_banhdacbiet10_MakeComposeClas(tbFormulaList)
	if  type(trungthu_banhdacbiet10_Compose) ~= "table" then
		local tbComposeList = tbComposeListForJinNang:new("trungthu_banhdacbiet10_Compose", tbFormulaList)
	end
end
------------------------------------------------------------------------------------------------------------