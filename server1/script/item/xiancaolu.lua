IncludeLib("SETTING"); --ÔØÈëSETTING½Å±¾Ö¸Áî¿â

function main()
--	--Msg2Player("´Ë¹¦ÄÜÉÔºó¿ª·Å.¶àĞ»Ö§³Ö!")
--	--return 1
--	if (GetNpcExpRate() <= 100) then
if GetSkillState(440) > 0 then
 Say("B¹n ®ang sµi Tiªn Th¶o Lé. Xin H·y TiÕt KiÖm")
 return 1
end
		AddSkillState(440, 1, 1, 64800,1);
--	else
--		Say("Xin lçi! T¹m thêi kh«ng thÓ sö dông ®­îc Tiªn Th¶o Lé. ", 0)
--		return 1
--	end
--	return 0
end