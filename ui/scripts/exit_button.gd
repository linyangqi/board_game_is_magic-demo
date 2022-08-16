extends BaseButton

func _pressed():
	if OS.get_name() != "HTML5" :
		get_tree().quit()
