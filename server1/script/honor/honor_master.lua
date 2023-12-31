-------------------------------------------------------------------------
-- FileName		:	honor_master.lua
-- Author		:	zhangyifan
-- CreateTime	:	2009-05-12
-- Desc			:   排名npc
-------------------------------------------------------------------------

Include( "\\script\\honor\\honor_head.lua" )
Include( "\\script\\task\\system\\task_string.lua" )
Include("\\script\\lib\\awardtemplet.lua")


tbHonor_Sys_2009.nHonor_QuestTime_Task = 2599
tbHonor_Sys_2009.nHonor_QuestChance_Task = 2600 -- 0 没有答题机会了, 1 有一次答题机会, 2 有两次答题机会两, 3 没接任务, 4答对问题可以领奖了 

tbHonor_Sys_2009.tbMasterContent = 
{
	strTalk1 = "<dec><npc>Ta l� 阯g ch� � y, n琲 y t nh鱪g b鴆 甶猽 kh綾 c馻 th藀 i cao th� 琻g i. Ngi c� th� t飝 � tham quan nh璶g kh玭g 頲 l祄 h� h醤g b蕋 c� th� g� trong . Ngo礽 ra t筰 y c� 1 nhi謒 v� nh�, ngi c� mu鑞 tham gia kh玭g?",
	strTalk2 = "<dec><npc>N琲 y 頲 g鋓 l� Danh Nh﹏ Л阯g v� c騨g l� n琲 vinh danh c竎 i cao th� trong v� l﹎, ch� c莕 頲 th� gian c玭g nh薾 l� cao th� th� � n琲 y s� c� m閠 b鴆 tng m� c竎 nh﹏ s� kh竎 ph秈 ao c.",
	strTalk3 = "<dec><npc>Nhi謒 v� n祔 r蕋 n gi秐, ngi 甶 quan s竧 nh鱪g b鴆 tng kia l� ai r錳 quay tr� v� y t譵 ta, ta s� h醝 m閠 s� c﹗. Tr� l阨 ng th� ph莕 thng s� thu閏 v� ngi!",
	strTalk4 = "<dec><npc>Ngi 甶 nhanh th�? Х chu萵 b� xong ch璦?",
	strTalk5 = "<dec><npc>H玬 nay ngi c� <color=green>%d<color> c� h閕 tr� l阨 c﹗ h醝 <enter>Trong b秐g x誴 h筺g giang h� <color=yellow>%s<color> ngi th�<color=yellow>%d<color> l� ai?",
	strTalk6 = "<dec><npc>H玬 nay  tr� l阨 c﹗ h醝 n祔 r錳, xin i ng祔 mai h穣 ti誴 t鬰.",
	strTalk7 = "<dec><npc>Ch骳 m鮪g c﹗ tr� l阨 ng!",
	strTalk8 = "<dec><npc>Th藅 ng ti誧! C﹗ tr� l阨 kh玭g ch輓h x竎, ng祔 mai h穣 n l筰 nh�!",
	strTalk9 = "<dec><npc>Ch骳 m鮪g i hi謕  畂竛 ng c﹗ h醝! Nh璶g h祅h trang kh玭g  ch�, xin m阨  th鮝  <color=green>3<color> � tr鑞g trong h祅h trang r錳 n nh薾 l筰 nh�!",
	strSelect1 = "Xin h醝 y l� n琲 n祇?/#tbHonor_Sys_2009:master_introduce()",
	strSelect2 = "Ta mu鑞 nh薾 nhi謒 v�/#tbHonor_Sys_2009:master_quest()",
	strSelect3 = "C﹗ h醝 th藅 n gi秐, ta 甶 xong v� ngay./#tbHonor_Sys_2009:accept_quest()",
	strSelect4 = "Х chu萵 b� xong/#tbHonor_Sys_2009:doing_quest()",
	strReturn = "Ta c遪 m閠 s� v蕁  c莕 h醝/#tbHonor_Sys_2009:master_main()",
	strCancel1 = "K誸 th骳 i tho筰/#tbHonor_Sys_2009:master_onCancel()",
	strCancel2 = "B﹜ gi� ta c� ch髏 vi謈 b薾, s� quay l筰 sau./#tbHonor_Sys_2009:master_onCancel()",
	strCancel3 = "Ta c遪 m閠 s� vi謈 kh竎, s� quay l筰 sau./#tbHonor_Sys_2009:master_onCancel()",
	strCancel4 = "Ta v蒼 ch璦 chu萵 b� xong./#tbHonor_Sys_2009:master_onCancel()",
}

