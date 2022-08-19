extends Node

@onready var map = $Map

var chessman_atlas=[
	Vector2(0,0), Vector2(1,0), Vector2(2,0),
	Vector2(0,1), Vector2(1,1), Vector2(2,1),
	Vector2(0,2), Vector2(1,2),
]

var chess_coordinates:Array[Vector2i]

func update_chessmen(new_chess_coordinates:Array[Vector2i]):
	for i in chess_coordinates.size():
		map.set_cell(1,chess_coordinates[i],1)
	for i in new_chess_coordinates.size():
		map.set_cell(1,new_chess_coordinates[i],1,chessman_atlas[i])
	chess_coordinates = new_chess_coordinates


func _ready():
	for i in range(10):
		map.set_cell(1,Vector2(i,-1),1,chessman_atlas[0])
