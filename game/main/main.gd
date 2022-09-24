extends Node

#最后还是把ProcessManager的工作直接合并到main里了
#主要是因为UI更新以及某些动效吧……如果数据分离了，数据变化时子节点要把数据传回父节点再传给UI
#而本身UI能体现的数据量也不小，所以还是，数据以及动态处理都放main里了
#大概日后维护代码会有些麻烦吧……_(:3JZ)_ whatever

@onready var ui = $UI
@onready var deck_manager = $DeckManager
@onready var character_manager = $CharacterManager

@onready var agent = $"/root/SignalAgent"
func _ready():
	#连信号
	agent.connect("character_action_play_cards_signal",character_action_play_cards)
	agent.connect("character_action_move_signal",character_action_move)
	agent.connect("character_action_switch_signal",character_action_switch)
	agent.connect("character_action_ability_signal",character_action_ability)
	agent.connect("character_action_done_signal",character_action_done)



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
	var character_index := "Twilight Sparkle"
	return character_index#测试用，标准要调用ui的



func start_game():
	print("开始游戏")
	#所有玩家选完后，使用游戏开始就触发的角色技能
	#并且抽牌
	pass

	
func round_start():
	pass

func game_over():
	
	pass

#####################
#角色操作（初始）
#逻辑直接在main这里实现了，包括存在效果时的情况

func character_action_play_cards(character_place:CharacterPlace, card_id_array:Array[int]):#出牌
	#emit_signal("character_action_play_cards_signal",character_place, card_id_array)
	#可能会需要细化……
	#不过这里传的Array，实际操作就是从左到右依次生效吧（”快速出牌“）
	#当然，正常操作应该是一张一张出的
	
	#另外为什么传id不传名字呢，因为从id可以找到牌的名字，牌生效后还要把牌从中删除
	#（这就几乎非数字id不可了，传名字就要迭代找）
	#此外，生效后还不可立刻删除，而应该完成以后统一删除，否则编号不统一（标记哪些牌是生效了的）
	#不过”是否生效，其实可以直接拿visible属性来，这样，生效过的牌便看不到，而后也能以此依据统一删除吧
	#（有的牌生效可能会带其他牌吧……虽然现在好像还没见到，不过以后可能有）
	#（或者是出牌时受技能影响而消耗掉——那么在遍历这个数组时，就要先检查前面的牌是否已经把后面这张“消耗”了（visible为非））
	
	print("出牌："+str(card_id_array))
	pass
	
func character_action_move(character_place:CharacterPlace):#移动
	#emit_signal("character_action_move_signal",character_place)
	print("移动")
	pass
	
func character_action_switch(character_place:CharacterPlace): #换牌（仅在有队友时）
	#emit_signal("character_action_switch_signal",character_place)
	print("换牌")
	pass
	
func character_action_ability(character_place:CharacterPlace): #主动技能
	#emit_signal("character_action_ability_signal",character_place)
	#首先要确定没有”技能失效“
	print("技能")
	pass
	
	
func character_action_done(character_place:CharacterPlace): #结束
	#emit_signal("character_action_done_signal",character_place)
	print("结束")
	pass
