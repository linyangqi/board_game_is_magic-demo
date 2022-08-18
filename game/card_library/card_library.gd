extends Object
class_name CardLibrary

const ROOT_PATH = "res://game/card_library/"
const CHARACTER_PATH = ROOT_PATH + "characters/ponies/list/"
const EVENT_PATH = ROOT_PATH + "events/list/"
const PLAYABLE_PATH = ROOT_PATH + "playable/"
const ACTION_PATH = PLAYABLE_PATH + "actions/"
const TOOL_PATH = PLAYABLE_PATH + "tools/list/"

#用来服务Deck，便于“查阅”，因此并非在这里进行随机抽取
#后面Deck会建立卡牌名的列表Array，在实例化操作时会在这里调用
#所以“奖励牌”与“摸牌堆”的区分也是在deck层面的
const CARD_PATH :Dictionary = {
	"characters":{
		"狮狮" : CHARACTER_PATH + "extension_2/狮狮.tscn",
		"小梅" : CHARACTER_PATH + "extension_2/小梅.tscn",
		"睦睦" : CHARACTER_PATH + "extension_2/睦睦.tscn",
		"灵樨" : CHARACTER_PATH + "extension_2/灵樨.tscn",
	},
	"events":{
		"落叶长跑": EVENT_PATH+"落叶长跑",
	},
	"playable":{ #摸牌堆与奖励牌堆
		"心理攻击": ACTION_PATH + "attacks/mental/mental_attack.tscn",
		"物理攻击": ACTION_PATH + "attacks/physical/physical_attack.tscn",
		"法术攻击": ACTION_PATH + "attacks/magic/magic_attack.tscn",
		"偷牌": ACTION_PATH + "steal/steal.tscn",
		"触发事件": ACTION_PATH + "event_trigger/event_trigger.tscn",
	},
#	"bonus":{ #
#	},
	
}

#var a = CARD_PATH["characters"]["狮狮"]
