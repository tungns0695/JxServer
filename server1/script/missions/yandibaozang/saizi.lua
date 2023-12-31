IL("DICEITEM")
Include("\\script\\missions\\yandibaozang\\include.lua")

function YDBZ_DiceDice(ng,gd,np,ntime,double)
	local nRet = ApplyItemDice(1, 100,ntime, "\\script\\missions\\yandibaozang\\saizi.lua", "YDBZ_OnTimeOver", GetTeamSize())
	-- print(nRet)
	local nBody = 0
	AddDiceItemInfo(nRet,0,ng,gd,np,1,double,1,1,1,1,1)
	local nPlayerOld = PlayerIndex
	for i=1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i)
		RollItem(nRet)
	end
		PlayerIndex = nPlayerOld
end

function YDBZ_OnTimeOver(dwID)
	-- print("TimeOver!!")
	YDBZ_show_roll_info(dwID)
end

function YDBZ_show_roll_info(dwID)
	local t, nSize, szItem,quality,nGenre,nDetial,nPart,nLevel,nSeries = GetItemDiceRollInfo(dwID)
	local bAllGiveUp = 1
	local ndsign = 0
	local oldplayindex = PlayerIndex
	local ndouble = YDBZ_sdl_getTaskByte(YDBZ_ITEM_YANDILING,1)
	for index, value in t do
		--print(PlayerIndex,nGenre,nDetial,nPart)
		PlayerIndex = value[5]
		if GetName() == value[1] then	-- 当然玩家仍然在线才显示相关信息
			--print(index)
			local str = "<color=yellow>"..value[1].."<color>ф x骳 x綾 <color=yellow>"..value[2].." 甶觤<color>."
			if value[3] == 0 then
				str = "<color=yellow>"..value[1].."<color> h駓 b�"
			elseif value[3] == 2 then
				if value[4] == 1 then
					if oldplayindex == value[5] and nSeries == 1 and ndouble == 1 then
						if random(1,100) < 50 then
							str = str .. "<color=yellow>[Vi猰 д L謓h c� hi謚 l鵦]<color>"
							ndsign = 1
						else
							str = str .. "<color=blue>[Vi猰  l謓h m蕋 hi謚 l鵦]<color>"
							
						end
						--记录log
						if nGenre == 6 and nDetial == 1 and nPart == 1606 then
							YDBZ_sdl_writeLog("Vt 秈 b秓 t祅g vi猰 ","Trong qu� tr譶h vt 秈 thu 頲 1 Vi猰 д  ng")
						end	
						if nGenre == 6 and nDetial == 1 and nPart == 1605 then
							YDBZ_sdl_writeLog("Vt 秈 b秓 t祅g vi猰 ","Trong l骳 vt 秈 thu 頲 1 h譶h n閙")
						end			
					end
					str = str..format(" -- nh苩 頲 <color=yellow>%s<color>",szItem)
				end
				bAllGiveUp = 0
			end
			PlayerIndex = oldplayindex
			Msg2Player(str)
			if ndsign == 1 then
				local ndix = AddItem(nGenre,nDetial,nPart,1,0,0)
				if ndix <=0 then
					--ndix = AddItem(nGenre,nDetial,nPart,1,0,0)
					--print(ndix)
				end
				YDBZ_sdl_writeLog("Vt 秈 b秓 t祅g vi猰 ",format("L骳 vt 秈 thu 頲 1 %s",GetItemName(ndix)))
			end
		end
	end
	if bAllGiveUp == 1 then
		Msg2Player("T蕋 c� ngi ch琲 u h駓 b� r錳")
	elseif nSize ~= getn(t) then
		Msg2Player("Ngi ch琲 kh竎 v� qu� h筺 th阨 gian, n猲 t輓h l� h駓 b�")
	end
end

function YDBZ_sdl_writeLog(sztitle,szevent)	--记录,sztitle=事件名,szevent=事件内容
	WriteLog(format("[%s]\t Date:%s\t Account:%s\t Name:%s\t %s",sztitle,GetLocalDate("%y-%m-%d %H:%M:%S"),GetAccount(),GetName(),szevent));
end