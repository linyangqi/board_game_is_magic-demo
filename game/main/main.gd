extends Node

#最后还是把ProcessManager的工作直接合并到main里了
#主要是因为UI更新以及某些动效吧……如果数据分离了，数据变化时子节点要把数据传回父节点再传给UI
#而本身UI能体现的数据量也不小，所以还是，数据以及动态处理都放main里了
#大概日后维护代码会有些麻烦吧……_(:3JZ)_ whatever

@onready var ui = $UI
@onready var deck_manager = $DeckManager
@onready var character_manager = $CharacterManager


#数组与字典一般总是引用，因此大概一般仅一个；如果是”实例化“，请使用”类“
var data:Dictionary={
	"player_remain":1,
}
#var player_remain := 1 #本来在只剩一个玩家时就游戏结束的，但是测试嘛，就先不



func update_ui(): #可能可以只更新一部分
	ui.update(data)

func init(players:Array[Player]):
	deck_manager.init()
	await character_manager.init(players)
	start_game()

func character_select(player:Player,option_count:int = 4)->String: # 但是必须有对象目标……
	#在角色牌库里抽牌（string）
	#调用选角色专用的UI（“请选择一个卡牌/角色”——提示语应该可以换
	#但是多人与单人怎么办呢……或者“选角色”是一个指定CharacterPlace的操作，而同时有效？
	return "灵樨"#测试用，标准要调用ui的

func start_game():
	print("开始游戏")
	#所有玩家选完后，使用游戏开始就触发的角色技能
	#并且抽牌
	pass

	
func round_start():
	pass

func game_over():
	
	pass
