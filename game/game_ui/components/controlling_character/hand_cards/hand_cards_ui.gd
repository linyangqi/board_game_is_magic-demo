extends GrabableScroll


@export var hand_card_names:Array[String] #连接所用

@onready var container = $Container #真正的数据处
var hand_cards:Array[Node] #只是连接所挂节点，防止重复get_children

var card_unit:Resource = load(
	"res://game/game_ui/components/controlling_character/hand_cards/hand_card_ui.tscn"
	)  #有些卡牌大小之类的设置，大概还是这样方便些




func init(linking_hand_card_names:Array[String]):
	#仍然只是连接而非复制
	hand_card_names = linking_hand_card_names


func _update():#但是这里这样写的话，多次update反而会重复挂节点了……（bug，得修）
	#一种方案是，加节点前先解除所有子节点
	for node in hand_cards:
		node.free()
	
	#然后再挂节点
	for card_name in hand_card_names:
		var new_card = card_unit.instantiate()
		new_card.texture = CardLibrary.load_card(card_name).texture
		container.add_child(new_card)#应该new吧
	hand_cards = container.get_children()

func selected_card_id() -> Array[int]:
	var card_id_list:Array[int]
	for i in hand_cards.size():
		if hand_cards[i].selected:
			card_id_list.append(i)
	return card_id_list
