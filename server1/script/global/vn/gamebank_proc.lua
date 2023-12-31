-- 钱庄功能 (越南版本)
-- by：Dan_Deng(2003-09-16)
-- Update: Dan_Deng(2004-01-06) 从统一功能移动处理银票到此独有
-- Update: Fanghao_Wu(2004-9-04) 增加元宝兑换铜钱功能

-- Update: paul zhang(2005-09-06) 为越南版作修改，只使用银元宝，没有金元宝，银元宝可充成包周(7天)或者25小时，
--			铜钱暂时不开放，同时增加一个头文件用于控制功能的开放与关闭
-- Update: paul zhang(2005-12-28) 为越南版作修改，由于越南方的原因，修改成只使用金元宝，没有银元宝，但是金元宝的作用修改为可充成包周(7天)或者25小时，

-- Edited by peres
-- 2005/12/29 开放一个元宝换 15 个铜钱的功能
-- end;

Include("\\script\\global\\systemconfig.lua") -- 系统配置
--Include("\\script\\global\\yuanbao_head.lua")
--Include("\\script\\task\\newtask\\newtask_head.lua")
Include("\\script\\task\\newtask\\education\\jiaoyutasknpc.lua") 
--Include("\\script\\misc\\maskfree\\event.lua")		--免费面具领取
Include("\\script\\event\\vnchristmas2006\\event.lua")	--圣诞充卡送面具

--Msg2Player("gamebank_proc-- vn")

function gamebank_proc()
	local msg = {
		"Ta mu鑞 r髏 Ti襫 уng/get_ingot",
		"Ta mu鑞 i Ti襫 уng/pay_ingot",--doi knb th祅h ng祔 choi
		"Ki觤 tra ta c遪 g雐 bao nhi猽 Ti襫 уng/show_ingot",
--		"Ta mu鑞 i Nguy猲 b秓 th祅h Ti襫 ng/change_ingot_to_coin",
		"Nh﹏ ti謓 gh� qua th玦/no"
	};

	local talk = "";  
	if (GetSex() == 0) then
		talk = "ng r錳! Thi誹 hi謕 c莕 g�?";
	else
		talk = "ng r錳! N� hi謕 c莕 g�?";
	end
	local nDate = tonumber(GetLocalDate("%Y%m%d"));
	if (nDate >= 20061223 and nDate <= 20070114) then
		tinsert(msg, 1, "Nh薾 qu� t苙g: M苩 n� /takeMaskFree");
	end;
	
	Say(talk, getn(msg), msg)
end
------------- 查询元宝 --------------------
function show_ingot()
	local nMoney = GetExtPoint(1)
	if (nMoney >= 32768) then
		nMoney = 0
		Msg2Player("Х x穣 ra l鏸 trong ng﹏ kh� c馻 b筺, t筸 th阨 kh玭g th� r髏 頲 Ti襫 уng. Xin vui l遪g li猲 h� v韎 nh� ph竧 h祅h  頲 gi秈 quy誸 !")
		return
	end
	if (nMoney <= 0) then
		Say("g ch� ti襫 trang: Kh竎h quan ch璦 h� g鰅 k� tr﹏ b秓 v藅 g� � y",1,"Bi誸 r錳/no")
		return
	else
		local nCurVar = nMoney *20
		Say("<#> Kh竎h quan  g鰅 t筰 b鎛 ti謒 t鎛g c閚g <color=green>"..nCurVar.."<color> Ti襫 уng.",1,"Bi誸 r錳/no")
	end
end

------------- 取元宝 -----------------------
function get_ingot()

	if (SYSCFG_GAMEBANK_GOLDSILVER_OPEN ~= 1) then
		Talk(1,"","Xin l鏸! Ti襫 trang hi謓 產ng s鱝 ch鱝! 2 ng祔 n鱝 kh竎h quan quay l筰 nh�! ")
		return
	end

	local nMoney = GetExtPoint(1)	
	if (nMoney >= 32768) then
		nMoney = 0
		Msg2Player("Х x穣 ra l鏸 trong ng﹏ kh� c馻 b筺, t筸 th阨 kh玭g th� r髏 頲 Ti襫 уng. Xin vui l遪g li猲 h� v韎 nh� ph竧 h祅h  頲 gi秈 quy誸 !")
		return
	end
	if CalcFreeItemCellCount() < 5 then
			Talk(1, "", "H祅h trang kh玭g  5 � tr鑞g.");
			return 1
	end
	if (nMoney <= 0) then					-- 没有扩展点数
		Talk(1,"","Xin l鏸! Kh竎h quan kh玭g c� g雐 Ti襫 ng t筰 b鎛 trang !")
		return
	else
		local nCurVar = nMoney *20
		Say("<#> Kh竎h quan  g鰅 t筰 b鎛 trang  t鎛g c閚g <color=green>"..nCurVar.."<color> Ti襫 уng. C� mu鑞 l蕐 ra kh玭g?", 2, "Ta mu鑞 l蕐 ra 20 Ti襫 уng/get_ingot10", "Kh玭g l蕐/no")
	end
