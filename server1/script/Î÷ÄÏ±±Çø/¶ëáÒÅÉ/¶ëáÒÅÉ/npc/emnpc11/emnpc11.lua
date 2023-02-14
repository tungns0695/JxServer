--description: 峨嵋派妙隐相公
--author: yuanlan	
--date: 2003/3/4
-- Update: Dan_Deng(2003-08-12)
Include ("\\script\\event\\springfestival08\\allbrother\\findnpctask.lua")
function main()
	if allbrother_0801_CheckIsDialog(207) == 1 then
		allbrother_0801_FindNpcTaskDialog(207)
		return 0;
	end
	UTask_em = GetTask(1);
	if (UTask_em == 10*256+20) then					--接到10级任务
		if (HaveItem(19) == 1) then
			Talk(1,"","Ta ch� tin m鮪g c馻 mu閕! ")
		else
			Talk(3, "L10_step1", "Di謚 萵 s� t�  cho mu閕 bi誸 chuy謓 c馻 i ca, ta s� ngh� c竎h gi髉 h祅 gng l筰. Чi ca h穣 a n鯽 m秐h gng kia a cho ta 頲 kh玭g? ", "V藋 ta tr玭g ch� v祇 mu閕, mu閕 d� nh l祄 g�?", "Mu閕 n t譵 Th� r蘮 � Th祅h Й xem c� c竎h g� kh玭g?")
		end
	elseif (UTask_em == 10*256+60) then 					--铜镜已补好
		Talk(2, "", "Чi ca! Xem 甶! Mu閕  s鯽 gng ng xong! ", "T鑤 l緈! H穣 a gng ng cho nng t� c馻 ta! ")
	elseif (UTask_em == 10*256+70) and (HaveItem(20) == 1) then		--任务最后一步
		Talk(2, "", "Чi ca! Di謚 萵 s� t� nh� mu閕 mang m秐h gng n祔 trao cho huynh. Nh緉 nh� huynh c� b籲g l遪g i t� 3 n╩ kh玭g? 3 n╩ sau t� s� tr� v� b猲 huynh.", "Phi襫 ngi nh緉 v韎 nng t� ta, d� ph秈 i bao l﹗ ta c騨g i n祅g v�!")
		DelItem(20)
		SetTask(1, 10*256+80)
		AddNote("Mang gng ng giao cho tng c玭g c馻 Di謚 萵 v� chuy觧 nh鱪g t﹎ huy誸 c馻 huynh 蕐 n Di謚 萵 s� t� ")
		Msg2Player("Mang gng ng giao cho tng c玭g c馻 Di謚 萵 v� chuy觧 nh鱪g t﹎ huy誸 c馻 huynh 蕐 n Di謚 萵 s� t� ")
	elseif (UTask_em >= 10*256+80) then 					--任务完成后的对话
		Talk(1,"","Bao l﹗ ta c騨g i n祅g v�!")
	else
		Talk(1,"","V� ch錸g ta n bao gi� m韎 頲 g苝 nhau?")
	end
end;

function L10_step1()
	AddEventItem(19)
--	SetTask(1, 14)
	AddNote("T譵 頲 Tng c玭g c馻 Di謚 萵 � di n骾, v� nh薾 頲 n鯽 t蕀 gng ng b猲 ph秈. ")
	Msg2Player("T譵 頲 Tng c玭g c馻 Di謚 萵 � di n骾, v� nh薾 頲 n鯽 t蕀 gng ng b猲 ph秈. ")
end;
