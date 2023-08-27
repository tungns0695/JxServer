Include("\\script\\lib\\string.lua");
Include("\\script\\dailogsys\\g_dialog.lua")
Include("\\script\\lib\\compose_jinnang.lua")
--Include("\\script\\global\\anhhau\\taskctrl.lua");
local banhthuong_tbFormulaList = 
{
	[1] =
	{
		szFailMsg = "Ch� d�ng m�y nguy�n li�u n�y th� kh�ng th� ��i ph�n th��ng <color=yellow>B�nh Ch�ng<color> ���c, ��i hi�p ph�i t�m �� nguy�n li�u �i ��!",
		nFreeItemCellLimit = 1,
		tbMaterial =
		{
			{szName = "B�t ", tbProp={6, 1, 1503, 1, 0, 0}, nCount = 30},
			{szName = "�u�ng ", tbProp={6, 1, 1504, 1, 0, 0}, nCount = 30},
			{szName = "Tr�ng ", tbProp={6, 1, 1505, 1, 0, 0}, nCount = 30},
			{szName = "��u Xanh", tbProp={6, 1, 1506, 1, 0, 0}, nCount = 30},
			{szName = "H�t Sen ", tbProp={6, 1, 1507, 1, 0, 0}, nCount = 20},
		},
		tbProduct = 
		{
		szName = "B�nh Trung Thu Ra L� !",
		[1] =
		{ 
		{szName="B�nh Trung Thu", 	tbProp={6, 1, random(1510,1511), 1, 0, 0},nCount = 10,nRate = 100},
			},
		},
},
}
local banhthuong10_tbFormulaList = 
{
	[1] =
	{
		szFailMsg = "Ch� d�ng m�y nguy�n li�u n�y th� kh�ng th� ��i ph�n th��ng <color=yellow>B�nh Ch�ng<color> ���c, ��i hi�p ph�i t�m �� nguy�n li�u �i ��!",
		nFreeItemCellLimit = 1,
		tbMaterial =
		{
			{szName = "B�t", tbProp={6, 1, 1503, 1, 0, 0}, nCount = 150},
			{szName = "�u�ng", tbProp={6, 1, 1504, 1, 0, 0}, nCount = 150},
			{szName = "Tr�ng", tbProp={6, 1, 1505, 1, 0, 0}, nCount = 150},
			{szName = "��u Xanh", tbProp={6, 1, 1506, 1, 0, 0}, nCount = 150},
			{szName = "H�t Sen", tbProp={6, 1, 1507, 1, 0, 0}, nCount = 100},
		},
		tbProduct = 
		{
		szName = "B�nh Trung Thu Ra L� !",
		[1] =
		{ 
		{szName="B�nh Trung Thu", 	tbProp={6, 1, random(1510,1511), 1, 0, 0},nCount = 50,nRate = 100},
			},
		},
},
}
local banhdacbiet_tbFormulaList = 
{
	[1] =
	{
		szFailMsg = "Ch� d�ng m�y nguy�n li�u n�y th� kh�ng th� ��i ph�n th��ng <color=yellow>B�nh Ch�ng<color> ���c, ��i hi�p ph�i t�m �� nguy�n li�u �i ��!",
		nFreeItemCellLimit = 1,
		tbMaterial =
		{
			{szName = "B�t", tbProp={6, 1, 1503, 1, 0, 0}, nCount = 30},
			{szName = "�u�ng", tbProp={6, 1, 1504, 1, 0, 0}, nCount = 30},
			{szName = "Tr�ng", tbProp={6, 1, 1505, 1, 0, 0}, nCount = 30},
			{szName = "��u Xanh", tbProp={6, 1, 1506, 1, 0, 0}, nCount = 30},
			{szName = "H�t Sen", tbProp={6, 1, 1507, 1, 0, 0}, nCount = 20},
			{szName = "Th�t G�", tbProp={6, 1, 1508, 1, 0, 0}, nCount = 10},
			{szName = "Th�t Heo", tbProp={6, 1, 1509, 1, 0, 0}, nCount = 10},
		},
		tbProduct = 
		{
		szName = "B�nh Trung Thu Ra L� !",
		[1] =
		{ 
		{szName="B�nh Trung Thu ��c bi�t", 	tbProp={6, 1, random(1512,1512), 1, 0, 0},nCount = 10,nRate = 100},
			},
		},
},
}
local banhdacbiet10_tbFormulaList = 
{
	[1] =
	{
		szFailMsg = "Ch� d�ng m�y nguy�n li�u n�y th� kh�ng th� ��i ph�n th��ng <color=yellow>B�nh Ch�ng<color> ���c, ��i hi�p ph�i t�m �� nguy�n li�u �i ��!",
		nFreeItemCellLimit = 1,
		tbMaterial =
		{
			{szName = "B�t", tbProp={6, 1, 1503, 1, 0, 0}, nCount = 150},
			{szName = "�u�ng", tbProp={6, 1, 1504, 1, 0, 0}, nCount = 150},
			{szName = "Tr�ng ", tbProp={6, 1, 1505, 1, 0, 0}, nCount = 150},
			{szName = "��u Xanh", tbProp={6, 1, 1506, 1, 0, 0}, nCount = 150},
			{szName = "H�t Sen", tbProp={6, 1, 1507, 1, 0, 0}, nCount = 100},
			{szName = "Th�t G�", tbProp={6, 1, 1508, 1, 0, 0}, nCount = 50},
			{szName = "Th�t Heo", tbProp={6, 1, 1509, 1, 0, 0}, nCount = 50},
		},
		tbProduct = 
		{
		szName = "B�nh Trung Thu Ra L� !",
		[1] =
		{ 
		{szName="B�nh Trung Thu ��c bi�t", 	tbProp={6, 1, random(1512,1512), 1, 0, 0},nCount = 50,nRate = 100},
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
		Say("��i hi�p v�n ch�a �� c�p 50 n�n kh�ng th� tham gia ho�t ��ng n�y.", 0);
		return 1;
	end
	local tb = {};
	tinsert(tb,"<dec>Ho�t ��ng Trung Thu di�n ra  <color=yellow>Do Th�ng Duy gaming N� H�ng c�c v� nh�n s� v� l�m khi h�nh t�u giang h� s� ���c �n ng�p m�t S� Ki�n n�y<color>!!!");
	tinsert(tb,"10 B�nh Trung Thu Lo�i Th��ng/#trungthu_banhthuong_dialogmain()");
	tinsert(tb,"50 B�nh Trung Thu Lo�i Th��ng/#trungthu_banhthuong10_dialogmain()");
	tinsert(tb,"10 B�nh Trung Thu Lo�i ��c Bi�t/#trungthu_banhdacbiet_dialogmain()");
	tinsert(tb,"50 B�nh Trung Thu Lo�i ��c Bi�t/#trungthu_banhdacbiet10_dialogmain()");
	tinsert(tb,"�� ta suy ngh� th�m/Cancel");
	CreateTaskSay(tb);
end
---------------------------------------10 c�i-------------------------------
function trungthu_banhthuong_dialogmain(tbFormulaList, nItemIndex, szDescLink)
	tbFormulaList = tbFormulaList or %banhthuong_tbFormulaList
	trungthu_banhthuong_MakeComposeClas(tbFormulaList)
	nItemIndex = nItemIndex or -1
	szDescLink = szDescLink or " "
	
	local tbSay = trungthu_banhthuong_Compose:MakeOptByProductName("Ta mu�n l�m b�nh: ", nItemIndex, szDescLink);
	tinsert(tbSay , 1, "<dec>"..szDescLink.."N�u nh� t�m �� c�c lo�i nguy�n li�u  th� s� ���c 1 chi�c b�nh ngon l�nh.");
	tinsert(tbSay , getn(tbSay)+1, "K�t th�c ��i tho�i/OnCancel");
	CreateTaskSay(tbSay);
end

function trungthu_banhthuong_MakeComposeClas(tbFormulaList)
	if  type(trungthu_banhthuong_Compose) ~= "table" then
		local tbComposeList = tbComposeListForJinNang:new("trungthu_banhthuong_Compose", tbFormulaList)
	end
end
-----------------------------------------------------------------------------------50 c�i-------------------------------
function trungthu_banhthuong10_dialogmain(tbFormulaList, nItemIndex, szDescLink)
	tbFormulaList = tbFormulaList or %banhthuong10_tbFormulaList
	trungthu_banhthuong10_MakeComposeClas(tbFormulaList)
	nItemIndex = nItemIndex or -1
	szDescLink = szDescLink or " "
	
	local tbSay = trungthu_banhthuong10_Compose:MakeOptByProductName("Ta mu�n l�m b�nh: ", nItemIndex, szDescLink);
	tinsert(tbSay , 1, "<dec>"..szDescLink.."N�u nh� t�m �� c�c lo�i nguy�n li�u  th� s� ���c 1 chi�c b�nh ngon l�nh.");
	tinsert(tbSay , getn(tbSay)+1, "K�t th�c ��i tho�i/OnCancel");
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
	
	local tbSay = trungthu_banhdacbiet_Compose:MakeOptByProductName("Ta mu�n l�m b�nh: ", nItemIndex, szDescLink);
	tinsert(tbSay , 1, "<dec>"..szDescLink.."N�u nh� t�m �� c�c lo�i nguy�n li�u  th� s� ���c 1 chi�c b�nh ngon l�nh.");
	tinsert(tbSay , getn(tbSay)+1, "K�t th�c ��i tho�i/OnCancel");
	CreateTaskSay(tbSay);
end

function trungthu_banhdacbiet_MakeComposeClas(tbFormulaList)
	if  type(trungthu_banhdacbiet_Compose) ~= "table" then
		local tbComposeList = tbComposeListForJinNang:new("trungthu_banhdacbiet_Compose", tbFormulaList)
	end
end
-----------------------------------------------------------------------------------50 c�i-------------------------------
function trungthu_banhdacbiet10_dialogmain(tbFormulaList, nItemIndex, szDescLink)
	tbFormulaList = tbFormulaList or %banhdacbiet10_tbFormulaList
	trungthu_banhdacbiet10_MakeComposeClas(tbFormulaList)
	nItemIndex = nItemIndex or -1
	szDescLink = szDescLink or " "
	
	local tbSay = trungthu_banhdacbiet10_Compose:MakeOptByProductName("Ta mu�n l�m b�nh: ", nItemIndex, szDescLink);
	tinsert(tbSay , 1, "<dec>"..szDescLink.."N�u nh� t�m �� c�c lo�i nguy�n li�u  th� s� ���c 1 chi�c b�nh ngon l�nh.");
	tinsert(tbSay , getn(tbSay)+1, "K�t th�c ��i tho�i/OnCancel");
	CreateTaskSay(tbSay);
end

function trungthu_banhdacbiet10_MakeComposeClas(tbFormulaList)
	if  type(trungthu_banhdacbiet10_Compose) ~= "table" then
		local tbComposeList = tbComposeListForJinNang:new("trungthu_banhdacbiet10_Compose", tbFormulaList)
	end
end
------------------------------------------------------------------------------------------------------------