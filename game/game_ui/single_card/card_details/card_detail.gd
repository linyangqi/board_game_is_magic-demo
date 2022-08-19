extends Node


func _input(event):
	if event.is_action("detail_clear"):
		free()


func _on_card_detail_button_down():
	free()
