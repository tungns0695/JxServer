--面具处理
--返回 （1:允许佩戴, 0:不允许佩戴）
Include("\\script\\lib\\pay.lua");

MARK_DAJIANGJUN_TASK_NO = 2620
MARK_YUANSUAI_TASK_NO = 2621

function CanEquip(nParticular)	
	--VLDNB 10 - Kh玭g cho mang m苩 n� TK trng u trng - 20111017
	if nParticular == 482 or nParticular == 447 or nParticular == 450 or nParticular == 446 then
		local tbMapID = {
			605, 608, 609,
			606, 610, 611,
			607, 612, 613,
		}
		local nW, _, _ = GetWorldPos()
		for i = 1, getn(tbMapID) do
			if tbMapID[i] == nW then
				return 0
			end
		end
	end
	local nTripMode = GetTripMode()
	-- 大将军易容
	if (nParticular == 446 or nParticular == 450 or nParticular == 454 or nParticular == 455) then
		
		if nTripMode ~= 2 and (IsCharged() ~= 1) then
			Say("Ch� c� ngi ch琲 c蕄 tr猲 50  n筽 th� m韎 c� th� s� d鬾g.", 0)
			return 0;
		end
		return 1;
	end

	-- 元帅易容
	if (nParticular == 447) then
		
		if nTripMode ~= 2 and (IsCharged() ~= 1) then
			Say("Ch� c� ngi ch琲 c蕄 tr猲 50  n筽 th� m韎 c� th� s� d鬾g.", 0)
			return 0;
		end	
		return 1;
	end
	return 1;
end;
		