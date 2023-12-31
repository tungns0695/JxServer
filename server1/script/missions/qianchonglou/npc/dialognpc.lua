Include("\\script\\missions\\qianchonglou\\rule.lua")
Include("\\script\\missions\\qianchonglou\\challenger.lua")
Include("\\script\\dailogsys\\dailogsay.lua")
IncludeLib("SETTING")
function signup()
	if tbPlayerHandle:CheckDate() ~= 1 then
		local nAwardPoint = tbPlayerHandle:GetAwardPoint(nPoint) -- 奖励分获取量
		local nAwardPointExchange = tbPlayerHandle:GetAwardPointExchange() -- 已兑换的奖励分
		local nAwardPointAvail = tbPlayerHandle:GetAwardPointMax() - nAwardPointExchange -- 剩余可兑换的奖励分
		if nAwardPoint > 0 and nAwardPointAvail > 0 then
			return Talk(1, "", "Ngi ph秈 nh薾 ph莕 thng trc  m韎 ti誴 t鬰 tham gia 頲.")
		end
	end
	if ST_IsTransLife() ~= 1  and GetLevel() < 120 then
		return Talk(1, "", format("%d c蕄 tr� xu鑞g kh玭g th� tham gia ho箃 ng n祔", 120))
	end
	local pDungeonType = DungeonType["endless tower"]
	local pChallenger = tbChallenger:new()
	pChallenger:Update()
	if pChallenger:GetPlayTime() <= 0 then
		return Talk(1, "", "Th阨 gian h玬 nay c馻 c竎 h�  s� d鬾g h誸")
	end
	if pDungeonType then
		local pDungeon = pDungeonType:new_dungeon(pDungeonType.TEMPLATE_MAP_ID, {pChallenger})
		if pDungeon then
			pChallenger:Update()
			local nMapId, nX, nY = pDungeon:GetTowerPos()
			NewWorld(nMapId, nX, nY)
		else
			print("fail")
		end
	end
end

function give_award()
	local nAwardPoint = tbPlayerHandle:GetAwardPoint(nPoint) -- 奖励分获取量
	local nAwardPointExchange = tbPlayerHandle:GetAwardPointExchange() -- 已兑换的奖励分
	local nAwardPointAvail = tbPlayerHandle:GetAwardPointMax() - nAwardPointExchange -- 剩余可兑换的奖励分
	if nAwardPoint <= 0 or (nAwardPointAvail <=0 and tbPlayerHandle:CheckDate() ~= 1)then
		return Talk(1, "","觤 ph莕 thng c馻 c竎 h� kh玭g   s� d鬾g ph莕 thng n祔")
	elseif nAwardPointAvail <=0 then
		return Talk(1, "","觤 i ph莕 thng h玬 nay c馻 c竎 h�  t n gi韎 h筺.")
	end
	if nAwardPointAvail > nAwardPoint then
		nAwardPointAvail = nAwardPoint
	end
	Msg2Player(format("Ngi  nh薾 %d ph莕 thng c馻 甶觤 ph莕 thng.", nAwardPointAvail))
	tbPlayerHandle:SetAwardPoint(nAwardPoint-nAwardPointAvail)
	tbPlayerHandle:AddAwardPointExchange(nAwardPointAvail)
end

function dialog()
	local szTitle = "Sau khi m� ph� b秐, m鏸 ngi ch琲 s� nh薾 頲 s� 甶觤 c� s� nh蕋 nh, m鏸 l莕 ph竧 ra c玭g k輈h s� ti猽 hao 甶觤 c� s�. C竎 b筼 n� kh玭g gi鑞g nhau s� ti猽 hao 甶觤 c� s� kh玭g gi鑞g nhau, c� th� th玭g qua vi謈 nh蕁 chu閠 v祇 b猲 ph秈 b猲 tr竔 tr猲 m祅 h譶h  i ng c蕄 b筼 n�. Ъng c蕄 b筼 n� c祅g cao, th� t� l� nh tr髇g qu竔 v藅 c祅g l韓. Sau khi nh tr髇g qu竔 v藅 s� nh薾 頲 ph莕 thng, khi 甶觤 c� s� b� ti猽 hao h誸, th� c騨g c� th� d飊g 甶觤 ph莕 thng  i b筼 n�. C� m鏸 l莕 nh tr髇g s� lng qu竔 v藅 nh蕋 nh, th� c� th� nh薾 頲 lng b筼 n� tng i l韓, c� th� nh tr髇g t蕋 c� ch nh﹏ trong ph筸 vi xung quanh."
	local tbOpt = 
	{
		{"Ta mu鑞 tham gia", signup},
		{"Nh薾 l穘h ph莕 thng", give_award},
		{"H駓 b� "}
	}
	CreateNewSayEx(szTitle, tbOpt)
end


Include("\\script\\misc\\eventsys\\type\\npc.lua")

--pEventType:Reg("Quan nh綾 nh� Ho祅g Th祅h T�", "Thi猲 Tr飊g L﹗", dialog, {})