extends Control
#仅作UI交互功能……以及……所控角色……？
#严格来讲，由于这里character_place是通过“连接”获取，因此操作都可以反馈到原“角色位”
#但问题在于，完整的操作可能会需要有其他节点的帮助，比如地图……？
#地图中的“棋子”也只是按照编号排布，本身也并未连接到character_place
#不过……如果直接把“操作”信号接到main上，就并不知道所控角色为谁
#因此，在此稍微中转一下即可吧……？
#不过，像出牌等等的操作，还是需要这里ui的信息传出去的



@onready var character_information = %CharacterInformation
@onready var hand_cards = %HandCards

@onready var agent = $"/root/SignalAgent"

var master:Player #客户端玩家身份，在客户端保持不变
var character_place:CharacterPlace  #正在控制的角色位
#幻形灵大军可以一个玩家多个角色
#干脆做一个通用的功能吧——游戏默认架构本身也支持一个玩家多个角色的（当成“特殊模式”吧？）
var active = false #是否在自己回合





func _ready():
	#连信号
	agent.connect("controlling_character_action_signal",controlling_character_action)



func init(linking_character_place:CharacterPlace):#“数据初始化”，也可用于切换所控角色
	#原本有一个change_character_place函数，但是后来发现所作的事和init是一样的……就删掉那个了
	character_place = linking_character_place
	master = character_place.master
	#avatar本身没有更下一级，结构过于简单，没有自身设计的init()函数
	character_information.init(linking_character_place)
	hand_cards.init(character_place.hand_cards)
	_update()


func _update(): #未更换“角色位”时的UI更新（频繁）
	character_information._update()
	hand_cards._update()


func controlling_character_action(action_name:String):
	match action_name:
		"出牌":
			#传递的数据：所控角色，所出牌（在牌库的编号即可，不用名字）
			agent.character_action_play_cards(character_place, hand_cards.selected_card_id())
		"移动":
			#传递的数据：所控角色（棋子可以通过编号对应）
			agent.character_action_move(character_place)
		"换牌": # 有队友时才允许的操作
			#传递的数据：所控角色（和谁换牌交给下一步）
			agent.character_action_switch(character_place)
		"技能":
			#传递的数据：所控角色
			agent.character_action_ability(character_place)
		"结束":
			#传递的数据：所控角色
			agent.character_action_done(character_place)




