--ÌØĞ§ÏÉ²İÂ¶
--8Ğ¡Ê±¾­ÑéË«±¶
IncludeLib("SETTING"); --ÔØÈëSETTING½Å±¾Ö¸Áî¿â

function main()
--	if (GetNpcExpRate() <= 100) then
if GetSkillState(440) > 0 then
 Say("B¹n ®ang sµi Tiªn Th¶o Lé. Xin H·y TiÕt KiÖm")
 return 1
end
		AddSkillState(440, 1, 1, 64800 * 500,1);
--	else
--		Say("ThËt ®¸ng tiÕc, t¹m thêi kh«ng sö dông ®­îc Tiªn Th¶o Lé ®Æc biÖt.", 0)
--		return 1;
--	end;
--	return 0;
end;