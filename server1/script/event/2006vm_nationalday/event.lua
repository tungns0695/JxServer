NA_MONEYGIFT_MAX_MONEY				=	1000000			--活动期最大允许兑换奖励金钱数
NA_MONEYGIFT_DAYMAX_MONEY			= 200000			--每日最大允许兑换奖励金钱数
NA_MONEYGIFT_SV_DAYMAX_MONEY	= 350000000	--每台服务器允许每日兑换的最大值3.5亿
NA_MONEYGIFT_MONEY						= 20000

TSK_NA_MONEYGIFT_MAXMONEY			= 1194			--当前已获得的金钱统计
TSK_NA_MONEYGIFT_DAYMAXMONEY 	= 1195			--本日获得的金钱统计
TSK_NA_MONEYGIFT_LASTDAY			= 1196			--最后一次兑换奖励的日期
TSK_NA_MONEYGIFT_ISTAKED			= 1197			--该角色是否能够兑换奖励

GTSK_NA_MONEYGIFT_SVLASTDAY		= 831				--最后一次兑换物品奖励的日期
GTSK_NA_MONEYGIFT_SVMAXMONEY	= 832				--当日礼官已兑换奖励金钱的数量

EXT_NA_MONEYGIFT_ACCT					= 2					--扩展点，三个角色参加活动
TB_MONEYGIFT_MSG = {
	"<#>Qu� kh竎h ch璦 n筽 th�, kh玭g th� tham gia ho箃 ng n祔!",
	"<#>Ch� nh鱪g ngi ng c蕄 tr猲 50 m韎 c� th� tham gia ho箃 ng n祔.",
	"<#>Ngi  c� 3 nh﹏ v藅 tham gia ho箃 ng n祔, kh玭g th� tham gia th猰 頲 n鱝.",
	"<#>Qu� kh竎h  i  100 v筺 trong ho箃 ng n祔! C秏 琻  駈g h�!",
	"<#>H玬 nay qu� kh竎h  i  20 v筺. Mai l筰 n nh�!",
	"<#>Th藅 ng筰 qu�! Ta m韎 i h誸 ti襫! H穣 th� 甶 c竎 th祅h kh竎 ho芻 ng祔 mai quay l筰 nh�. Ch骳 vui v�!",
	"<#>H譶h nh� qu� kh竎h kh玭g c� 換u� Qu鑓 Kh竛h�!",
}
function vm_NationalDay()
	Say("<#>Qu鑓 kh竛h vui v�! H穣 mau 甶 luy謓 c玭g, t譵 頲 換u� Qu鑓 Kh竛h� n y ta s� i cho ph莕 qu� th� v�!", 2,
	"фi qu� Qu鑓 Kh竛h/NA_want2changegift",
	"Ta ch� n xem th玦/OnCancel");
end;

function NA_want2changegift()
	if (NA_istakedgift() == 0) then
		return 0;
	end;
	
	if (CalcEquiproomItemCount(6,1,1155,-1) >= 1 and ConsumeEquiproomItem(1, 6, 1, 1155, -1)) then
		SetTask(TSK_NA_MONEYGIFT_MAXMONEY, GetTask(TSK_NA_MONEYGIFT_MAXMONEY) + NA_MONEYGIFT_MONEY);
		SetTask(TSK_NA_MONEYGIFT_DAYMAXMONEY, GetTask(TSK_NA_MONEYGIFT_DAYMAXMONEY) + NA_MONEYGIFT_MONEY);
		SetGlbValue(GTSK_NA_MONEYGIFT_SVMAXMONEY, GetGlbValue(GTSK_NA_MONEYGIFT_SVMAXMONEY) + NA_MONEYGIFT_MONEY);
		Earn(NA_MONEYGIFT_MONEY);
		WriteLog("[Ho箃 ng Qu鑓 Kh竛h]\t"..date().." \tName:"..GetName().."\tAccount:"..GetAccount().." Nh薾 頲"..NA_MONEYGIFT_MONEY.." lng")
		Say("<#>Xin nh薾 ng﹏ lng. Ch骳 Qu鑓 Kh竛h vui v�!", 1, "Nh薾 ng﹏ lng/OnCancel")
		if (GetTask(TSK_NA_MONEYGIFT_ISTAKED) == 0) then
			SetTask(TSK_NA_MONEYGIFT_ISTAKED, 1);
			AddExtPoint(EXT_NA_MONEYGIFT_ACCT, 1);
		end;
	else
		Say(TB_MONEYGIFT_MSG[7], 0);
	end;
end;

function NA_istakedgift()
	local nDate = tonumber(GetLocalDate("%Y%m%d"));
	
	if (GetTask(TSK_NA_MONEYGIFT_LASTDAY) ~= nDate) then
		SetTask(TSK_NA_MONEYGIFT_LASTDAY, nDate);
		SetTask(TSK_NA_MONEYGIFT_DAYMAXMONEY, 0);
	end;
	
	if (GetGlbValue(GTSK_NA_MONEYGIFT_SVLASTDAY) ~= nDate) then
		SetGlbValue(GTSK_NA_MONEYGIFT_SVLASTDAY, nDate);
		SetGlbValue(GTSK_NA_MONEYGIFT_SVMAXMONEY, 0);
	end;

	if (GetTask(TSK_NA_MONEYGIFT_ISTAKED) == 0) then
		if (IsCharged() ~= 1) then	--冲值
			Say(TB_MONEYGIFT_MSG[1], 0);
		elseif (GetLevel() < 50) then	--50级
			Say(TB_MONEYGIFT_MSG[2], 0);
		elseif (GetExtPoint(EXT_NA_MONEYGIFT_ACCT) >= 3) then	--3个角色
			Say(TB_MONEYGIFT_MSG[3], 0);
		else
			return 1;
		end;
		return 0;
	else
		if (GetTask(TSK_NA_MONEYGIFT_MAXMONEY) >= NA_MONEYGIFT_MAX_MONEY) then	--角色获取最大奖励
			Say(TB_MONEYGIFT_MSG[4], 0);
		elseif (GetTask(TSK_NA_MONEYGIFT_DAYMAXMONEY) >= NA_MONEYGIFT_DAYMAX_MONEY) then		--每日最大奖励
			Say(TB_MONEYGIFT_MSG[5], 0);
		elseif (GetGlbValue(GTSK_NA_MONEYGIFT_SVMAXMONEY) >= NA_MONEYGIFT_SV_DAYMAX_MONEY) then	--服务器最大限制
			Say(TB_MONEYGIFT_MSG[6], 0);
		else
			return 1;
		end;
		return 0;
	end;
end;

function IsCharged()
	if( GetExtPoint( 0 ) >= 1 ) then
		return 1;
	else
		return 0;
	end;
end;