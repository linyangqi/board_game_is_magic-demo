extends Control

#之前的代码是试图通过唯一名直接找到DetailScreen，但是经常出错
#后面是用信号以及一个全局节点中介来处理（成功了）

const detail_view = preload(
	"res://game/game_ui/components/detail_screen/card_detail/card_detail.tscn")

@onready var agent := $"/root/SignalAgent"

func _ready():
	agent.connect("add_detail_view_signal", add_detail_view)

func add_detail_view(texture:Texture2D):
	var detail = detail_view.instantiate()
	detail.texture = texture
	add_child(detail)
	
