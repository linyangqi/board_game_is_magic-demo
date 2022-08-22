extends Node
#直接继承这堆属性了，一个角色位只有一个角色，总是能用上的吧
class_name CharacterPlace
# 数组中的id 与 chessman_id 一一对应……应该也不会改吧？
#具体的根据位置判断条件……可能要main来连接吧……？
#或者使用管理来让map自己更新？
@onready var manager:Node = get_parent()
@onready var game_main:Node = manager.get_parent() 
@onready var ui:Node = game_main.get_node("UI")
@onready var decks:Node = game_main.get_node("DeckManager")
@onready var map:Node = game_main.get_node("WorldMap")
#需要UI或map的都找main处理，返回值直接传到这里
#不需要ui的，还是直接自立更生地交流了吧
#或者其实UI也能自行交流吧……？真不用main这个中介吗

@onready var buff = $Buff
@onready var equipment = $Equipment
#@onready var hand_cards = $HandCards


var master:Player #这个类放在ui/lobby下了
var character:Node#获取牌库文件夹里的节点，并且要挂在树上
#现在角色的主要信息都在实例化的这个character上了
#目前的方式，相当于把“角色内部属性”与“外部工具”区分开了

var chessman_id:int #棋子编号，但实际也是“角色位编号”

#另外考虑“队伍”？……在manager中吧？
var team_id:int

var coordinate:Vector2i #地图位置
#狮狮两个防具栏……不过目前还是先做大部分通用的方式吧？

#enum EquipmentIndex{element,weapon,armor,backup}
#var equipment :Array[Array]=[[],[],[],[]] #目前不支持嵌套类型……这里装Node吧？

#目前的逻辑是，游戏内部逻辑使用牌的名称来计算逻辑
#（如抽到“触发事件”，不是牌自身用这个功能，而是我们在这里写一个约定性的函数了）
var hand_cards:Array[String] = []




#var character_select_ui = preload("res://game/main/ui/character_select/character_select_ui.tscn")
func select_character(option_count:int = 4):
	####【应当并行处理！！！！！！！！！！！！】
	#ps:幻形灵的技能不是这个……幻形灵另外用一个copy_ability吧（或许在ability列表？/节点？）
	var character_index = await game_main.character_select(master,option_count)
	#不过实际上这个index用的基本上就是名字……不过还是按用处区分一下吧，比如同名重制角色
	var character_file = CardLibrary.CARD_PATH[character_index]
	character = load(character_file).instantiate()
	manager.waiting -= 1 #局部变量没问题吗
	

func prepare():#【选好角色以后】进行操作
	#属性、地图位置，以及天赋技能
	character.hide()
	character.name="Character"
	add_child(character)
	
	#不是duplicate，因此只是引用……所以整体“技能”数据还是在实例化过的character中
	#这样写，ability相当于快捷方式吧
	
	#发动技能？或者在start_game以后？
	
	#地图位置
	coordinate = Vector2i(6,6)
	print("todo：随机化位置")
	
	#初始抽牌
	hand_cards.append_array(decks.take_resource(4))


#ps:这里的函数顺序排布模拟游戏进程




func attempt_hurt():#
	pass
	#要说明的是，有些防具并非用来抵挡伤害，比如面具是防止偷牌
	#因此防具、元素、武器的效果还是设置为在effect manager上设置一个关联的“效果”吧
	
	
func attempt_heal():#
	pass
	
	
func final_hurt(damage:int): #真正造成伤害以后
	character.health -= damage
	if character.health<=0 :
		# 没有“濒死”机制
		faint()

func final_heal(healing_point:int): #真正的回血
	character.health += healing_point
	if character.health > character.max_health:
		character.health = character.max_health


func draw_card(count:int = 2):
	#但是注意可能有特殊效果干扰
	hand_cards.append_array(decks.take_resource(count))


func drop_handcard(count:int = 1, type:String = "self"):
	match type:
		"self":
			print("自行弃置")
		"random":
			print("随机弃置")
#		"passive":
#			print("被其他玩家弃置") 


func drop_collection():
	print("自行选择弃一个收集品——需要await")
	character.collection_count -= 1


func faint(): # 晕厥
	if character.collection_count<=0:
		knocked_out()
	else:
		print("晕厥操作：弃一个收集品，弃手牌重摸4张，回半血，免疫一回合")
	

func knocked_out():
	character.alive = false



		