tbHonor_Sys_2009.tb_reward = 
{
    {
        {szName = "Ti猲 Th秓 L� ", tbProp={6, 1, 71, 1, 0, 0}, nCount = 3, nBindState = -2}
    }
}
	

function main()
	tbHonor_Sys_2009:master_main()
end

function tbHonor_Sys_2009:master_main()
	local tbTalk = {};
	tbTalk[getn(tbTalk)+1] = self.tbMasterContent.strTalk1;
	tbTalk[getn(tbTalk)+1] = self.tbMasterContent.strSelect1;
	tbTalk[getn(tbTalk)+1] = self.tbMasterContent.strSelect2;
	tbTalk[getn(tbTalk)+1] = self.tbMasterContent.strCancel1;
	CreateTaskSay(tbTalk);
end

function tbHonor_Sys_2009:master_introduce()
	local tbTalk = {};
	tbTalk[getn(tbTalk)+1] = self.tbMasterContent.strTalk2;
	tbTalk[getn(tbTalk)+1] = self.tbMasterContent.strReturn;
	tbTalk[getn(tbTalk)+1] = self.tbMasterContent.strCancel1;
	CreateTaskSay(tbTalk);
end

function tbHonor_Sys_2009:master_quest()
	self:reset_task();
	
	local nQuestChance = GetTask(self.nHonor_QuestChance_Task);
	
	local tbTalk = {};
	
	if (nQuestChance == 3) then
		tbTalk[getn(tbTalk)+1] = self.tbMasterContent.strTalk3;
		tbTalk[getn(tbTalk)+1] = self.tbMasterContent.strSelect3;
		tbTalk[getn(tbTalk)+1] = self.tbMasterContent.strCancel2;
	elseif (nQuestChance == 1 or nQuestChance == 2) then
		tbTalk[getn(tbTalk)+1] = self.tbMasterContent.strTalk4;
		tbTalk[getn(tbTalk)+1] = self.tbMasterContent.strSelect4;
		tbTalk[getn(tbTalk)+1] = self.tbMasterContent.strCancel3;
	elseif (nQuestChance == 4) then
		self:give_reward();
		return
	else
		tbTalk[getn(tbTalk)+1] = self.tbMasterContent.strTalk6;
		tbTalk[getn(tbTalk)+1] = self.tbMasterContent.strCancel1;
	end
	
	CreateTaskSay(tbTalk);
end

function tbHonor_Sys_2009:accept_quest()
	self:reset_task();
	SetTask(self.nHonor_QuestChance_Task, 2);
end

