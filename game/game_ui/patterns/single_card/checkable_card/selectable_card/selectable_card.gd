extends CheckableCard
class_name SelectableCard
#仅作显示用，甚至不带卡牌名称，不过可以返回编号之类

var selected := false


func _gui_input(event):
	#函数复写会直接清空父类吗……
	if event.is_action_pressed("check_detail"):
		add_detail_view()
	elif event.is_action_pressed("select_card"):
		selected = !selected
	
	if selected:
		modulate = Color.YELLOW
	else:
		modulate = Color.WHITE
