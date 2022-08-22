extends Camera2D

#方便操作：鼠标滚轮缩放，中键或右键拖动地图
#若有手机版……加触屏按钮吧？或者touch screen

#如果要方便大地图又不至于被UI挡住，还是一定要有这一条的
#另外，tilemap动态操作来表示玩家，应该还是很有必要吧

#直接侦测鼠标事件……但是“焦点”……？？怎么获取呢
#还有一个“按键后拖动”的效果……？？

var zoom_plan = zoom
var zoom_acceleration:float = 10
const MIN_ZOOM = Vector2(0.5,0.5) 
const MAX_ZOOM = Vector2(4,4) 

var position_plan = position
var grabing := false
var x_sensitivity = 2 #虽然非1值的话移动与鼠标位置不会完全对应，但是移动地图方面，2还是感觉舒服一点
var y_sensitivity = 2
var x_acceleration = 5
var y_acceleration = 5

func _unhandled_input(event):
	
	if event.is_action_pressed("zoom_reset") and event.double_click:
		zoom_plan = Vector2(1,1)
	elif event.is_action_pressed("zoom_in"):
		zoom_plan *= 1.1
	elif event.is_action_pressed("zoom_out"):
		zoom_plan *= 0.9
	
	elif event.is_action_pressed("map_grab"):
		grabing = true
		Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	elif event.is_action_released("map_grab"):
		grabing = false
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	
	zoom_plan = clamp(zoom_plan, MIN_ZOOM, MAX_ZOOM)
	
func _input(event):
	if grabing and event is InputEventMouseMotion:
		position_plan.x += -event.relative.x  * x_sensitivity / zoom.x
		position_plan.y += -event.relative.y  * y_sensitivity / zoom.y
	
		
func _physics_process(delta):
	zoom = lerp(zoom, zoom_plan, delta * zoom_acceleration)
	position.x = lerp(position.x, position_plan.x, delta * x_acceleration)
	position.y = lerp(position.y, position_plan.y, delta * y_acceleration)
	
