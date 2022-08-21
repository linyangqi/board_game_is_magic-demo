extends RichTextLabel


const COLOR_NORMAL := Color.WHITE
const COLOR_BOOSTED := Color.GREEN
const COLOR_WEAKENED := Color.RED
const COLOR_SPECIAL := Color.YELLOW

var character:Node # 当前角色属性
var origin:Node # 初始角色属性

#var origin_text = text #由于是替换文本，这里先要存一下原本的设定
#或者还是不依赖外部吧……

###########################
###这部分测试用
#@onready var the_character = get_child(0)
#
#func _ready():
#	#ready()
#	link_character(the_character)
#	update_properties() #update这个函数名被父类占用了
#	print(Color(3,3,3,3).to_html())

#func _on_timer_timeout():
#	the_character.max_health = ( the_character.max_health + 1) % 30
#	update_properties()

#############################

func init(linking_character:Node):
	#原理：Node在没有new()时是传递引用
	#实质上也可以直接外面用porperties.characte = character吧……
	#不过写个函数名还是能提示一下功能以及用法
	character = linking_character
	origin = CardLibrary.load_card(character.character_name)
	#这样原本get_origin()函数就直接合并在这里了


func colored_int(property_name:String, max_difference:int=1)->String: 
	#白色表示与原始相同，绿色表示有所增强，红色表示有所降低
	#max_difference表示，相差这么多数后达到最深颜色（颜色渐变效果吧）
	var now_int:int = character.get(property_name) 
	var origin_int:int = origin.get(property_name) 
	var difference:int = now_int - origin_int
	#神奇，这样就可以把object当作字典，而不用非得每种属性（变量名）都来一遍函数了√
	
	var color:Color #Color类类似一个向量，是可以计算的
	if difference == 0:
		color = COLOR_NORMAL
	elif difference > 0:
		color = COLOR_NORMAL + (COLOR_BOOSTED - COLOR_NORMAL) * clamp(difference,0,max_difference) / max_difference
	elif difference < 0:
		color = COLOR_NORMAL + (COLOR_WEAKENED - COLOR_NORMAL) * clamp(-difference,0,max_difference) / max_difference
	#看起来Color类自身是允许了大于1的值的，大概这样确实也能方便运算吧
	#的确，(3,3,3,3）就正常输出，不过如果转为html那就封顶ffffffff
	
	var output:String = "[color=%s]"% color.to_html(false) + str(now_int) +"[/color]"
	
	return output

func range_discribe(property_name:String)->String:
	var the_range = character.get(property_name)
	if the_range >= 0:
		return colored_int(property_name,1)
#	elif the_range == 0:
#		return "0（仅所在格）"
	elif the_range == -1:
		return "[color=%s]无[/color]" % COLOR_WEAKENED.to_html(false)
		#对于移动来说，0与“无”似乎是一个意思……
	elif the_range == -2:
		return "[color=%s]"% COLOR_BOOSTED.to_html(false) + "无限[/color]"
	elif the_range == -3:
		return "[color=%s]"% COLOR_SPECIAL.to_html(false) + "直线[/color]"
	else:
		return "ERROR"

func _update(): #update()被父类用了
	#text = origin_text % ["狮狮", 233, colored_int("max_health",10)]
	#代码换行用“\”结尾，但是这行后面连空格也别加了，也没有注释可言
	#另一种方法是“+=”法，这样每行后面还能有注释，而且也便于调整
	#还有一种append_text()……有点麻烦，算了
	text = "[font_size=40]%s[/font_size]" % character.character_name #角色名
	text += "\n体力： %s / %s" % [colored_int("health",10),colored_int("max_health",2)]
	text += "\n护甲： %s / 4" % colored_int("armor_value",10)
	text += "\n心理伤害： %s" % colored_int("mental_attack",2)
	text += "\n物理伤害： %s" % colored_int("physical_attack",2)
	text += "\n法术伤害： %s" % colored_int("magic_attack",2)
	#想了一下，还是重新按类型调整数据展示结构吧
	text += "\n" 
	text += "\n攻击范围：%s" % range_discribe("attack_range")
	text += "\n剩余攻击次数： %s" % colored_int("attack_chance",1)
	text += "\n"
	text += "\n移动范围： %s" % range_discribe("move_range")
	text += "\n剩余移动机会： %s" % colored_int("move_chance",1)





