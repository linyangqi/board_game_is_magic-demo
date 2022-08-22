extends Button

@onready var agent = $"/root/SignalAgent"

#@export var action_name := ""

func _pressed():
#	agent.controlling_character_action(action_name) 
	agent.controlling_character_action(text) #还是就任性直接用text表示行动标签了吧
