-- So thu tu NPC la so trong npcs.xlss - 2

dialognpc_thinh = { 
{1393,53,1631,3172,"\\script\\global\\thinh\\npc\\npc_trangbi.lua","NPC Trang B�"}, 
{1393,78,1589,3286,"\\script\\global\\thinh\\npc\\npc_trangbi.lua","NPC Trang B�"}, 
{173,53,1635,3177,"\\script\\global\\thinh\\npc\\npc_vocong.lua","NPC V� C�ng"}, 
--{644,78,1574,3206,"\\script\\global\\thinh\\npc\\ong_gia_noel.lua","�ng gi� Noel"},
{1393,78,1584,3216,"\\script\\global\\thinh\\npc\\hangnga_vuto.lua","H�ng Nga V� To"},
{2519,78,1601,3231,"\\script\\global\\thinh\\npc\\belongtrungthu.lua","C�y Hoa Tuy�t"},
{1334,78,1569,3215,"\\script\\global\\thinh\\npc\\belongtrungthu.lua",""},
{1968,78,1571,3232,"\\script\\global\\thinh\\npc\\belongtrungthu.lua","."},
{1216,78,1590,3217,"\\script\\global\\thinh\\npc\\belongtrungthu.lua",""},
{705,969,1593,3171,"\\script\\global\\thinh\\npc\\belongtrungthu.lua","T�u Th�ch M�t C�c"},
{705,969,1594,3171,"\\script\\global\\thinh\\npc\\belongtrungthu.lua","T�u Th�ch M�t C�c"},
{705,969,1594,3177,"\\script\\global\\thinh\\npc\\belongtrungthu.lua","T�u Th�ch M�t C�c"},
{705,969,1593,3178,"\\script\\global\\thinh\\npc\\belongtrungthu.lua","T�u Th�ch M�t C�c"},
{705,969,1595,3174,"\\script\\global\\thinh\\npc\\belongtrungthu.lua","T�u Th�ch M�t C�c"},
{705,969,1596,313,"\\script\\global\\thinh\\npc\\belongtrungthu.lua","T�u Th�ch M�t C�c"},
{705,969,1592,3175,"\\script\\global\\thinh\\npc\\belongtrungthu.lua","T�u Th�ch M�t C�c"},
{705,969,1593,3172,"\\script\\global\\thinh\\npc\\belongtrungthu.lua","T�u Th�ch M�t C�c"},
{705,969,1593,3171,"\\script\\global\\thinh\\npc\\belongtrungthu.lua","T�u Th�ch M�t C�c"},


 
}


function add_npc_thinh()
	add_dialognpc(dialognpc_thinh) -- c� s�n trong autoexec.lua
end