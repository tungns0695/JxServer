function main()
	--使用后10分钟内，生命和内力增加50％
	AddSkillState(458,1,0,10*60*18)	--血量
	AddSkillState(459,1,0,10*60*18)	--内力
	Msg2Player("<#> N閕 trong 10 ph髏, Sinh l鵦 v� N閕 l鵦 c馻 b筺 s� t╪g th猰 50%")
end