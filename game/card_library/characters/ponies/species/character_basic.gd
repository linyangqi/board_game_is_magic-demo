extends Node
class_name CharacterBasic
#仅作信息库功能，不作动态操作（动态操作在继承此类的CharacterPlace类中）
#但是……如果不挂载的话，又怎么知道技能呢
#####……最后还是决定，主要信息都存储在此处位置（可以变化），而“位”的工作在交给“角色位”吧
#能变化，因为使用时用的是实例化过的

#幻形灵会抄技能

@export var character_name := ""
@export var collection_requirement :Array[String]

@export var max_health := 14
@export var mental_damage := 1
@export var physic_damage := 1
@export var magic_damage := 1
@export var move_speed := 1

enum EquipmentIndex{element,weapon,armor,backup}
@export var equipment_limits:Array[int] = [1,1,1,1] #这样设计至少能保证狮狮，星璇的话当成buff吧


var alive:bool = true
var health:int = max_health # 生命值
var armor_value:int = 0 # 护甲值
var collection_count:int = 0

#@export var abilities := [] 
#但是实际上，可能是直接写代码，而不是列ability……？
#不过也还是可以来写成一个专门的类——毕竟技能分被动主动，以及范围限制或无限范围
@onready var abilities = $Abilities
#子节点这种方式差不多相当于挂代码了√——大概能比数组方式更适合用来作“技能”吧


