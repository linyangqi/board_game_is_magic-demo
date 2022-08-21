extends Node
#chessman仅作显示功能，而动态操作就交给manager吧……？
#此外其实还有地图选点之类的……
#至于“攻击对象”……就先不做“点棋子”方式吧（只能点侧栏，不过侧栏可以显示棋子或编号（以及计算距离？））


const chessman_file = preload("res://game/main/world_map/chessman/chessman.tscn")

var all_chessmen:Array[Chessman]

const LINE_CAPACITY:int = 4
const RECT_SIZE:Vector2i = Vector2i(15,28) #目前棋子的大小是12, 25

###################
#测试用
func _ready():
	#建立引用，不过真正实操时，就不是从节点到数组，而是从数组挂节点了
	for chessman in get_children():
		all_chessmen.append(chessman) 
	chess_offset_adjust(Vector2i(0,0))

##################


func chess_offset_adjust(coordinate:Vector2i):
	var target_chessmen:Array[Chessman] = []
	for chessman in all_chessmen: #获取同格棋子
		if chessman.coordinate == coordinate:
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
