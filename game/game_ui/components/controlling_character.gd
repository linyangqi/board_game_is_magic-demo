extends Panel

@onready var avatar = $Avatar
@onready var properties = $Properties


var master:Player #客户端玩家身份，在客户端保持不变
var character_place:CharacterPlace  #正在控制的角色位
#幻形灵大军可以一个玩家多个角色
#干脆做一个通用的功能吧——游戏默认架构本身也支持一个玩家多个角色的（当成“特殊模式”吧？）
var active = false #是否在自己回合



##################################################################
#############这部分测试用############

func _ready():
	master = Player.new()
	character_place = CharacterPlace.new()
	character_place.character = load(
		"res://game/card_library/characters/list/extension_2/小梅.tscn"
		).instantiate()
	_update()
	

####################################
#################################################################



func init():
	pass



func change_character_place():
	pass



func _update():
	avatar.texture = character_place.character.texture
	properties.init(character_place.character)
	properties._update()
	# Replace with function body.
	#	#ready()
#	link_character(the_character)
#	update_properties() #update这个函数名被父类占用了
#	print(Color(3,3,3,3).to_html())

