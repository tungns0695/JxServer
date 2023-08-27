Include("\\script\\global\\thinh\\hotro\\functions_ngoaitrang.lua")
Include("\\script\\changefeature\\feature_man.lua")

function main()
	dofile("script/item/biggift.lua")
	switch_check_feature()
	return 1
end

function switch_check_feature()
	local szTitle = "Xin ch�o! ��i hi�p mu�n ki�m ngo�i trang g�?"
	local tbOpt =
	{
		"Ng�a/#choose_check_feature(4)",
		"V� Kh�/#choose_check_feature(3)",
		"Ao gi�p/#choose_check_feature(2)",
		"M�/#choose_check_feature(1)",
		"M�t n�/#choose_check_feature(0)",
		"C�c ch�c n�ng v� ngo�i trang/ngoaitrang",
		"Nh�n bao l� x�/nhanlixi",
		"Tho�t/no",
	}
	Say(szTitle, getn(tbOpt), tbOpt)
end


function nhanlixi()
	AddItem(6,1,13,1,0,0,0)
	AddItem(6,1,14,1,0,0,0)
	Msg2Player("�� nh�n 2 bao l� x�.")
end

function choose_check_feature(num)
	SetTaskTemp(168, num)
end