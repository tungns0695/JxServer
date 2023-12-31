Include("\\script\\lib\\objbuffer_head.lua")
Include("\\script\\lib\\toplist.lua")
Include("\\script\\lib\\mapdb.lua")
Include("\\script\\sharedata_key.lua")
IncludeLib("TONG")

FIELD_CHENGDU	= 926	-- 成都战场
FIELD_BIANJING	= 927	-- 汴京战场
FIELD_DALI		= 928	-- 大理战场
FIELD_FENGXIANG	= 929	-- 凤翔战场
FIELD_LINAN 	= 930	-- 临安战场
FIELD_XIANGYANG	= 931	-- 襄阳战场
FIELD_YANGZHOU	= 932	-- 扬州战场

CITYID_FENGXIANG	= 1
CITYID_CHENDU		= 2
CITYID_DALI			= 3
CITYID_BIANJING		= 4
CITYID_XIANGYANG	= 5
CITYID_YANGZHOU		= 6
CITYID_LINAN		= 7

TONGMEMBER_AWARDSCORE = 30	-- 帮会成员必须获得此积分或以上才可以获得奖励

FIELD2CITYID_LIST = {
	[FIELD_CHENGDU	] = {CityId = CITYID_CHENDU,	AwardCount = 80},	-- 成都战场
	[FIELD_BIANJING	] = {CityId = CITYID_BIANJING,	AwardCount = 180},	-- 汴京战场
	[FIELD_DALI		] = {CityId = CITYID_DALI,		AwardCount = 40},	-- 大理战场
	[FIELD_FENGXIANG] = {CityId = CITYID_FENGXIANG,	AwardCount = 80},	-- 凤翔战场
	[FIELD_LINAN	] = {CityId = CITYID_LINAN,		AwardCount = 120},	-- 临安战场
	[FIELD_XIANGYANG] = {CityId = CITYID_XIANGYANG,	AwardCount = 80},	-- 襄阳战场
	[FIELD_YANGZHOU	] = {CityId = CITYID_YANGZHOU,	AwardCount = 40},	-- 扬州战场
}

FIELDSCORE_LIST = {
	[FIELD_CHENGDU	] = 2,
	[FIELD_BIANJING	] = 4,
	[FIELD_DALI		] = 1,
	[FIELD_FENGXIANG] = 2,
	[FIELD_LINAN	] = 3,
	[FIELD_XIANGYANG] = 2,
	[FIELD_YANGZHOU	] = 1,
}

REMOTE_SCRIPT = "\\script\\missions\\sevencity\\relay_protocol.lua"

BattleWorld = {
	m_CountList = {},
	m_TongWarrior = {},		-- 帮会名=>{玩家名}
	m_WarriorTong = {},		-- 玩家名=>帮会名
	m_WarriorCount = {},	-- 帮会名=>人数
	m_Standings = {},		-- 战绩表，玩家名作为索引
	m_OwnerList = {},		-- 战场ID=>（临时）占领帮会
	m_TongScore = {},		-- 帮会积分
	m_TopTen = TopList:New(10),
}

function BattleWorld:UpdateTopList(name, count)
	return self.m_TopTen:Set(name, count)
end

function BattleWorld:GetTopList()
	return self.m_TopTen:GetList()
end

function BattleWorld:Occupy(mapid, tong)
	self.m_OwnerList[mapid] = tong
	OutputMsg(format("[SEVENCITY]field[%d] is occupied by tong[%s]", mapid, tong))
end

function BattleWorld:GetStandings(name)
	local tb = self.m_Standings[name]
	if (not tb) then
		tb = {}
		self.m_Standings[name] = tb
		tb.KillWarriorCount = 0
		tb.KillMonsterCount = 0
		tb.TimeScore = 0
	end
	return tb
end

function BattleWorld:SetTongWarrior(tong, name)
	local tb = self.m_TongWarrior[tong]
	if (not tb) then
		tb = {}
		self.m_TongWarrior[tong] = tb
	end
	tb[name] = 1	
end

function BattleWorld:GetWarriorTong(name)
	return self.m_WarriorTong[name]
end

function BattleWorld:SetWarriorTong(name, tong)
	self.m_WarriorTong[name] = tong
end

function BattleWorld:AddWarriorCount(tong)
	local count = self.m_WarriorCount[tong]
	if (not count) then
		count = 1
	else
		count = count + 1
	end
	self.m_WarriorCount[tong] = count
	return count
