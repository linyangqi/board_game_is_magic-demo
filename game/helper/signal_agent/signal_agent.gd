extends Node

signal add_detail_view_signal(texture)
signal focus_on_chessman_by_id_singal(chessman_id)
signal controlling_character_action_signal(action_name)
#signal character_action_signal(character, action_name)
signal character_action_play_cards_signal(character_place, card_id_array) #出牌
signal character_action_move_signal(character_place) #移动
signal character_action_switch_signal(character_place) #换牌（仅在有队友时）
signal character_action_ability_signal(character_place) #主动技能
signal character_action_done_signal(character_place) #结束



func add_detail_view(texture:Texture2D):
	emit_signal("add_detail_view_signal",texture)


func focus_on_chessman_by_id(chessman_id:int):
	emit_signal("focus_on_chessman_by_id_singal",chessman_id)

func controlling_character_action(action_name:String): #传到控制UI
	emit_signal("controlling_character_action_signal",action_name)
	
	
#func character_action(character:CharacterPlace,action_name:String): #传到main
#	emit_signal("character_action_signal",character,action_name)


######## 角色行为
#传main，或者也可以传CharacterManager

func character_action_play_cards(character_place:CharacterPlace, card_id_array:Array[int]):#出牌
	emit_signal("character_action_play_cards_signal",character_place, card_id_array)
	
	
func character_action_move(character_place:CharacterPlace):#移动
	emit_signal("character_action_move_signal",character_place)
	
	
func character_action_switch(character_place:CharacterPlace): #换牌（仅在有队友时）
	emit_signal("character_action_switch_signal",character_place)
	
	
func character_action_ability(character_place:CharacterPlace): #主动技能
	emit_signal("character_action_ability_signal",character_place)
	
	
func character_action_done(character_place:CharacterPlace): #结束
	emit_signal("character_action_done_signal",character_place)
	
	
	
