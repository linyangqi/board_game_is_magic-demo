extends TextureRect
#仅作显示用

#新方法：全局节点（作为中介）加信号
@onready var agent := $"/root/SignalAgent"
#唯一名路径写法的确是%DetailScreen，但是@onready时还是无法正常初始化……所以还是用信号吧

#场景实例化后，节点寻找好像就隔一部分，必须要get_owner往上才能找了

func add_detail_view():
	agent.add_detail_view(texture.atlas)


func _gui_input(event):
	if event.is_action_pressed("check_detail"):
		add_detail_view()
		
