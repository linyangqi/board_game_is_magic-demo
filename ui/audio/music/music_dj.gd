extends Node

@export var now_playing :=1

#func _ready():
#	get_node(str(now_playing)).playing = true


func _on_music_change(music_id:int):
	
	if now_playing != music_id and music_id != 0 :
		get_node(str(now_playing)).playing = false
		get_node(str(music_id)).playing = true
		
	if get_node(str(music_id)).playing == false:
		get_node(str(music_id)).playing = true
	now_playing = music_id
