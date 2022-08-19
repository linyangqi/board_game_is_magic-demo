extends Node
#在CharacterManager中的代码，可以省去“character_”前缀吧

var alive_count:int #角色存活计数……角色死后可能还要占位吧（事件时间计算……）
var characters:Array[CharacterPlace] #可以挂节点的
var waiting:int

func attach_characters(): 
	#挂节点，但是数组或许还能保持对节点的引用……？
	#效果就像“巫毒娃娃”吧
	for node in characters:
		add_child(node)


#幻形灵大军一个玩家控制多个角色……什么神奇操作（）
func init(players:Array[Player]):
	#init的部分同样需要联合其他东西（如角色牌、地图位置吧）
	#不过可以在CharacterPlace类下面处理，所以这里看起来就没有和其他东西关联了吧
	#定顺序
	for i in players.size():
		var new_character := CharacterPlace.new()
		new_character.name = "Character"+str(i+1) #从1计数
		new_character.master = players[i]
		characters.append(new_character)
		attach_characters()
	#选角色
	waiting = characters.size()
	for character in characters: #这个其实应该【并行处理】，但是怎么搞呢……
		character.select_character()
	await waiting == 0
	#后面的操作便无须并行，而是自动处理了
	#地图位置（避水，在map里面处理）
	for character in characters: 
		character.prepare()



