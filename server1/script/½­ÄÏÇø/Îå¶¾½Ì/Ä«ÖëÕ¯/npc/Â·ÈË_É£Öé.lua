-- 五毒 路人NPC 墨蛛寨主桑珠 10级任务
-- by：Dan_Deng(2003-08-05)

-- 修改后与邪教主线相关的桑珠脚本
-- Edited by peres
-- 2005/01/18

Include("\\script\\task\\newtask\\newtask_head.lua");
Include("\\script\\task\\newtask\\lib_setmembertask.lua");
Include("\\script\\task\\newtask\\master\\xiepai\\maintask.lua");

Include("\\script\\global\\skills_table.lua");

function main()

-- 新任务系统与邪教主线相关的脚本 --

local myTaskValue = GetTask(1003)
local myCamp = nt_getCamp()

		
	if (myTaskValue==151) then
		task_level30_14();
		return
	end


-- 新任务系统与邪教主线相关的脚本 --


	UTask_wu = GetTask(10)
	if (GetSeries() == 1) and (GetFaction() == "wudu") then
		if (UTask_wu == 10*256+10) then		--10级任务进行中
			i = GetItemCount(86)
			if (i >= 10) and (HaveItem(220) == 1) then
				Talk(1,"L10_prise","Tang tr筰 ch�! Зy l� nh襫 nh謓 v� t輓 th筩h m� ngi c莕")
			else
				Talk(1,"","у v藅 v蒼 ch璦 c� , t筰 sao l筰 ch薽 nh� v藋? Mau l猲! Mau l猲!")
			end
		elseif ((UTask_wu == 10*256) and (GetLevel() >= 10)) then		--10级任务
			Say("V藅 li謚  cho ta luy謓 c玭g v蒼 c遪 thi誹. Ngi h穣 甶 l猲 Nh筺 Хng s琻 b総 th猰 cho ta 10 con nh謓 v� mua th猰 10 bao t輓 th筩h",2,"Tu﹏ l謓h!/L10_get_yes","Th藅 xin l鏸! T筰 h� c遪 c� chuy謓 ph秈 l祄!/L10_get_no")
		else							-- 常规对话
			Talk(1,"","C竔 t猲 b総 c鉩 con c馻 ta v蒼 c遪 s鑞g s� s�. N誹 nh� ta b総 頲 h緉 th� ta s� ph� h誸 xng c鑤 c馻 h緉, sau  d飊g th﹏ th� c馻 h緉  luy謓 'Tri th� c'. Ta s� l祄 cho h緉 產u n, mu鑞 ch誸 kh玭g 頲, mu鑞 s鑞g kh玭g xong!")
		end
	else
		Talk(1,"","Kh玭g bi誸 con trai ta b﹜ gi� sao r錳, c� 頲 b譶h an v� s� kh玭g�.")
	end

end;

function L10_get_yes()
	Talk(1, "", "Mau 甶 mau v�! Ta 產ng c莕 d飊g!")
	SetTask(10,10*256+10)
	AddNote("Gi髉 Tang Ch﹗ t譵 10 con nh謓 v� 10 bao T輓 th筩h.")
	Msg2Player("Gi髉 Tang Ch﹗ t譵 10 con nh謓 v� 10 bao T輓 th筩h.")
end;

function L10_get_no()
	Talk(1,"","Hay l緈! Th藅 kh玭g th� tin 頲!")
end;

function L10_prise()
	Talk(1,"","T鑤 l緈! Ngi lui ra 甶! ng c� ng╪ tr� ta luy謓 c玭g!")
	DelItem(220)
	for i = 1, GetItemCount(86) do DelItem(86) end
	SetTask(10,20*256)
	SetRank(50)
--	AddMagic(62)
--	AddMagic(60)
--	AddMagic(67)
	add_wu(20)			-- 调用skills_table.lua中的函数，参数为学到多少级技能。
	Msg2Player("Ch骳 m鮪g b筺! B筺 頲 th╪g l� 箃 H錸 T秐 Nh﹏! H鋍 頲 v� c玭g Ng� чc Chng Ph竝, Ng� чc o Ph竝, C鰑 Thi猲 Cu錸g L玦.")
	AddNote("Gi髉 Tang Ch﹗ t譵 con nh謓 v� T輓 th筩h. Л頲 phong l� 箃 H錸 T秐 Nh﹏.")
end;
