extends ScrollContainer
class_name GrabableScroll
#但是不应该阻止原本的滚轮滚动
#ps：目前存在一个bug：右键召唤细节后仍然可以拖动，而如果改成scroll_grab的话中键也拖不动了……？？？

var scroll_plan := Vector2i(scroll_horizontal, scroll_vertical)
var grabing := false
var x_sensitivity = 1
var y_sensitivity = 1
#var x_acceleration = 5
#var y_acceleration = 5

func _gui_input(event):
	#与之前的TextureRect不同，这里存在一个“默认功能”，即滚轮控制
	#如果不管是什么事件就accept_event()的话，滚轮控制就失效了
	if event.is_action_pressed("detail_grab"):
		accept_event()
		grabing = true
		Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	elif event.is_action_released("detail_grab"):
		accept_event()
		grabing = false
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	#如果不全elif连上的话，好像就不能边缩放边拖动……？？
	
	if grabing and event is InputEventMouseMotion:
		scroll_horizontal += -event.relative.x  * x_sensitivity
		scroll_vertical += -event.relative.y  * y_sensitivity
	
		
#func _physics_process(delta): 
##	scroll_horizontal = lerp(scroll_horizontal, scroll_plan.x, delta * x_acceleration)
##	scroll_vertical = lerp(scroll_vertical, scroll_plan.y, delta * y_acceleration)
#	scroll_horizontal = scroll_plan.x
#	scroll_vertical = scroll_plan.y
	
