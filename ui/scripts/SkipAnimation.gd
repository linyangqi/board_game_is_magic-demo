extends AnimationPlayer

func _input(event):
	if not event is InputEventMouseMotion:
		current_animation = "RESET"
