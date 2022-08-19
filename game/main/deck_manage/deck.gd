extends Node
class_name Deck

signal run_out #本来想加debt_count，不过感觉记录“欠牌数”好像没什么意义了……？

var cards:Array[String] #现在使用文本方式对其调用了
#设置，加减，打乱

func add_cards_by_plan(amount_plan:Dictionary): #初始设置牌库
	for card_name in amount_plan.keys():
		for i in amount_plan[card_name]: #键：名称；值：数量
			cards.append(card_name)
	shuffle()

func shuffle():
	cards.shuffle()

#func take_card()->String:
#	return cards.pop_back() #规则：数组末尾视为牌库顶


func take_cards(count:int=1)->Array[String]:
	var takings:Array[String] = []
	var card_remain = cards.size()
	if count <= card_remain:
		for i in count: #godot允许这种语法，相当于range(count)
			takings.append(cards.pop_back())
	else:
		for i in card_remain: 
			takings.append(cards.pop_back())
		emit_signal("run_out")
	return takings
	
func receive_card(received_card:String):
	cards.append(received_card)

func receive_cards(received_cards:Array[String]):
	cards.append_array(received_cards)
