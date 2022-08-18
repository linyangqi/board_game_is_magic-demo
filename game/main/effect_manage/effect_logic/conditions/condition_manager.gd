extends Condition

#作用：收到指示后，检查子节点中的各个条件是否满足，并返回”是否通过“
func passed() -> bool:
	var passed := true
	for condition in get_children():
		if not condition.passed():
			passed = false
	return passed	
