extends TextureButton

@export var card_name:String = ""


func _ready():
	pass

var rect := Rect2(Vector2.ZERO,size)


func _on_card_in_ui_toggled(button_pressed):
	if button_pressed:
		modulate = Color.YELLOW
	else:
		modulate = Color.WHITE
		
func _input(event):
#	if event is InputEventMouseButton and event.is_action("read_card") :
	if rect.has_point(event.position):
		print(233)
