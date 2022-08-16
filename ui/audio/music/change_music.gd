extends Node


@export var music_id := 1
#signal music_change(music_id)
@onready var dj := $"/root/MusicDj"

func _ready():
#	emit_signal("music_change")
#	connect("music_change",$"/root/MusicDj","_on_music_change",[music_id])
	dj._on_music_change(music_id)

