extends Node
#集中管理玩家……不过其实也可以直接在main里面写……
#单独一个节点挂脚本可以好集中操作并简化外部调用吧?
#或者还是直接算作CharacterPlace中的属性？

var players:Array[Player] = []

#进入游戏
func add_player(new_player:Player):
	players.append(new_player)

func add_players(new_players:Array[Player]):
	for new_player in new_players:
		add_player(new_player)

#角色淘汰是在character处……
