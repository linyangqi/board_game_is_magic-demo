extends PanelContainer

@onready var avatar = %Avatar
@onready var properties = %Properties
@onready var hand_cards = %HandCards


var master:Player #客户端玩家身份，在客户端保持不变
var character_place:CharacterPlace  #正在控制的角色位
#幻形灵大军可以一个玩家多个角色
#干脆做一个通用的功能吧——游戏默认架构本身也支持一个玩家多个角色的（当成“特殊模式”吧？）
var active = false #是否在自己回合



##################################################################
#############这部分测试用############

func _ready():
	#要测试牌的话，就得在main层级测试了吧
	pass
	

####################################
#################################################################



func init(linking_character_place:CharacterPlace):
	
	character_place = linking_character_place
	master = character_place.master
	#avatar本身没有更下一级，结构过于简单，没有自身设计的init()函数
	avatar.texture = character_place.character.texture
	properties.init(character_place.character)
	hand_cards.init(character_place.hand_cards)
	_update()


func _update():
	properties._update()
	hand_cards._update()


func change_character_place(new_character_place:CharacterPlace):
	#先换角色
	#ps：这里假定Player并不更换……不过还是换一下吧……比如一台电脑多个Player?（“单机”）
	character_place = new_character_place
	#再更新ui
	init(character_place)






