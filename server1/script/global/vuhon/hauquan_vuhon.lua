function main()
	local szTitle = "Xin ch�o <color=red>"..GetName().."<color> ! Ng��i c� mu�n gia nh�p <color=fire>V� H�n ���ng<color> kh�ng?"
	local tbOpt=
	{
	"V� ph�i/go_vuhon",
	"Gia nh�p V� H�n/join_vuhon",
	"K�t th�c ��i tho�i./no",
	}
	Say(szTitle, getn(tbOpt), tbOpt)
end

function go_vuhon()
	Msg2Player("Ng�i y�n, ch�ng ta ��n <color=yellow>V� H�n ���ng<color>")
	NewWorld(1042, 1625, 3130)
end

function join_vuhon()
	local FactionNumber = GetLastFactionNumber()
	local nSeries = GetSeries()
	if nSeries ~= 3 then
		Talk(1, "", "Ch� nh�n v�t h� H�a m�i c� th� gia nh�p V� H�n ���ng")
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
	local szTitle = "<color=red>"..GetName().."<color> ng��i c� ch�c ch�n mu�n gia nh�p ph�i <color=fire>V� H�n<color> b�n ta kh�ng?"
	local tbOpt ={
			"X�c nh�n!/join_vuhon_sure",
			"Kh�ng./no",
		}
	Say(szTitle, getn(tbOpt), tbOpt)
end

-----------------------------------------------------------------------------------------------------------
function join_vuhon_sure()
	SetFaction("wuhun");
	SetCamp(1);
	SetCurCamp(1);
	SetRank(90);
	SetLastFactionNumber(11);
	SetTask(4406,10*256);
	add_wh(GetLevel())
	Msg2Faction("%s t� n�y gia nh�p V� H�n, ��n b�i ki�n c�c v� s� huynh, xin c�c v� chi�u c�!",GetName())
	Msg2Player("Ch�c M�ng Ng��i �� Gia Nh�p Ph�i V� H�n ���c H�u Qu�n")
	Talk(1, "KickOutSelf", "Ng��i �� gia nh�p th�nh c�ng ph�i <color=fire>V� H�n<color>")
end