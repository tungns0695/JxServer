--中原南区 扬州府 赌徒3对话
Include("\\script\\task\\newtask\\branch\\zhongli\\branch_zhonglitasknpc.lua")
Include("\\script\\task\\newtask\\newtask_head.lua")
function main(sel)
	Uworld1054 = nt_getTask(1054)
	if ( Uworld1054 ~= 0 ) then
		branch_dugun()
	else
		Say("Tng l� d� th緉g 頲 m蕐 v竛, k誸 qu� l筰 thua n鱝! Th藅 kh玭g nh l遪g!", 0);
	end
end;




