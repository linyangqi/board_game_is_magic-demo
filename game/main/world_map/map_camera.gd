extends Camera2D

#方便操作：鼠标滚轮缩放，中键或右键拖动地图
#若有手机版……加触屏按钮吧？或者touch screen

#如果要方便大地图又不至于被UI挡住，还是一定要有这一条的
#另外，tilemap动态操作来表示玩家，应该还是很有必要吧

#直接侦测鼠标事件……但是“焦点”……？？怎么获取呢
#还有一个“按键后拖动”的效果……？？
func _input(event):
	pass