end

function get_ingot10()
	if (SYSCFG_GAMEBANK_SILVER_GET == nil) then -- 出错了~~
		print("get_silver have close, but something is wrong...");
		Msg2Player("Ch鴆 n╪g b� l鏸!");
		return
	end
	
	if (GetExtPoint(1) < 1) then
		Talk(1,"","Х x穣 ra l鏸 trong ng﹏ kh� c馻 b筺, t筸 th阨 kh玭g th� r髏 頲 Ti襫 уng. Xin vui l遪g li猲 h� v韎 nh� ph竧 h祅h  頲 gi秈 quy誸 !")
		return
	end
	Say("Kh竎h quan x竎 nh mu鑞 r髏  Ti襫 уng ch�? (Sau khi x竎 nh薾 xin ng tho竧 kh醝 tr� ch琲!) ", 2, "X竎 nh薾/get_ingot10ok", "H駓 b� /no");
end

function get_ingot10ok()
	PayExtPoint(1,1)
	Msg2Player("Hi謓 產ng l蕐 Ti襫 уng cho qu� kh竎h! Xin l璾 � ng tho竧 kh醝 tr� ch琲!")
end;

------------- 兑现元宝 ---------------------
function pay_ingot()

	if (SYSCFG_GAMEBANK_SILVER_PAY ~= 1) then
		Talk(1,"","Xin l鏸! Ti襫 trang hi謓 產ng s鱝 ch鱝! 2 ng祔 n鱝 kh竎h quan quay l筰 nh�! ")
		return
	end

	-- 越南的银元宝物品ID与大陆版本的金元宝物品ID一致
	local nCurTD = CalcEquiproomItemCount(4,417,1,1)
	if (nCurTD >= 20) then
		Say("g ch� ti襫 trang: Kh玭g th祅h v蕁 ! Kh竎h quan mu鑞 i <color=green>Ti襫 уng<color> sang h譶h th鴆 n祇?", 3,"Ta mu鑞 d飊g 20 Ti襫 уng i  th祅h 10 ng祔 ch琲/pay_ingot_10a","Ta mu鑞 d飊g 20 Ti襫 уng i th祅h 20 gi� ch琲/pay_ticket_10b","Kh玭g i n鱝/no")
	else
		Say("Kh竎h quan kh玭g mang  Ti襫 уng �?",1,"ng r錳! Ta qu猲 mang theo/no")
	end

end

function pay_ingot_10a()
	if (SYSCFG_GAMEBANK_SILVER_PAY == nil) then -- 出错了~~
		print("pay_silver10 have close, but something is wrong...");
		Msg2Player("Ch鴆 n╪g b� l鏸!");
		return
	end
	local nCurTD = CalcEquiproomItemCount(4,417,1,1)
	if (nCurTD >= 20) then
		if (ConsumeEquiproomItem(20,4,417,1,1)~= 1) then
			Msg2Player("Tr� ti襫 ng th蕋 b筰 !")
			WriteLog(date("%Y%m%d %H%M%S").."\t".."фi 10 ng祔 ch琲"..GetAccount().."\t"..GetName().."\t".."d飊g 20 Ti襫 уng i  th祅h 10 ng祔 ch琲 th蕋 b筰")
			return
		end
		UseSilver(1,1,1)
		SaveNow(); -- 立即存盘
		WriteLog(date("%Y%m%d %H%M%S").."\t".."фi 10 ng祔 ch琲"..GetAccount().."\t"..GetName().."\t".."d飊g 20 Ti襫 уng i  th祅h 10 ng祔 ch琲 th祅h c玭g")
		WriteGoldLog( GetAccount().."("..GetName()..") USE a 343 SILVER for 10 DAY CHARGE", 0, -1, 0 );
		Say("g ch� ti襫 trang: <color=green>S� d鬾g 20 Ti襫 уng<color> i sang <color=red>10 ng祔 ch琲<color> th祅h c玭g. Xin kh竎h quan ki觤 tra l筰!", 0)
	end
end

