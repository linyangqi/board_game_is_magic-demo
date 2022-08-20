extends Node
#在CharacterManager中的代码，可以省去“character_”前缀吧


@onready var ui = $"../UI" #唯一名的话，不是 $"../UI" 而是 %UI



var alive_count:int #角色存活计数……角色死后可能还要占位吧（事件时间计算……）
var character_places:Array[CharacterPlace] #可以挂节点的
var character_place_scene = preload("res://game/main/character_manage/character_place/character_place.tscn")
var team_allocation:Array[int]
var waiting:int

func attach_characters(): 
	#挂节点，但是数组或许还能保持对节点的引用……？
	#效果就像“巫毒娃娃”吧
	for node in character_places:
		add_child(node)


#幻形灵大军一个玩家控制多个角色……什么神奇操作（）
func init(players:Array[Player]):
	#init的部分同样需要联合其他东西（如角色牌、地图位置吧）
	#不过可以在CharacterPlace类下面处理，所以这里看起来就没有和其他东西关联了吧
	#定顺序
	#分队伍
	team_allocation = team_allocate(players.size(),"single")
	for i in players.size():
		var new_character_place := character_place_scene.instantiate()
		new_character_place.name = "CharacterPlace"+str(i+1) #从1计数
		new_character_place.master = players[i]
		new_character_place.team_id = team_allocation[i] #目前的分组总是单人混战
		character_places.append(new_character_place)
		attach_characters()
	#选角色——全部选完再下一步操纵
	for character_place in character_places: #这个其实应该【并行处理】，但是怎么搞呢……
		character_place.select_character()
	
	#后面的操作便无须并行，而是自动处理了
	#地图位置（避水，在map里面处理）
	for character_place in character_places: 
		character_place.prepare()
	
	ui.set_controlling_character(character_places[0])


func team_allocate(size:int, mode:String = "single")->Array[int]:
	#队伍分配算法……目前没有随机器
	#不过要随机的话用shuffle就行
	var allocation:Array[int] = range(size)
	match mode:
		"single":
			pass
		"double":
			allocation = allocation.map(func(number): return number/2)
		"treble":
			allocation = allocation.map(func(number): return number/3)
		"harmony": #彩蛋操纵，这种模式下谁也不是谁的敌人……可能会直接游戏结束（）
			allocation = allocation.map(func(number): return 0)
		"boss": #第一个玩家总是boss
			allocation = allocation.map(func(number): return int(number>0))
		_:
			pass #默认情况就同单人模式
	return allocation
	


