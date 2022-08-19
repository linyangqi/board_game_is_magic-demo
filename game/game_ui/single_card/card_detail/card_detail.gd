extends Node


func _unhandled_input(event):
	if event.is_action("detail_clear"):
		free()

