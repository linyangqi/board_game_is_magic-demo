extends CanvasLayer

#同级，也是信息来源
@onready var character_manager = $"../CharacterManager"
@onready var deck_manager = $"../DeckManager"
@onready var world_map = $"../WorldMap"

#子级，也是UI操纵处
@onready var controlling_character = $ControllingCharacter




func _update(data_manager:Node):
	pass

func set_controlling_character(character_place:CharacterPlace):
	controlling_character.init(character_place)
