extends Node2D
#class_name CharacterBasic

@export var character_name := ""
@export var collections :Array[String]

@export var max_health := 14
@export var move_speed := 1
@export var mental_damage := 1
@export var physic_damage := 1
@export var magic_damage := 1

#@export var abilities := [] 
#但是实际上，可能是直接写代码，而不是列ability……？
#不过也还是可以来写成一个专门的类——毕竟技能分被动主动，以及范围限制或无限范围
@onready var abilities = $Abilities
#子节点这种方式差不多相当于挂代码了√——大概能比数组方式更适合用来作“技能”吧


