extends RichTextLabel


const COLOR_NORMAL := Color.WHITE
const COLOR_BOOSTED := Color.GREEN
const COLOR_WEAKENED := Color.RED

var character:Node # 当前角色属性
var origin:Node # 初始角色属性

var origin_text = text #由于是替换文本，这里先要存一下原本的设定
###########################
##这部分测试用
#@onready var the_character = $"灵樨"
#
#func _ready():
#	#ready()
#	link_character(the_character)
#	update_properties() #update这个函数名被父类占用了
#	print(666)
#
#
#func _on_timer_timeout():
#	the_character.max_health = ( the_character.max_health + 1) % 30
#	update_properties()

	

#############################

func link_character(linking_character:Node):
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
	
	var output:String = "[color=%s]"% color.to_html(false) + str(now_int) +"[/color]"
	
	return output


func update_properties():
	text = origin_text % ["狮狮", 233, colored_int("max_health",10)]
	






