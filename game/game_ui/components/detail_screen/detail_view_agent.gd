extends Node

signal add_detail_view_signal(texture)

func add_detail_view(texture:Texture2D):
	emit_signal("add_detail_view_signal",texture)
