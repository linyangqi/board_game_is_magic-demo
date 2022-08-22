extends Node

signal add_detail_view_signal(texture)
signal focus_on_chessman_by_id_singal(chessman_id)

func add_detail_view(texture:Texture2D):
	emit_signal("add_detail_view_signal",texture)


func focus_on_chessman_by_id(chessman_id:int):
	emit_signal("focus_on_chessman_by_id_singal",chessman_id)

