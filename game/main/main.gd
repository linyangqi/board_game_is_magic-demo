extends Node

#最后还是把ProcessManager的工作直接合并到main里了
#主要是因为UI更新以及某些动效吧……如果数据分离了，数据变化时子节点要把数据传回父节点再传给UI
#而本身UI能体现的数据量也不小，所以还是，数据以及动态处理都放main里了
#大概日后维护代码会有些麻烦吧……_(:3JZ)_ whatever

@onready var ui = $UI

#数组与字典一般总是引用，因此大概一般仅一个；如果是”实例化“，请使用”类“
var data:Dictionary={
	"player_remain":1,
}
#var player_remain := 1 #本来在只剩一个玩家时就游戏结束的，但是测试嘛，就先不
var character_places:Array[CharacterPlace]


func update_ui(): #可能可以只更新一部分
	ui.update(data)

func init(players:Array[Player]):
	for i in players.size():
		var new_character_place:CharacterPlace
		new_character_place.master=players[i]
		character_places.append(new_character_place)
	pass




func start_game():
	#选角色
	#所有玩家选完后，使用游戏开始就触发的角色技能
	#并且抽牌
	pass





	
	
func round_start():
	pass

func game_over():
	
	pass
