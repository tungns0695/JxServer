function main(nItemIdx)	
	local nG, nD, nP = GetItemProp(nItemIdx);
	if nP~=4571 then
		return 1
	end
	AddStackItem(200,6,1,1509,1,0,0)
	Msg2Player("Nh�n ���c 200 Nguy�n Li�u.")
end;