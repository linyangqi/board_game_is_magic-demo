extends Node
#DeckManager往下的交互单位都是String，往外返回后，各位自己去library找path

var character_deck:Deck
var resource_deck:Deck
var bonus_deck:Deck
var discard_deck:Deck
var event_deck:Deck
var event_discard_deck:Deck

signal resource_run_out

#现在各个deck的特殊功能由manager管理，deck内部就不用分子类了吧
#理论上来说直接用Array也可以，不过万一Deck有一些一般功能呢……所以还是象征性地建一下类吧
func init():
	character_deck.add_cards_by_plan(DeckPlan.LIST["characters"])
	event_deck.add_cards_by_plan(DeckPlan.LIST["events"])
	resource_deck.add_cards_by_plan(DeckPlan.LIST["resource"])
	bonus_deck.add_cards_by_plan(DeckPlan.LIST["bonus"])
	
	resource_deck.connect("run_out", _on_resource_deck_run_out) 
	#connect的语法在4.0变了……直接加函数名，可以查错吧


#这里实际应该还有摸牌不足后的判断
func take_character(count:int = 4)->Array[String]:
	return character_deck.take_cards(count)

func take_event(count:int = 1)->Array[String]:
	return event_deck.take_card(count)
	
func take_resource(count:int = 2)->Array[String]:
	return resource_deck.take_cards(count)
	
func take_bonus(count:int = 1)->Array[String]:
	return bonus_deck.take_cards(count)

func receive_discards(cards:Array[String]):
	discard_deck.receive_cards(cards)
	
func receive_event_discards(cards:Array[String]): 
	#事件是基本上只能一个一个弃吧……但是保险起见，如果遇到一些“多事件并发”技能，日后还能统一这个格式
	event_discard_deck.receive_cards(cards)
	
	
func _on_resource_deck_run_out(): #摸牌堆耗尽
	emit_signal("resource_run_out")


