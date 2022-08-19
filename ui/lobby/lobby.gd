extends Control



func _on_join_pressed():
	var players:Array[Player] = []
	var new_player:=Player.new()
	new_player.name = "the player"
	players.append(new_player)
	
	var main_game:Node = load("res://game/main/main.tscn").instantiate()
	get_tree().root.add_child(main_game)
	main_game.init(players) #好像init一定要在进入根节点后才能用吧
	hide()
