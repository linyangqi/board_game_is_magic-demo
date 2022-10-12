extends Sprite2D
class_name Chessman


@onready var manager = get_parent()
@onready var map:TileMap = manager.get_node("../Map")

const CHESSMAN_COLORS:Array[Color] = [
	Color.YELLOW,
	Color.BLUE,
	Color.RED,
	#Color.GREEN, #绿色和草地、森林之类太近了
	Color.ORANGE,
	Color.PURPLE,
	Color.WHITE,
	Color.GRAY,
]
static func color_by_id(chessman_id:int)->Color:
	return CHESSMAN_COLORS[chessman_id % CHESSMAN_COLORS.size()]


const LABEL_OFFSET := Vector2i(-5,-7)


@export var chessman_id:int = 0:
	set(new_chessman_id):
		chessman_id = new_chessman_id
		id_label.text = str(chessman_id)
		modulate = color_by_id(chessman_id)

var id_label := Label.new()
#设置了set，这样在设置位置坐标时，便自动更新视图了
var coords:Vector2i:
	set(new_coords): 
		var old_coords = coords
		coords = new_coords
		position = map.map_to_local(coords) #原本是apply_coords，后来发现只用在这里
		
		manager.chess_offset_adjust(old_coords)
		manager.chess_offset_adjust(new_coords)


func _ready(): #测试用……不过好像也可以直接用了（挂节点上时自动操作）
	#不过如果挂节点上，要先apply_corrdinate一下，改position，不然默认(0, 0)把coords覆盖了
	
	#manager.all_chessmen.append(self) 
	#上面这行如果在这里写会出现一个问题：如果是”从数组到节点“的挂法，数组就会重复了
	#所以，决定如何将节点记录在manager的数组中，还是应该交给manager自身吧
	
	#加数字标签
	id_label.position = LABEL_OFFSET
	id_label.modulate = Color.GRAY
	add_child(id_label)
	
	#coords = map.world_to_map(position) # 这个是测试时用的
	location_allocate()
	


func change_offset(new_offset:Vector2i): #用这个，文字才能跟着变
	offset = new_offset
	id_label.position = new_offset + LABEL_OFFSET


func randomize_coords(avoid_water:bool = true):
	var options:Array[Vector2i] = map.get_used_cells(0)
	options.shuffle() #只是数据的随机化，不是节点，因此不会太费性能吧
	var option_id := 0 #这里要求一定要有可落脚点（地图至少有一块）……
	if avoid_water:
		while option_id < options.size():
			print("1"+map.get_cell_tile_data(0,options[option_id]).get_custom_data_by_layer_id(0))
			if map.get_cell_tile_data(0,options[option_id]).get_custom_data("terrain_tag") != "lake":
				break
			else:
				option_id += 1
		if option_id == options.size():
			print("ERROR: 无可落脚")
	coords = options[option_id]


func location_allocate():
	#特殊地点（还没实现，留个架构）
	pass
	#普通随机化地点
	randomize_coords(true)
