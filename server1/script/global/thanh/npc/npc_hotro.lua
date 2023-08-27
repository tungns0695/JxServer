IncludeLib("SETTING")
IncludeLib("ITEM");
IncludeLib("FILESYS")
Include("\\script\\lib\\player.lua")
Include("\\script\\dailogsys\\dailogsay.lua")
Include("\\script\\activitysys\\functionlib.lua")
Include("\\script\\dailogsys\\g_dialog.lua")
Include("\\script\\vng_event\\tanthu\\giveskill60.lua")
------------------------------------------------------------------------------------------------------------

function main()
	dofile("script/global/thanh/npc/npc_hotro.lua")
	--dialog_hotro_main()
	support() 
end


function support() -- Include("\\script\\vng_event\\tanthu\\giveskill60.lua")
	local tbOpt = {}
	tinsert(tbOpt, {"Nh�n V�t Th�n H�nh Ph�, Th� ��a Ph� 7 ng�y", tbGiveSkill60.GetItem, {tbGiveSkill60}})
	tinsert(tbOpt, {"Nh�n K� N�ng sau Khi Gia Nh�p M�n Ph�i", tbGiveSkill60.GetSkill, {tbGiveSkill60}})
	tinsert(tbOpt, {"Nh�n v�ng h� tr� t�n th�", tbGiveSkill60.GetSkillSupport, {tbGiveSkill60}})
	tinsert(tbOpt, {"Nh�n trang b� Kim Phong", tbGiveSkill60.GetKimPhong, {tbGiveSkill60}})
	tinsert(tbOpt, {"Nh�n B� k�p 90 t� ch�n theo ph�i", tbGiveSkill60.GetBK90, {tbGiveSkill60}})
	--tinsert(tbOpt, {"Nh�n K� N�ng C�p 90", tbGiveSkill60.GetSkill90, {tbGiveSkill60}})
	tinsert(tbOpt, {"T�y T�y",clear_attibute_point})
	tinsert(tbOpt, {"C�ng �i�m nhanh",add_prop})
	tinsert(tbOpt, {"H�y b� "})
	CreateNewSayEx("<npc>M�i ��i hi�p ch�n", tbOpt)
end

function dialog_hotro_main()
	local szTitle = "Xin ch�o ! ��i hi�p h�c mu�n gi�p �� g�?"
	local tbOpt=
	{
	{"K�t th�c ��i tho�i"},
	}
	CreateNewSayEx("<npc>"..szTitle.."", tbOpt)
	--Say(szTitle, getn(tbOpt), tbOpt)
end



