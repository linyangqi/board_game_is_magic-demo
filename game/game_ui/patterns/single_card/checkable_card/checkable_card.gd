extends TextureRect
class_name CheckableCard
#仅作显示用，不参与角色属性与技能存储功能
#保证场景树中存在DetailScreen（唯一名）

const detail_view = preload(
	"res://game/game_ui/patterns/single_card/card_detail/card_detail.tscn")
@onready var detail_screen := get_node("%DetailScreen")

#场景实例化后，节点寻找好像就隔一部分，必须要get_owner往上才能找了
func find_screen(): 
	var base_node := $"."
	while detail_screen == null: #找不到就迭代向前寻找
		base_node = base_node.get_owner()
		detail_screen = base_node.get_node("%DetailScreen")


func _gui_input(event):
	if event.is_action_pressed("check_detail"):
		find_screen()
		var detail = detail_view.instantiate()
		detail_screen.add_child(detail)
#		get_tree().root.add_child(detail)
		detail.texture = texture
