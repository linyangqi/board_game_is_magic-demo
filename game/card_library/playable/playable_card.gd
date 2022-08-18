extends Node
class_name PlayableCard
#其实 基本上就装备牌特殊一些，其他都可以视作一种“效果”吧？
#不过装备牌……也可视作“装备一件装备的效果牌”？
#总之……还是先作些基本分类吧？实在不行也可以就在PlayableCard里面修改的√

@export var card_name := ""

enum BackSideType{ normal=0, bonus=1, playable_event=2 }
@export var back_side_type:BackSideType = 0 #决定牌的背面
#ps:虽然占位的图像是普通牌背面，实际操作（偷牌等）时，还是要替换一下的

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
