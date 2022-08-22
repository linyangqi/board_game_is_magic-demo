extends GrabableScroll


var card_unit:Resource = load(
	"res://game/game_ui/components/controlling_character/hand_cards/hand_card_ui.tscn"
	)
@onready var container = $Container


var hand_cards:Array[String]
func init(linking_hand_cards:Array[String]):
	#仍然只是连接而非复制
	hand_cards = linking_hand_cards


func _update():
	for card_name in hand_cards:
		var new_card = card_unit.instantiate()
		new_card.texture = CardLibrary.load_card(card_name).texture
		container.add_child(new_card)#应该new吧
