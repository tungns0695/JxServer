--西北南区 凤翔府 路人8阿牛对话

Include("\\script\\task\\newtask\\branch\\zhongli\\branch_zhonglitasknpc.lua")
Include("\\script\\task\\newtask\\newtask_head.lua")
function main(sel)
	Uworld1055 = nt_getTask(1055)
	if ( Uworld1055 ~= 0 ) then
		branch_aniu()
	else
		Say("Ngi ta n鉯 N� Oa p nh蕋, c騨g kh玭g bi誸 l� th藅 hay gi� n鱝!",0)
	end
end;