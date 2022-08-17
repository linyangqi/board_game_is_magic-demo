extends EffectBasic

enum {ATTACK_MENTAL=1, ATTACK_PHYSICAL=2, ATTACK_MAGIC=3, ATTACK_REAL=4}
enum AttackType{ATTACK_MENTAL=1, ATTACK_PHYSICAL=2, ATTACK_MAGIC=3, ATTACK_REAL=4}

@export var type:AttackType
@export var strength:int = 1