end

function BattleWorld:DelWarriorCount(tong)
	local count = self.m_WarriorCount[tong]
	if (count ~= nil and count > 1) then
		count = count - 1
	else
		count = 0
	end
	self.m_WarriorCount[tong] = count
	return count
end

function BattleWorld:GetWarriorCount(tong)
	local count = self.m_WarriorCount[tong]
	if (not count) then
		return 0
	else
		return count
	end
end

function BattleWorld:AddTongWarriorCount(tong)
	local count = self.m_CountList[tong]
	if (not count) then
		count = 1
	else
		count = count + 1
	end
	self.m_CountList[tong] = count
	self:SyncTongWarriorCount(tong, count)
end

function BattleWorld:DelTongWarriorCount(tong)
	local count = self.m_CountList[tong]
	if (count ~= nil and count > 1) then
		count = count - 1
	else
		count = 0
	end
	self.m_CountList[tong] = count
	self:SyncTongWarriorCount(tong, count)
end

function BattleWorld:SyncTongWarriorCount(tong, count)
	local buff = ObjBuffer:New()
	buff:Push(tong)
	buff:Push(count)
	RemoteExecute(REMOTE_SCRIPT, "RelayProtocol:SyncTongWarriorCount", buff.m_Handle)
	buff:Destroy()
end

function BattleWorld:SyncViceroy(mapid, tong, flag)
	local buff = ObjBuffer:New()
	buff:Push(mapid)
	buff:Push(tong)
	buff:Push(flag)
	RemoteExecute(REMOTE_SCRIPT, "RelayProtocol:SyncViceroy", buff.m_Handle)
	buff:Destroy()
end

function BattleWorld:Clear()
	self.m_TongWarrior = {}
	self.m_WarriorTong = {}
	self.m_WarriorCount = {}
	self.m_Standings = {}
	self.m_OwnerList = {}
	self.m_TongScore = {}
	self.m_TopTen = TopList:New(10)
	AwardDb:Clear()
end

function BattleWorld:Close()
	local tongs = {}
	for mapid, city in FIELD2CITYID_LIST do
		self:CloseField(mapid, city, tongs)
	end
	for tong, inf in tongs do
		if (inf.WinCount > 0) then
			self:SaveAward(tong, inf)
		elseif (inf.FailCount > 0) then
			local id = TONG_Name2ID(tong)
			TONG_ApplySetOccupyCityDay(id, 0)
			--失去城池，5级帮降为4级
			local level = TONG_GetBuildLevel(id)
			if (level >= 5) then
				TONG_ApplyDegrade(id)
				OutputMsg(format("[SEVENCITY]tong[%s] building level(%d) degrade", tong, level))
				local msg = "Bang h閕 b� m蕋 th祅h, ng c蕄 ki課 thi誸 bang gi秏 xu鑞g c蕄 4"
				Msg2Tong(id, msg)
				TONG_ApplyAddEventRecord(id, msg)
			end
		end
	end
	self.m_TongScore = {}
end

function BattleWorld:QueryTong(tongs, tong)
	local inf = tongs[tong]
	if (not inf) then
		inf = {}
		inf.WinCount = 0
		inf.FailCount = 0
		inf.PackCount = 0	-- 占城或者守城成功获得的攻城战礼包数量
		tongs[tong] = inf
	end
	return inf
end

function BattleWorld:AddWinCount(tongs, tong, nAwardCount)
	local inf = self:QueryTong(tongs, tong)
	inf.WinCount = inf.WinCount + 1
	inf.PackCount = inf.PackCount + nAwardCount
end

function BattleWorld:AddFailCount(tongs, tong)
	local inf = self:QueryTong(tongs, tong)
	inf.FailCount = inf.FailCount + 1
end

