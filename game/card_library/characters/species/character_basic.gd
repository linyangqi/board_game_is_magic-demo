extends Node
class_name CharacterBasic
#仅作信息库功能，不作动态操作（动态操作在继承此类的CharacterPlace类中）
#但是……如果不挂载的话，又怎么知道技能呢
#####……最后还是决定，主要信息都存储在此处位置（可以变化），而“位”的工作在交给“角色位”吧
#能变化，因为使用时用的是实例化过的

#幻形灵会抄技能

@export var character_name := ""
@export var collection_requirement :Array[String]

@export var max_health := 14 :
	#get 实际上没有差别，代码省了
	set(value):
		#set get这样一下，max_health 在人为设定时
		#health才能在初始化时始终与max_health保持一致（否则会出现max设为12时，初始health还是14）
		#此外，诚实元素的操作也只需要修改max_health，而无需再次单独调整health了
		#相当于“所受伤害”才是“硬通货”这样的……
		health += value - max_health
		max_health = value
var health:int = max_health # 生命值

@export var mental_attack := 1
@export var physical_attack := 1
@export var magic_attack := 1
@export var move_range := 1

#正常攻击范围，受装备以及效果牌影响。大公主攻击无视此条，还有话筒……？
var attack_range:int = 0 
#-1表示无法攻击，-2表示范围无限，-3表示直线范围……程序斟酌一下吧

#移动机会与攻击机会本身并没有“最大”一说，绝大部分角色都默认为1
#不过对于云宝的技能……后面或许只用在这里设置就行了？
#那这样，角色设定是不是有点太多了……
#大概，不用@export吧，或者只是测试的时候用@export，《《正式情况还是用代码实现》》
#不然你看狮狮“两个装备栏”……其他角色也不太可能有，所以还是通过ability来额外设置了
var default_move_chance := 1 :
	set(value):
		move_chance += value - default_move_chance
		default_move_chance = value
var move_chance := default_move_chance

var default_attack_chance := 1 :
	set(value):
		attack_chance += value - default_attack_chance
		default_attack_chance = value
var attack_chance := default_attack_chance


enum EquipmentIndex{element,weapon,armor,backup}
var equipment_limits:Array[int] = [1,1,1,1] #这样设计至少能保证狮狮，星璇的话当成buff吧


#var armor_value:int = 0 # 护甲值
#新设计模式下护甲值视作加成效果而非基础属性了
var collection_count:int = 0




#@export var abilities := [] 
#但是实际上，可能是直接写代码，而不是列ability……？
#不过也还是可以来写成一个专门的类——毕竟技能分被动主动，以及范围限制或无限范围
#@onready var abilities = $Abilities
#子节点这种方式差不多相当于挂代码了√——大概能比数组方式更适合用来作“技能”吧

#2022.9.25新设计模式下，区分”主动技能“和”被动技能“
#被动技能自动注册到”效果注册表“上，而主动技能不会自动注册
#或者，某些特殊情况下发动的主动技能，其实也可以注册的
#嘛，那这样其实就不好直接区分主动/被动技能了……
#那主动技能在调取的时候检查一下吧？
