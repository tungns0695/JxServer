-- So thu tu NPC la so trong npcs.xlss - 2, trong data co den npc 2481

dialognpc_vuhon = { 
{2529,53,1624,3197,"\\script\\global\\vuhon\\hauquan_vuhon.lua","H�u Qu�n V� H�n"}, 
{2530,1042,1694,3045,"\\script\\global\\vuhon\\vuhon_nothing.lua","Nh�c L�i"}, 
{2531,1042,1680,2880,"\\script\\global\\vuhon\\vuhon_nothing.lua","Ng�u Th�ng"}, 
{2532,1042,1688,3056,"\\script\\global\\vuhon\\vuhon_nothing.lua","H�n Th��ng ��c"},
{2533,1042,1744,3248,"\\script\\global\\vuhon\\vuhon_nothing.lua","Thi Phong"},  
{2534,1042,1768,3184,"\\script\\global\\vuhon\\vuhon_nothing.lua","Thang Anh"},
{2535,1042,1600,3008,"\\script\\global\\vuhon\\vuhon_nothing.lua","H�n Kh�i Ph�ng"},  
{2536,1042,1592,2995,"\\script\\global\\vuhon\\vuhon_nothing.lua","Nh�c ��nh"},
{2537,1042,1623,3123,"\\script\\global\\vuhon\\vuhon_nothing.lua","Ng� Li�n"},
{2542,1042,1789,3204,"\\script\\global\\vuhon\\vuhon_nothing.lua","Y S�"},
{2543,1042,1804,3240,"\\script\\global\\vuhon\\vuhon_nothing.lua","D� ��i Ch�y"},
{2544,1042,1673,3305,"\\script\\global\\vuhon\\vuhon_nothing.lua","Nh�c Nh� N��ng"},
{625,1042,1551,3198,"\\script\\changefeature\\npc\\box.lua","R��ng ch�a ��"},
}

function add_npc_vuhon()
	add_dialognpc(dialognpc_vuhon) -- c� s�n trong autoexec.lua
end