function tbHonor_Sys_2009:doing_quest()
	self:reset_task();
	
	local nQuestChance = GetTask(self.nHonor_QuestChance_Task);
	
	if (nQuestChance == 2 or nQuestChance == 1) then
        local tbTalk = {};
		local tbLadder;
		local nLimit = 100;
	
		repeat
		    local nPos = random(1,getn(self.tbHonor_Ladder_List));
		    tbLadder = self.tbHonor_Ladder_List[nPos];
		    nLimit = nLimit - 1;
		until tbLadder.nCount ~= 0 or nLimit <= 0
		
		local nTotal = tbLadder.nCount;

		if (nTotal == 0) then
		    return
		end
		
		local nTotalSelection = min(nTotal, 4);

		local nRightIdx = random(1, nTotalSelection);

		local i = 1;
		local k = 1;
		local tbSelect = {};
		while i <= nTotalSelection do
		    local nPos = random(1, nTotal);
		    local bNewPos = 1;

	        for k = 1, nTotalSelection do
	            if(nPos == tbSelect[k])then
	                bNewPos = 0;
	            end
	        end
	        if bNewPos == 1 then
	            tbSelect[i] = nPos;
	            if (i == nRightIdx)then
	                tbTalk[1] = format(self.tbMasterContent.strTalk5, nQuestChance, tbLadder.strName, nPos);
	                tbTalk[i + 1] = format("%s/#tbHonor_Sys_2009:right_answer()", tbLadder.tbLadder[nPos].strPlayerName);
	            else
	                tbTalk[i + 1] = format("%s/#tbHonor_Sys_2009:wrong_answer()", tbLadder.tbLadder[nPos].strPlayerName);
	            end
	            i = i + 1;
	        end
		end
		tbTalk[getn(tbTalk)+1] = self.tbMasterContent.strCancel4;
        CreateTaskSay(tbTalk);
	end
	
end

function tbHonor_Sys_2009:right_answer()
	self:reset_task();
    local nQuestChance = GetTask(self.nHonor_QuestChance_Task);
	
	if (nQuestChance == 2 or nQuestChance == 1) then
		SetTask(self.nHonor_QuestChance_Task, 4);
		local tbTalk = {};
		if (CalcFreeItemCellCount() >= 3) then
		    tbTalk[getn(tbTalk)+1] = self.tbMasterContent.strTalk7;
		    self:give_reward();
        else
            tbTalk[getn(tbTalk)+1] = self.tbMasterContent.strTalk9;
		end

	    tbTalk[getn(tbTalk)+1] = self.tbMasterContent.strCancel1;
        CreateTaskSay(tbTalk);
	end
end

function tbHonor_Sys_2009:wrong_answer()
    self:reset_task();
    local nQuestChance = GetTask(self.nHonor_QuestChance_Task);
    
    if (nQuestChance == 2) then
        SetTask(self.nHonor_QuestChance_Task, 1);
        self:doing_quest()
        return
    end
    
    local tbTalk = {};
	SetTask(self.nHonor_QuestChance_Task, 0);
    tbTalk[getn(tbTalk)+1] = self.tbMasterContent.strTalk8;
	tbTalk[getn(tbTalk)+1] = self.tbMasterContent.strCancel1;
    CreateTaskSay(tbTalk);
end

function tbHonor_Sys_2009:give_reward()
    self:reset_task();

	local nQuestChance = GetTask(self.nHonor_QuestChance_Task);

	if (nQuestChance == 4) then
	    if (CalcFreeItemCellCount() < 3) then
	        local tbTalk = {};
	        tbTalk[getn(tbTalk)+1] = self.tbMasterContent.strTalk9;
	        tbTalk[getn(tbTalk)+1] = self.tbMasterContent.strCancel1;
            CreateTaskSay(tbTalk);
        else
            tbAwardTemplet:GiveAwardByList(self.tb_reward, "Honor System Answer Reward");
	        SetTask(self.nHonor_QuestChance_Task, 0);
	    end
	end
end

function tbHonor_Sys_2009:reset_task()
    local nQuestTime = GetTask(self.nHonor_QuestTime_Task);
	local nQuestChance = GetTask(self.nHonor_QuestChance_Task);
	local nCurTime = tonumber(GetLocalDate("%Y%m%d"));
	
	if (nQuestTime ~= nCurTime) then
	    nQuestTime = nCurTime;
	    nQuestChance = 3; -- 没接任务状态
	    SetTask(self.nHonor_QuestTime_Task, nQuestTime);
	    SetTask(self.nHonor_QuestChance_Task, nQuestChance);
	end
end

function tbHonor_Sys_2009:master_onCancel()

end