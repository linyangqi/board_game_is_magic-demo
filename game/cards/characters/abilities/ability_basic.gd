extends Node
class_name AbilityBasic
#新的文件夹架构下，“技能”本质上也可以算是“自动执行的效果”
#或称“effect caller”吧？

@export var ability_name := ""
@export var enabled := true #用来应对一些“技能失效”事件……一次性技能（如“神力”）就完成后替换掉就可以了吧


#但是会有个问题……被动技能有时候甚至是直接修改游戏机制的操作……可能在游戏开始时就会需要检查
#或者，被动技能可以给一下触发方式之类的？

@onready var conditions = $Conditions #留空表示无需特殊条件
#——但是”触发时间/触发方式“呢？
#主动技能的实现实际上是加”选择/决定“条件吧……或者”等待点击“之类的？

@onready var character = $"../.."
#此外，其实种族本身也是可以有“种族技能”的——有些是被动，有些是主动，不过还是就另外建一个文件夹吧