function BattleWorld:CloseField(mapid, city, tongs)
	local new_owner = self.m_OwnerList[mapid]
	local old_owner = GetViceroy(city.CityId)
	if (new_owner == "") then
		new_owner = nil
	end
	if (old_owner == "") then
		old_owner = nil
	end
	local cityname = GetCityAreaName(city.CityId)
	if (not old_owner and not new_owner) then
		-- 无人占领
		self:SyncViceroy(mapid, "", 0)
		OutputMsg(format("[SEVENCITY]city(%s) owned by none", cityname))
	elseif (not new_owner or new_owner == old_owner) then
		-- 连任
		self:AddWinCount(tongs, old_owner, city.AwardCount)
		self:SyncViceroy(mapid, old_owner, 0)
		local master = TONG_GetMaster(TONG_Name2ID(old_owner)) or ""
		OutputMsg(format("[SEVENCITY]city(%s) still owned by tong(%s), master(%s)", cityname, old_owner, master))
	else
		-- 占领
		if (old_owner) then
			self:AddFailCount(tongs, old_owner)
		end
		self:AddWinCount(tongs, new_owner, city.AwardCount)
		AppointViceroy(city.CityId, new_owner)
		self:OutputStandings(new_owner)
		self:SyncViceroy(mapid, new_owner, 1)
		local master = TONG_GetMaster(TONG_Name2ID(new_owner)) or ""
		OutputMsg(format("[SEVENCITY]city(%s) owned by tong(%s), master(%s)", cityname, new_owner, master))
	end
end

function BattleWorld:OutputStandings(tong)
	local tb = self.m_TongWarrior[tong]
	if (not tb) then
		OutputMsg(format("[SEVENCITY]tong(%s) has none warrior", tong))
		return
	end
	OutputMsg(format("[SEVENCITY]tong(%s), warrior count(%d)", tong, getn(tb)))
	local index = 1
	for name, _ in tb do
		local standings = self:GetStandings(name)
		OutputMsg(format("[SEVENCITY]warrior[%d], Name(%s), KillWarriorCount(%d), KillMonsterCount(%d), TimeScore(%d)",
			index,
			name,
			standings.KillWarriorCount,
			standings.KillMonsterCount,
			standings.TimeScore))
		index = index + 1
	end
end

-- 查询帮会占城数
function BattleWorld:GetCityCount(tong)
	local count = 0
	for field, city in FIELD2CITYID_LIST do
		local winner = self.m_OwnerList[field]
		if (winner ~= nil and winner ~= "") then
			if (winner == tong) then
				count = count + 1
			end
		else
			-- 无人获胜则算作原占领帮会继续占城
			if (GetViceroy(city.CityId) == tong) then
				count = count + 1
			end
		end
	end
	return count
end

function BattleWorld:InitAward()
	local award = {}
	award.BoxCount = 0			-- 攻城礼包
	award.DewCount = 0			-- 混元灵露
	award.GuardAwardCount = 0	-- 卫柱礼包
	award.ExpAward = 0
	return award
end

function BattleWorld:GetAward(name)
	local award = AwardDb:Get(name)
	if (not award) then
		award = self:InitAward()
		AwardDb:Set(name, award)
	end
	return award
end

-- 计算帮会中可以获得奖励的成员的数量
function BattleWorld:GetTongMemberAwardCount(tb)
	count = 0
	for name, _ in tb do
		local standings = self:GetStandings(name)
		if (standings.TimeScore >= TONGMEMBER_AWARDSCORE) then
			count = count + 1
		end
	end
	return count
end

function BattleWorld:SaveAward(tong, inf)
	-- 时间积分奖励和杀敌数奖励
	local tb = self.m_TongWarrior[tong]
	if (tb) then
		local award_count = self:GetTongMemberAwardCount(tb)
		if (award_count > 0) then
			local tong_score = self.m_TongScore[tong] or 0
			local exp_award = floor(tong_score * 25000000)
			local rate = floor(tong_score * 2 * 100 / award_count)
			OutputMsg(format("[SEVENCITY]tong(%s): score(%d), highscore_member_count(%d), guardaward_rate(%d)",
				tong, tong_score, award_count, rate))
			for name, _ in tb do
				local standings = self:GetStandings(name)
				if (standings.TimeScore >= TONGMEMBER_AWARDSCORE) then
					local award = self:GetAward(name)
					award.ExpAward = exp_award
					if (rate >= 100 or random(1, 100) <= rate) then
						award.GuardAwardCount = 1	-- 卫柱礼包数量，每个成员最多只能获得一个
						OutputMsg(format("[SEVENCITY]member(%s): guard award", name))
					end
					AwardDb:Save(name)
				end
			end
		end
	end
	-- 帮主奖励
	local master = TONG_GetMaster(TONG_Name2ID(tong))
	if (master ~= nil and master ~= "") then
		local award = self:GetAward(master)
		award.BoxCount = inf.PackCount
		AwardDb:Save(master)
	end
