extends TextureRect

#方便操作：鼠标滚轮缩放，中键或右键拖动地图
#若有手机版……加触屏按钮吧？或者touch screen

#如果要方便大地图又不至于被UI挡住，还是一定要有这一条的
#另外，tilemap动态操作来表示玩家，应该还是很有必要吧

#直接侦测鼠标事件……但是“焦点”……？？怎么获取呢
#还有一个“按键后拖动”的效果……？？

var scale_plan = scale
var scale_acceleration:float = 10
const MIN_SCALE = Vector2(0.2,0.2) 
const MAX_SCALE = Vector2(2,2) 

#var position_plan = position
var grabing := false
var x_sensitivity = 1
var y_sensitivity = 1
#var x_acceleration = 5
#var y_acceleration = 5

func _gui_input(event):
	accept_event()
	if event.is_action_pressed("zoom_reset") and event.double_click:
		scale_plan = Vector2(1,1)
	elif event.is_action_pressed("zoom_in"):
		scale_plan *= 1.1
	elif event.is_action_pressed("zoom_out"):
		scale_plan *= 0.9
		
	elif event.is_action_pressed("detail_clear"):
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE) #如果拖动时关闭，要把鼠标还回来
		free()
	elif event.is_action_pressed("detail_grab"):
		grabing = true
		Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	elif event.is_action_released("detail_grab"):
		grabing = false
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	#如果不全elif连上的话，好像就不能边缩放边拖动……？？
	
	scale_plan = clamp(scale_plan, MIN_SCALE, MAX_SCALE)
	#scale = scale_plan
	
	if grabing and event is InputEventMouseMotion:
#		position_plan.x += event.relative.x  * x_sensitivity * scale.x
#		position_plan.y += event.relative.y  * y_sensitivity * scale.y
		position.x += event.relative.x  * x_sensitivity * scale.x
		position.y += event.relative.y  * y_sensitivity * scale.y
	
#不使用平滑的话，便没有物理帧控制的必要了，只用在事件发生时使用代码
func _physics_process(delta):
	scale = lerp(scale, scale_plan, delta * scale_acceleration)
##	position.x = lerp(position.x, position_plan.x, delta * x_acceleration)
##	position.y = lerp(position.y, position_plan.y, delta * y_acceleration)

	
