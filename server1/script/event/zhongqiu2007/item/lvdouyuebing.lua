--中秋2007活动 绿豆月饼
--by 小浪多多
--2007-09-07
Include("\\script\\event\\zhongqiu2007\\head.lua")

function main(sel)
	local ndate = tonumber(GetLocalDate("%y%m%d%H%M"))
	--if ndate > 0710312400 then
		--Say("B竛h Trung Thu u xanh n祔  qu� h筺 s� d鬾g.",0)
		--return 0
	--end
	if check_level() == 0 then
		Say(tb_content["szlevel"],0)
		return 1
	end
	if check_pay() == 0 then
		Say(tb_content["szpay"],0)
		return 1
	end
	local ncurexp = GetTask(TSK_ZHONGQIU2007)
	if ncurexp >= NZHONGQIU2007_MAX then
		Say("觤 kinh nghi謒 nh薾 頲 t� b竛h Trung Thu  vt m鴆 gi韎 h筺.",0)
		return 1
	end
	local nexp = 500000
	if (ncurexp + nexp) >= NZHONGQIU2007_MAX then
		nexp = NZHONGQIU2007_MAX - ncurexp
	end
	SetTask(TSK_ZHONGQIU2007,(ncurexp+nexp))
	AddOwnExp(nexp)
	Msg2Player(format("Nh薾 頲 <color=yellow>%s<color> 甶觤 kinh nghi謒",nexp))
	WriteLog(format("[zhongqiu2007_lvdou]\t Date:%s\t Account:%s\t Name:%s\t GetExp:%s",GetLocalDate("%y-%m-%d %H:%M:%S"),GetAccount(),GetName(),nexp));
end