end

function BattleWorld:ReduceDew(name, count)
	local award = AwardDb:Get(name)
	if (count < 0) then
		OutputMsg(format("[ERROR SEVENCITY]ReduceDew(%s, %d) fail: count is below zero", name, count))
	elseif (not award) then
		OutputMsg(format("[ERROR SEVENCITY]ReduceDew(%s, %d) fail: no award", name, count))
	elseif (award.DewCount < count) then
		OutputMsg(format("[ERROR SEVENCITY]ReduceDew(%s, %d) fail: more than %d",
			name,
			count,
			award.DewCount))
	else
		award.DewCount = award.DewCount - count
		AwardDb:Save(name)
		OutputMsg(format("[SEVENCITY]ReduceDew(%s, %d) success", name, count))
	end
end

function BattleWorld:ClearExpAward(name)
	local award = AwardDb:Get(name)
	if (not award) then
		OutputMsg(format("[ERROR SEVENCITY]ClearExpAward(%s) fail: no award", name))
	else
		OutputMsg(format("[SEVENCITY]ClearExpAward(%s) success: exp(%d=>0)", name, award.ExpAward))
		award.ExpAward = 0
	end
end

function BattleWorld:ReduceBox(name, count)
	local award = AwardDb:Get(name)
	if (count < 0) then
		OutputMsg(format("[ERROR SEVENCITY]ReduceBox(%s, %d) fail: count is below zero", name, count))
	elseif (not award) then
		OutputMsg(format("[ERROR SEVENCITY]ReduceBox(%s, %d) fail: no award", name, count))
	elseif (award.BoxCount < count) then
		OutputMsg(format("[ERROR SEVENCITY]ReduceBox(%s, %d) fail: more than %d",
			name,
			count,
			award.BoxCount))
	else
		award.BoxCount = award.BoxCount - count
		AwardDb:Save(name)
		OutputMsg(format("[SEVENCITY]ReduceBox(%s, %d) success", name, count))
	end
end

function BattleWorld:ReduceGuardAward(name, count)
	local award = AwardDb:Get(name)
	if (count < 0) then
		OutputMsg(format("[ERROR SEVENCITY]ReduceGuardAward(%s, %d) fail: count is below zero", name, count))
	elseif (not award) then
		OutputMsg(format("[ERROR SEVENCITY]ReduceGuardAward(%s, %d) fail: no award", name, count))
	elseif (award.GuardAwardCount < count) then
		OutputMsg(format("[ERROR SEVENCITY]ReduceGuardAward(%s, %d) fail: more than %d",
			name,
			count,
			award.GuardAwardCount))
	else
		award.GuardAwardCount = award.GuardAwardCount - count
		AwardDb:Save(name)
		OutputMsg(format("[SEVENCITY]ReduceGuardAward(%s, %d) success", name, count))
	end
end

function BattleWorld:AddDew(name, count)
	local award = self:GetAward(name)
	award.DewCount = award.DewCount + count
	AwardDb:Save(name)
end

function BattleWorld:AddBox(name, count)
	local award = self:GetAward(name)
	award.BoxCount = award.BoxCount + count
	AwardDb:Save(name)
end

function BattleWorld:AddGuardAward(name, count)
	local award = self:GetAward(name)
	award.GuardAwardCunt = award.GuardAwardCunt + count
	AwardDb:Save(name)
end

function BattleWorld:AddScore(mapid)
	if (not FIELDSCORE_LIST[mapid]) then
		OutputMsg(format("[ERROR SEVENCITY]invalid map: %d", mapid))
		return
	end
	local tong = self.m_OwnerList[mapid]
	if (not tong) then
		OutputMsg(format("[ERROR SEVENCITY]mapid(%d): tong not found", mapid))
		return
	end
	local old_score = self.m_TongScore[tong] or 0
	local new_score = old_score + FIELDSCORE_LIST[mapid]
	self.m_TongScore[tong] = new_score 
	OutputMsg(format("[SEVENCITY]add score(%d=>%d): tong(%s), mapid(%d)", old_score, new_score, tong, mapid))
end

-- 加载奖励信息
AwardDb = MapDatabase:New(SDKEY_SEVENCITY)
AwardDb:LoadAll()
