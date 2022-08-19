extends Control


func _input(event):
	if event.is_action("detail_checked"):
		free()
