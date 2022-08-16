extends "res://cards/characters/abilities/ability_basic.gd"
#ps：检查器中，技能名字在下面一栏了（因为是父类的属性）

@export var check_range := false # 绿色无限范围，红色范围限制

#还有一个注意：主动技能可能在回合的各个阶段使用，比如博士，可以在移动和攻击两个阶段都使用主动技能
func use():
	pass
