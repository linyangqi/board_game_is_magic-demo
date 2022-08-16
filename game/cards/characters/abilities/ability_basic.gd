extends Node
#class_name AbilityBasic

@export var ability_name := ""

#但是会有个问题……被动技能有时候甚至是直接修改游戏机制的操作……可能在游戏开始时就会需要检查
#或者，被动技能可以给一下触发方式之类的？
@onready var character = $"../.."

#此外，其实种族本身也是可以有“种族技能”的——有些是被动，有些是主动，不过还是就另外建一个文件夹吧
