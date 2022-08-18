extends Node

@onready var ui = $UI
@onready var data_manager = $DataManager
@onready var round_manager = $RoundManager



var player_remain := 1 #本来在只剩一个玩家时就游戏结束的，但是测试嘛，就先不



func update_ui():
	ui.update(data_manager)


func game_start():
	pass
	
	
func round_start():
	pass

