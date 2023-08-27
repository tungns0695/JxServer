-- ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½Æ·ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½Ò»ï¿½ï¿½ï¿½ï¿½Æ·ï¿½ï¿½
-- By: Yuning_liu(2005-03-21)

function main(sel)
	p=random(0,99)
	if (p < 1) then
		p = random(238,240)
		AddEventItem(p)			-- Ã‹Â®Ã¯Â¿Â½Ã¯Â¿Â½
		Msg2Player("B¹n nhËn ®­îc <color=yellow>Thñy tinh . ")
	elseif (p < 2) then
		AddEventItem(353)			-- Ã¯Â¿Â½Ã‰ÂºÃ¯Â¿Â½
		Msg2Player("B¹n nhËn ®­îc <color=yellow>ViÂªn tinh hång b¶o th¹ch. ")
        elseif (p < 33) then
		AddItem(6,1,1100,0,0,0)		-- Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½
		Msg2Player("B¹n nhËn ®­îc <color=yellow>B¸nh kem. ")
	elseif (p < 33) then
		AddItem(4,417,1,0,0,0)		-- Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½
		Msg2Player("B¹n nhËn ®­îc <color=yellow>TiÒn ®ång may m¾n. ")
	elseif (p < 66) then
		AddItem(4,417,1,0,0,0)		-- Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã“Â¡
		Msg2Player("B¹n nhËn ®­îc <color=yellow>TiÒn ®ång may m¾n! ")
	else
		AddItem(4,417,1,0,0,0)		-- ÃƒÂµÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½
		Msg2Player("B¹n nhËn ®­îc <color=yellow>TiÒn ®ång may m¾n!. ")
	end
	return 0
end
