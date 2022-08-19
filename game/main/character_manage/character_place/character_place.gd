extends Node
class_name CharacterPlace
# 数组中的id 与 chessman_id 一一对应……应该也不会改吧？
#具体的根据位置判断条件……可能要main来连接吧……？
#或者使用管理来让map自己更新？
@onready var manager = get_parent()
@onready var game_main = manager.get_parent() 
#需要UI或map的都找main处理，返回值直接传到这里

var master:Player #这个类放在ui/lobby下了
var character:Node #获取牌库文件夹里的节点，但是不挂在树上
var abilities:Node #可能不必要了……？或者还是存个“变体”？
var alive:bool
var coordinate:Vector2i #地图位置
var collection_count:int
var max_health:int # 生命值上限
var health:int # 生命值
var armor_value:int # 护甲值
#狮狮两个防具栏……不过目前还是先做大部分通用的方式吧？
var equipment_limits := {
	element =1,
	weapon =1,
	armor =1,
	backup =1, #这个是最后那个只能放收集品的栏
}

var equipment := { #一般情况下只能装一个……
	element = [],
	weapon = [],
	armor = [],
	backup = [],
	# 可能有其他类型的“装备”……？
}

var hand_cards:Array[CardInHand] = []




#var character_select_ui = preload("res://game/main/ui/character_select/character_select_ui.tscn")
func select_character(option_count:int = 4):
	####【应当并行处理！！！！！！！！！！！！】
	#ps:幻形灵的技能不是这个……幻形灵另外用一个copy_ability吧（或许在ability列表？/节点？）
	var character_name = await game_main.character_select(master,option_count)
	var character_file = CardLibrary.CARD_PATH["characters"][character_name]
	character = load(character_file).instantiate()
	manager.waiting -= 1 #局部变量没问题吗


func prepare():#【选好角色以后】进行操作
	#属性、地图位置，以及天赋技能
	alive = true
	collection_count = 0
	max_health = character.max_health
	health = max_health
	armor_value = 0
	abilities = character.abilities #技能节点……初始化？
	#不是duplicate，因此只是引用……所以整体“技能”数据还是在实例化过的character中
	#这样写，ability相当于快捷方式吧
	
	#发动技能？或者在start_game以后？
	
	#地图位置
	coordinate = Vector2i(6,6)
	print("todo：随机化位置")




func get_texture()->Texture2D:
	return character.texture

#ps:这里的函数顺序排布模拟游戏进程




func attempt_hurt():#
	pass
	#要说明的是，有些防具并非用来抵挡伤害，比如面具是防止偷牌
	#因此防具、元素、武器的效果还是设置为在effect manager上设置一个关联的“效果”吧
	
	
func attempt_heal():#
	pass
	
	
func final_hurt(damage:int): #真正造成伤害以后
	health -= damage
	if health<=0 :
		# 没有“濒死”机制
		faint()

func final_heal(healing_point:int): #真正的回血
	health += healing_point
	if health > max_health:
		health = max_health


func draw_card(count:int = 2):
	pass


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
	collection_count -= 1


func faint(): # 晕厥
	if collection_count<=0:
		knocked_out()
	else:
		print("晕厥操作：弃一个收集品，弃手牌重摸4张，回半血，免疫一回合")
	

func knocked_out():
	alive = false



		
