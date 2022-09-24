extends Object
class_name CardLibrary


const CARD_RECT := Vector2i(595,842) #牌面像素大小


const ROOT_PATH = "res://game/card_library/"
const CHARACTER_PATH = ROOT_PATH + "characters/list/" 
#新架构下角色路径就在常量这里删了个ponies，不用在下面一个个改了√
const EVENT_PATH = ROOT_PATH + "events/list/"
const PLAYABLE_PATH = ROOT_PATH + "playable/"
const ACTION_PATH = PLAYABLE_PATH + "actions/"
const TOOL_PATH = PLAYABLE_PATH + "tools/list/"

#用来服务Deck，便于“查阅”，因此并非在这里进行随机抽取
#后面Deck会建立卡牌名的列表Array，在实例化操作时会在这里调用
#所以“奖励牌”与“摸牌堆”的区分也是在deck层面的

const CARD_PATH :Dictionary = {
	#扁平化，不分子类了……不过要注意不同种类的牌的index也要不重复
	#角色牌，注意这里index应与节点中character_name属性相同
		#因为”寻源“是利用character_name的
		#比如 CardLibrary.load_card(character.character_name)
	"Applejack":CHARACTER_PATH + "base_pack/applejack/applejack.tscn",
	"Apple Bloom":CHARACTER_PATH + "base_pack/apple_bloom/apple_bloom.tscn",
	"Big Macintosh":CHARACTER_PATH + "base_pack/big_macintosh/big_macintosh.tscn",
	"Bon Bon":CHARACTER_PATH + "base_pack/bon_bon/bon_bon.tscn",
	"Derpy Hooves":CHARACTER_PATH + "base_pack/derpy_hooves/derpy_hooves.tscn",
	"Doctor Whooves":CHARACTER_PATH + "base_pack/doctor_whooves/doctor_whooves.tscn",
	"Fluttershy":CHARACTER_PATH + "base_pack/fluttershy/fluttershy.tscn",
	"Lyra Heartstring":CHARACTER_PATH + "base_pack/lyra_heartstring/lyra_heartstring.tscn",
	"Octavia Melody":CHARACTER_PATH + "base_pack/octavia_melody/octavia_melody.tscn",
	"Pinkie Pie":CHARACTER_PATH + "base_pack/pinkie_pie/pinkie_pie.tscn",
	"Rainbow Dash":CHARACTER_PATH + "base_pack/rainbow_dash/rainbow_dash.tscn",
	"Rarity":CHARACTER_PATH + "base_pack/rarity/rarity.tscn",
	"Scootaloo":CHARACTER_PATH + "base_pack/scootaloo/scootaloo.tscn",
	"Starlight Glimmer":CHARACTER_PATH + "base_pack/starlight_glimmer/starlight_glimmer.tscn",
	"Sunset Shimmer":CHARACTER_PATH + "base_pack/sunset_shimmer/sunset_shimmer.tscn",
	"Sweetie Belle":CHARACTER_PATH + "base_pack/sweetie_belle/sweetie_belle.tscn",
	"Trixie":CHARACTER_PATH + "base_pack/trixie/trixie.tscn",
	"Twilight Sparkle":CHARACTER_PATH + "base_pack/twilight_sparkle/twilight_sparkle.tscn",
	"Vinyl Scratch":CHARACTER_PATH + "base_pack/vinyl_scratch/vinyl_scratch.tscn",
	"Zecora":CHARACTER_PATH + "base_pack/zecora/zecora.tscn",
	"狮狮" : CHARACTER_PATH + "extension_2/狮狮.tscn",
	"小梅" : CHARACTER_PATH + "extension_2/小梅.tscn",
	"睦睦" : CHARACTER_PATH + "extension_2/睦睦.tscn",
	"灵樨" : CHARACTER_PATH + "extension_2/灵樨.tscn",
	
	#事件牌
	"落叶长跑": EVENT_PATH+"落叶长跑.tscn",
	
	#摸牌堆与奖励牌堆
	"心理攻击": ACTION_PATH + "attacks/mental/mental_attack.tscn",
	"物理攻击": ACTION_PATH + "attacks/physical/physical_attack.tscn",
	"法术攻击": ACTION_PATH + "attacks/magic/magic_attack.tscn",
	"偷牌": ACTION_PATH + "steal/steal.tscn",
	"触发事件": ACTION_PATH + "event_trigger/event_trigger.tscn",
	
#	"bonus":{ #
#	},
}

#var a = CARD_PATH["characters"]["狮狮"]

static func load_card(name:String) ->Node:
	return load(CARD_PATH[name]).instantiate()


#static func new(name:String) ->Node:
#	#这个有点不知道什么意思……或许instantiate已经相当于new了？……
#	#或者还是别多次load吧，在外部new就好了
#	return load(CARD_PATH[name]).instantiate().new()
