extends Control

@onready var id_label = $IDLabel
@onready var chessman_button = $ChessmanButton

var chessman_id:int

func _update(new_chessman_id:int):
	chessman_id = new_chessman_id
	id_label.text = str(chessman_id)
	chessman_button.modulate = Chessman.color_by_id(chessman_id)
