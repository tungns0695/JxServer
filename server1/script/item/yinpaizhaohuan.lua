--zero 20070713 银牌召唤
--第一个字节记录银 第二个字节记录金 第三个字节记录玉，因为只用一次，只需要记录时间

Include( "\\script\\event\\mengjiang2007\\callboss.lua" )
Include("\\script\\lib\\pay.lua");
yinpai_Task=1827;
function main( nItemIdx )
	local TaskValue=GetTask(yinpai_Task);
	local nDate = tonumber(GetLocalDate("%Y%m%d"));
	if(nDate>21080331) then
		Say("L謓h b礽  qu� h筺 s� d鬾g, b� m蕋 hi謚 l鵦!",0)
		return 0;
	end
	if( IsCharged() == 0) then
		Say("Th藅 ng ti誧, ch� c� ngi ch琲  n筽 th� m韎 c� th� s� d鬾g.",0);
		return 1; 
	end
	if( GetLevel() <90 ) then
		Say("Th藅 ng ti誧, ch� c� ngi ch琲 c蕄 90 tr� l猲 m韎 c� th� s� d鬾g.",0);
		return 1;
	end
	nDate = tonumber(GetLocalDate("%d"));
	if(nDate ~= GetByte(TaskValue,1) ) then --不是今天
		if( CallBoss(3) == 0) then
			TaskValue=SetByte(TaskValue,1,nDate); --设置银牌日期 第1字节
			SetTask(yinpai_Task,TaskValue);
			return 0;
		else
			return 1;
		end	
	else
		Say("H玬 nay  s� d鬾g 1 Ng﹏ B礽 r錳! H穣 i ng祔 mai m韎 c� th� ti誴 t鬰 s� d鬾g!",0);
		return 1;
	end
	
end

function GetDesc(nItem)

end