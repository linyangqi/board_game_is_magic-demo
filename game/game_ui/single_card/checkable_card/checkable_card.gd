extends TextureButton
class_name CheckableCard
const detail_view = preload("res://game/game_ui/single_card/card_detail/card_detail.tscn")

func _on_card_in_ui_toggled(button_pressed):
	var detail = detail_view.instantiate()
	$"%DetailView".add_child(detail)
	detail.texture = texture_normal
