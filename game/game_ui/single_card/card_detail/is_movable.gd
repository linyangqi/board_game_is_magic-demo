extends Node

#方便操作：鼠标滚轮缩放，中键或右键拖动地图
#若有手机版……加触屏按钮吧？或者touch screen

#如果要方便大地图又不至于被UI挡住，还是一定要有这一条的
#另外，tilemap动态操作来表示玩家，应该还是很有必要吧

#直接侦测鼠标事件……但是“焦点”……？？怎么获取呢
#还有一个“按键后拖动”的效果……？？
@onready var parent:Node = get_parent()

@onready var scale_plan = parent.scale
var scale_acceleration:float = 10
const MIN_ZOOM = Vector2(0.5,0.5) 
const MAX_ZOOM = Vector2(4,4) 

@onready var position_plan = parent.position
var grabing := false
var x_sensitivity = 2
var y_sensitivity = 2
var x_acceleration = 5
var y_acceleration = 5

func _on_world_map_gui_input(event):
	if event.is_action("detail_clear"):
		free()
		
	if event.is_action_pressed("detail_grab"):
		grabing = true
		Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	elif event.is_action_released("detail_grab"):
		grabing = false
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	elif event.is_action("zoom_reset"):
		scale_plan = Vector2(1,1)
	elif event.is_action("zoom_in"):
		scale_plan *= 1.1
	elif event.is_action("zoom_out"):
		scale_plan *= 0.9
	scale_plan = clamp(scale_plan, MIN_ZOOM, MAX_ZOOM)
	
	if grabing and event is InputEventMouseMotion:
		position_plan.x += event.relative.x  * x_sensitivity
		position_plan.y += event.relative.y  * y_sensitivity
	
		
func _physics_process(delta):
	parent.scale = lerp(parent.scale, scale_plan, delta * scale_acceleration)
	parent.position.x = lerp(parent.position.x, position_plan.x, delta * x_acceleration)
	parent.position.y = lerp(parent.position.y, position_plan.y, delta * y_acceleration)
	
