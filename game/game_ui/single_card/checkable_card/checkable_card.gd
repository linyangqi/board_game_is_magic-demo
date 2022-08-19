extends TextureButton
class_name CheckableCard
const detail_view = preload("res://game/game_ui/single_card/card_details/card_detail.tscn")

func _on_card_in_ui_toggled(button_pressed):
	var detail = detail_view.instantiate()
	get_tree().root.add_child(detail)
	detail.get_node("Texture").texture = texture_normal
