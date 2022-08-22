extends TextureRect

@onready var agent:Node = $"/root/SignalAgent"
@onready var chessman = $".."

func _gui_input(event):
	if event.is_action_pressed("click"):
		agent.focus_on_chessman_by_id(chessman.chessman_id)
		
