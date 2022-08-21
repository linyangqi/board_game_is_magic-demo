extends Sprite2D
class_name Chessman

const CHESSMAN_COLORS:Array[Color] = [
	Color.YELLOW,
	Color.BLUE,
	Color.RED,
	#Color.GREEN, #绿色和草地、森林之类太近了
	Color.ORANGE,
	Color.PURPLE,
	Color.WHITE,
	Color.BLACK,
]

@onready var manager = get_parent()
@onready var map = manager.get_node("../Map")

var id_label := Label.new()
const LABEL_OFFSET := Vector2i(-4,-7)


@export var chesss_id:int = 0
var coordinate:Vector2i


func _ready(): #测试用……不过好像也可以直接用了（挂节点上时自动操作）
	#不过如果挂节点上，要先apply_corrdinate一下，改position，不然默认(0, 0)把coordinate覆盖了
	coordinate = map.world_to_map(position)
	apply_corrdinate()
	modulate = CHESSMAN_COLORS[chesss_id]
	
	add_child(id_label)
	id_label.position = LABEL_OFFSET
	id_label.text = str(chesss_id)
	id_label.modulate = Color.GRAY
	
	


func apply_corrdinate():
	position = map.map_to_world(coordinate)

func change_offset(new_offset:Vector2i): #用这个，文字才能跟着变
	offset = new_offset
	id_label.position = new_offset + LABEL_OFFSET
	
	
