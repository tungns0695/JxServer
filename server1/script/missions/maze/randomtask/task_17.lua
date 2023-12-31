-- 17.	出现2个一样的NPC，一个叫相生子，一个叫相克子，地上出现5个不同五行的雕像，
-- 先和相生子对话，他会说一个五行和一个队友的名字，然后要这个队友去开启与这个五行相生的雕像，开错这个队友就会死掉。
-- 然后到相克子对话，开启相克的五行。雕像开启完后不消失，2个NPC要轮流对话，总共正确开启20次过关。
Include("\\script\\missions\\maze\\task.lua")
Include("\\script\\global\\dlgnpc_list.lua")
Include("\\script\\global\\fightnpc_list.lua")
Include("\\script\\missions\\maze\\progressbar.lua")
Include("\\script\\lib\\player.lua")
Include("\\script\\global\\playerlist.lua")

pTask = Task:New(17)
pTask.m_MaxFinishCount = 20

tbTASK17_JOSS = {	-- TODO
	{1647,	"猽 Tng ( Kim)"},
	{1648,	"猽 Tng (M閏)"},
	{1649,	"猽 Tng ( th駓 )"},
	{1650,	"猽 Tng ( H醓 )"},
	{1651,	"猽 Tng ( Th�)"},
}

tbTASK17_SERIES = {0, 1, 2, 3, 4}

tbTASK17_SERIESNAME = {
	[0] = "Kim",
	[1] = "M閏",
	[2] = "Th駓 ",
	[3] = "H醓",
	[4] = "Th� ",
}

function pTask:OnStart()
	local mapid = self:GetMapId()
	local pos = self:GetPosition()
	self.m_AccrueIndex = DlgNpcManager:AddNpc("Tng Sinh T�", 1645, mapid, pos.t17_accrue.x, pos.t17_accrue.y, self, 1)
	self.m_ConquerIndex = DlgNpcManager:AddNpc("Tng Kh綾 T�", 1646, mapid, pos.t17_conquer.x, pos.t17_conquer.y, self, 2)
	self.m_Statuary = {}
	self.m_TalkIndex = 1
	self.m_AppointPlayer = nil
	self.m_AppointSeries = 0
	self.m_BarId = 0
	self.m_FinishCount = 0
	for i = 1, 5 do
		local nNpcIndex = DlgNpcManager:AddNpc(tbTASK17_JOSS[i][2], tbTASK17_JOSS[i][1], mapid, pos.t12_joss[i].x, pos.t12_joss[i].y, self, i + 2)
		tinsert(self.m_Statuary, nNpcIndex)
	end
end

function pTask:OnDestroy()
	if (self.m_AccrueIndex > 0) then
		DlgNpcManager:DelNpc(self.m_AccrueIndex)
		self.m_AccrueIndex = 0
	end
	if (self.m_ConquerIndex > 0) then
		DlgNpcManager:DelNpc(self.m_ConquerIndex)
		self.m_ConquerIndex = 0
	end
	if (self.m_Statuary) then
		for i = 1, getn(self.m_Statuary) do
			DlgNpcManager:DelNpc(self.m_Statuary[i])
		end
		self.m_Statuary = nil
	end
	if (self.m_BarId > 0) then
		ProgressBarList:Close(self.m_BarId)
		self.m_BarId = 0
	end
end

function pTask:Say(player, nIndex)
	if (nIndex == 1) then
		return self:Say_Accrue(player, nIndex)
	elseif (nIndex == 2) then
		return self:Say_ConquerIndex(player, nIndex)
	else
		return self:Say_Statuary(player, nIndex)
	end
end

function pTask:Say_Accrue(player, nIndex)
	if (self.m_BarId > 0) then
		player:Say("Xin h穣 m� 猽 Tng ra r錳 l筰 g苝 ta.")
		return
	elseif (self.m_TalkIndex == 2) then
		player:Say("Tr薾 n祔 n lt Tng Kh綾 T� xu蕋 , ta ngh� ng琲 m閠 l竧.")
		return
	end
	if (not self.m_AppointPlayer) then
		self.m_AppointPlayer = self:RandomPlayerName() or player:GetName()
		self.m_QuestionSeries = random(0, 4)
		self.m_AppointSeries = GetAccrueSeries(self.m_QuestionSeries)
	end
	local msg = format("%s, Xin h穣 m� %s 猽 Tng Ng� H祅h", self.m_AppointPlayer, tbTASK17_SERIESNAME[self.m_QuestionSeries])
	player:Say(msg)
	self:BroadCast(msg)
end

function pTask:Say_ConquerIndex(player, nIndex)
	if (self.m_BarId > 0) then
		player:Say("Xin h穣 m� 猽 Tng ra r錳 l筰 g苝 ta.")
		return
	elseif (self.m_TalkIndex == 1) then
		player:Say("Tr薾 n祔 n lt Tng Kh綾 T� xu蕋 , ta ngh� ng琲 m閠 l竧.")
		return
	end
	if (not self.m_AppointPlayer) then
		self.m_AppointPlayer = self:RandomPlayerName() or player:GetName()
		self.m_QuestionSeries = random(0, 4)
		self.m_AppointSeries = GetConquerSeries(self.m_QuestionSeries)
	end
	local msg = format("%s, Xin h穣 m� %s t蕋 c� 猽 Tng Ng� H祅h", self.m_AppointPlayer, tbTASK17_SERIESNAME[self.m_QuestionSeries])
	player:Say(msg)
	self:BroadCast(msg)
end

function pTask:Say_Statuary(player, nIndex)
	if (self.m_BarId > 0) then
		return
	end
	self.m_BarId = ProgressBarList:Open("ng m�", player, 3, self, nIndex - 2)
end

function pTask:OnProgressbarTimeout(nId, nIndex, player)
	self.m_BarId = 0
	if (tbTASK17_SERIES[nIndex] == self.m_AppointSeries and self.m_AppointPlayer == player:GetName()) then
		self:BroadCast("M� th祅h c玭g.")
		self.m_FinishCount = self.m_FinishCount + 1
		if (self.m_FinishCount >= self.m_MaxFinishCount) then
			self:Proceed()
		elseif (self.m_TalkIndex == 1) then
			self.m_TalkIndex = 2
		else
			self.m_TalkIndex = 1
		end
	else
		self:BroadCast("M� th蕋 b筰.")
		self:KickPlayer(self.m_AppointPlayer)
		self.m_AppointSeries = 0
		self.m_TalkIndex = 1
	end
	self.m_AppointPlayer = nil
end

function pTask:OnProgressbarBreak(nId, nIndex)
	self:BroadCast("M� th蕋 b筰.")
	self.m_BarId = 0
end
