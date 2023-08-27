Include("\\script\\task\\newtask\\newtask_head.lua")
Include("\\script\\task\\newtask\\education\\knowmagic.lua")
Include("\\script\\global\\skills_table.lua")
Include("\\script\\global\\map_helper.lua")
Include( "\\script\\missions\\freshman_match\\head.lua" )
function main()
	local szTitle = "Xin ch�o <color=red>"..GetName().."<color> ! B�t k� ng��i thu�c ng� h�nh n�o, ng��i c� mu�n gia nh�p <color=fire>Ti�u Dao<color> hay kh�ng?"
	local tbOpt=
	{
		"��n ph�i/go_tieudao",
		"Gia nh�p Ti�u Dao v� l�m nhi�m v� m�n ph�i/TieuDaoPhai",
		"Gia nh�p Ti�u Dao v� h�c ��n max skill 180/join_tieudao",
		"K�t th�c ��i tho�i./no",
	}
	Say(szTitle, getn(tbOpt), tbOpt)
end

function go_tieudao()
	Msg2Player("Ng�i y�n, ch�ng ta ��n <color=yellow>Ti�u Dao ph�i<color>")
	NewWorld(1046, 1641, 3288)
end


function TieuDaoPhai()
	local FactionNumber = GetLastFactionNumber()
	local nSeries = GetSeries()
	if nSeries ~= 4 then
		Talk(1, "", "Ch� c� nh�n v�t h� Th� m�i c� th� gia nh�p Ti�u Dao")
		return
	end
	if FactionNumber >= 0 then
		Talk(1, "", "Ng��i �� gia nh�p m�n ph�i kh�c r�i.")
		return
	end
	if GetLevel()<10 then
		Talk(1, "", "H�y t� luy�n t�p th�m ��n c�p 10 r�i quay l�i ��y.")
		return
	end
	SetFaction("xiaoyao");
	SetCamp(3);
	SetCurCamp(3);
	SetRank(98);
	nt_setTask(137,71)
	SetTask(4464,10*256);
	SetLastFactionNumber(12);
	add_xy(GetLevel())
	Msg2Faction("%s t� h�m nay v�o ph�i Ti�u Dao, nay ��n b�i ki�n c�c v� s� huynh, mong h�y chi�u c�!",GetName())
	---AddItem(0,0,7,1,0,0) AddItem(0,0,8,1,0,0)
	AddNote("Nh�p ph�i Ti�u Dao nh�n danh hi�u Ti�n ��o C� S�")
	Msg2Player("Ch�c m�ng ng��i �� gia nh�p ph�i Ti�u Dao, nh�n danh hi�u Ti�n ��o C� S�")
	Talk(1, "KickOutSelf", "Ng��i �� gia nh�p th�nh c�ng ph�i <color=fire>Ti�u Dao<color>")
end

function join_tieudao()
	local FactionNumber = GetLastFactionNumber()
	if FactionNumber >= 0 then
		Talk(1, "", "Ng��i �� gia nh�p m�n ph�i kh�c r�i.")
		return
	end
	local szTitle = "<color=red>"..GetName().."<color> ng��i c� ch�c ch�n mu�n gia nh�p ph�i <color=fire>Ti�u Dao<color> hay kh�ng?"
	local tbOpt ={
			"X�c nh�n!/join_tieudao_sure",
			"Kh�ng./no",
		}
	Say(szTitle, getn(tbOpt), tbOpt)
end

-----------------------------------------------------------------------------------------------------------
function join_tieudao_sure()
	SetFaction("xiaoyao");
	SetCamp(3);
	SetCurCamp(4);
	SetRank(89);
	SetSeries(4);
	SetLastFactionNumber(12);
                 AddMagic(1904,1)-- danh thuong
	AddMagic(1881,0)-- level 10
	AddMagic(1905,0)-- level 10

	AddMagic(1882,0)-- level 20
	AddMagic(1906,0)-- level 20

	AddMagic(1883,0)-- level 30

	AddMagic(1885,0)-- level 40
	AddMagic(1907,0)-- level 40

	AddMagic(1887,0)-- level 50
	AddMagic(1909,0)-- level 50

	AddMagic(1888,0)-- level 60
	AddMagic(1889,0)-- level 60
                 AddMagic(1890,0)-- level 60

	AddMagic(1891,20)---- level 90
	AddMagic(1910,20)---- level 90

	AddMagic(1894,20)---- level 120

	AddMagic(1896,20)---- level 150
	AddMagic(1911,20)---- level 150

	AddMagic(1901,20)---- level 180
	Talk(1, "KickOutSelf", "Ng��i �� gia nh�p th�nh c�ng ph�i <color=fire>Ti�u Dao<color>")
end