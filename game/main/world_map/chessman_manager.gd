extends Node
#chessman仅作显示功能，而动态操作就交给manager吧……？
#此外其实还有地图选点之类的……
#至于“攻击对象”……就先不做“点棋子”方式吧（只能点侧栏，不过侧栏可以显示棋子或编号（以及计算距离？））


@onready var map = $"../Map"


const chessman_file = preload("res://game/main/world_map/chessman/chessman.tscn")

var all_chessmen:Array[Chessman]

const LINE_CAPACITY:int = 4
const RECT_SIZE:Vector2i = Vector2i(15,28) #目前棋子的大小是12, 25

###################
#测试用
func _ready():
	
	#######################################
	#建立引用，不过真正实操时，就不是从节点到数组，而是从数组挂节点了
	#这样好像直接就挂进去了
	all_chessmen.append_array(get_children())
	chess_offset_adjust_all()
	#但是子节点比父节点先执行ready，这样，在没有设置offset时，棋子就已经先ready一次了
	#但这时棋子还没进数组，因此节点到数组的方式时，后面要补一次堆叠调整
	#（数组到节点的方式的话，便不必如此了）
	#######################################
	
	for chessman_id in all_chessmen.size():
		all_chessmen[chessman_id].chessman_id = chessman_id #0起……习惯一下吧

##################

func chess_offset_adjust(coords:Vector2i):
	var target_chessmen:Array[Chessman] = []
	for chessman in all_chessmen: #获取同格棋子
		if chessman.coords == coords:
			target_chessmen.append(chessman)
	var total_count := target_chessmen.size()
	var full_line_count := total_count/LINE_CAPACITY #商
	var remain_count = total_count % LINE_CAPACITY #余
	var last_line_incomplete:bool = (remain_count > 0)
	
	var tile_size := Vector2i(LINE_CAPACITY,full_line_count + int(last_line_incomplete))
	var offset_tile_size := tile_size - Vector2i(1,1)
	var offset_rect_size := offset_tile_size * RECT_SIZE
	var start_point :=  -offset_rect_size/2
	
	if full_line_count > 0:
		#sprite是居中的
		
		for order_id in full_line_count * LINE_CAPACITY:
			var offset_id = Vector2i(order_id % LINE_CAPACITY, #0起
							order_id/LINE_CAPACITY) #0起
			target_chessmen[order_id].change_offset(start_point + offset_id * RECT_SIZE)
	#最后一排
	if last_line_incomplete:
		var offset_length := (remain_count-1) * RECT_SIZE.x
		var start_x = -offset_length/2
		for remain_id in remain_count:
			target_chessmen[full_line_count * LINE_CAPACITY +remain_id].change_offset(
				Vector2(
					start_x + remain_id * RECT_SIZE.x,
					start_point.y + offset_tile_size.y * RECT_SIZE.y
				) 
			)

func chess_offset_adjust_all():
	#节点到数组时才有用（测试专用）
	for coords in map.get_used_cells(0):
		chess_offset_adjust(coords)


func randomize_chess_coords():
	pass


