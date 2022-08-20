extends CanvasLayer

#同级，也是信息来源
@onready var character_manager = $"../CharacterManager"
@onready var deck_manager = $"../DeckManager"
@onready var world_map = $"../WorldMap"

#子级，也是UI操纵处


func _update(data_manager:Node):
	pass