function pay_ticket_10b()
	if (SYSCFG_GAMEBANK_SILVER_PAY == nil) then -- 出错了~~
		print("pay_silver10 have close, but something is wrong...");
		Msg2Player("Ch鴆 n╪g b� l鏸!");
		return
	end
	local nCurTD = CalcEquiproomItemCount(4,417,1,1)
		if (nCurTD >= 20) then
			if (ConsumeEquiproomItem(20,4,417,1,1)~= 1) then
				Msg2Player("Tr� ti襫 ng th蕋 b筰 !")
				WriteLog(date("%Y%m%d %H%M%S").."\t".."фi 20 gi� ch琲"..GetAccount().."\t"..GetName().."\t".."d飊g 20 Ti襫 уng i  th祅h 20 gi� ch琲  th蕋 b筰")
				return
			end
			UseSilver(1,0,1)
			SaveNow(); -- 立即存盘
			WriteLog(date("%Y%m%d %H%M%S").."\t".."фi 20 gi� ch琲"..GetAccount().."\t"..GetName().."\t".."d飊g 20 Ti襫 уng i  th祅h 20 gi� ch琲 th祅h c玭g")
			WriteGoldLog( GetAccount().."("..GetName()..") USE a 343 SILVER for 20 HOURS CHARGE", 0, -1, 0 );
			Say("g ch� ti襫 trang: <color=green>S� d鬾g 20 Ti襫 уng<color> i sang <color=green>20 gi� ch琲<color> th祅h c玭g. Xin kh竎h quan ki觤 tra l筰!", 0)
		end
end

------------- 兑换铜钱---------------------
function change_ingot_to_coin()	
do return end
	local nSilverCount = GetItemCountEx( 343 );		-- 元宝个数

	if (SYSCFG_GAMEBANK_SILVER_COIN ~= 1) then
		Talk(1,"","Xin l鏸! Ti襫 trang hi謓 產ng s鱝 ch鱝! 2 ng祔 n鱝 kh竎h quan quay l筰 nh�! ")
		return
	end

	if (nSilverCount <= 0) then					-- 没有元宝
		Say( "Kh竎h quan kh玭g mang Kim Nguy猲 B秓 theo �?", 1, "ng r錳! Ta qu猲 mang theo/no");
		return
	end
	if CalcFreeItemCellCount() < 5 then
			Talk(1, "", "H祅h trang kh玭g  5 � tr鑞g.");
			return 1
	end

	Say( "g ch� ti襫 trang: Kh竎h quan ng � i ti襫 уng ch�?", 2, "фi Nguy猲 b秓 th祅h"..COIN_CHANGE_COUNT_OF_SILVER.."<#> ti襫 ng/change_silver_to_coin", "Kh玭g i n鱝/no");

end

function change_silver_to_coin()
	if (SYSCFG_GAMEBANK_SILVER_COIN == nil) then -- 出错了~~
		print("coin_silver have close, but something is wrong...");
		Msg2Player("Ch鴆 n╪g b� l鏸!");
		return
	end
	
	if (GetItemCountEx(343) > 0) then		
		DelItemEx( 343 );		
		AddStackItem( COIN_CHANGE_COUNT_OF_SILVER, 4, 417, 1, 1, 0, 0, 0 );
		UseSilver(1, 2, 1); -- 银票兑换为铜钱的消耗统计
		
		SaveNow(); -- 立即存盘
		WriteGoldLog( GetAccount().."("..GetName()..") CHANGE a SILVER into "..COIN_CHANGE_COUNT_OF_SILVER.." COINS", 0, -1, COIN_CHANGE_COUNT_OF_SILVER );
		--local nSilverCount = GetItemCountEx( 343 );		-- 元宝个数
		--if( nSilverCount > 0 ) then
		--	Say( "钱庄老板：您的元宝已成功兑换成"..COIN_CHANGE_COUNT_OF_SILVER.."<#>个铜钱，请客倌核查。", 2, "知道了/no", "再兑换一些铜钱/change_coin" );
		--else
		Say( "g ch� ti襫 trang: Kh竎h quan i Nguy猲 b秓 ra"..COIN_CHANGE_COUNT_OF_SILVER.."<#> Ti襫 ng! Xin kh竎h quan ki觤 tra l筰!",0);
		--end
	end
end

------------ 关于铜钱 ------------------
function onAboutCoin()
	Talk( 2,"","g ch� ti襫 trang: C� th� mang Nguy猲 b秓 n b鎛 ti謒  ith祅h ti襫 уng, 1 <color=yellow>Nguy猲 B秓<color> i 頲 <color=yellow>"..COIN_CHANGE_COUNT_OF_SILVER.."<color> ti襫 уng.Nguy猲 b秓 sau khi  i ra ti襫 уng th� kh玭g th� i l筰","Ti襫 ng c� th� n c竎 th祅h th� n琲 H祅g Rong  mua K� tr﹏ d� b秓.","蕁 gi� chu閠 tr竔 v祇 m閠 ti襫 ng, k衞 ch錸g l猲 1 ng ti襫 kh竎, t鑙 產 l� <color=yellow>100 ng<color>. Nh蕁 gi� ph輒 <color=yellow>Shift<color> v� nh蕁 chu閠 tr竔 v祇 m閠 ng ti襫, nh藀 s� ti襫 mu鑞 t竎h. Nh蕄 x竎 nh  ho祅 th祅h!");
end
----------------------------------------
function no()
end
