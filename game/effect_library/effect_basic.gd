extends Node
class_name Effect

@export var tags:Array[String] = []
@export var triggers:Array[String] = []

func register():
	EffectBoard.effects.register(self)
	EffectBoard.triggers.register(self)

func delete():
	EffectBoard.effects.delete(self)
	EffectBoard.triggers.delete(self)
	
