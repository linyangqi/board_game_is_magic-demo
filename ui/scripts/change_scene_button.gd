extends BaseButton

@export var scene_path:String = ""

func _pressed():
	get_tree().change_scene_to_file(scene_path)
#	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
