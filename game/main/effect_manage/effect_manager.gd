extends Node
#接收回合进度信号，并把信号下发给子节点（“效果”）
#“效果”实现依据time条件与此节点相连
#此节点实际上相当于一个“进度检查员”吧……？

#或者……扁平化操作？
#严格来讲……这里其实应该只放持续性的效果吧
#Playing Card是一个过程，不算事件吧……？

#单effect的操作
func effect_execute(effect:Effect):
	if effect.tags.has("compound"):
		for sub_effect in effect.get_children():
			effect_execute(sub_effect)
	if effect.tags.has("attack"):
		#TODO 攻击来源攻击目标 
		pass
	if effect.tags.has("damage"):
		pass

#####但是这样的话，不同角色的技能都加到这里，这里就显得太臃肿了吧
###那么还有别的办法吗……毕竟角色技能也会受一级调控的


#检查列表
func effect_modify(effect:Effect, modify_mode:String):
	match modify_mode:
		"attack":
			pass

#比方说 攻击——防御——破甲 这样的2次转折……其中部分会【触发】另外一部分？
