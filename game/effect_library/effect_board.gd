extends Node
#行为通过Trigger发送信息……？这样才能检查其继承的”类“（关系）
#又或者Trigger使用组合……？但是也可以有一种”组合“类吧？


var effects:TagBoard
	#索引是事件名称（“tag”）
	#值是存储”效果“的数组（Effect类）
	

#新的设计模式下，effect_board模仿呆站图片管理（tag方式）
#至于effect的运算，就交给manager了

var triggers:TagBoard
	#一部分tag的effect可能会导致另外一部分effect自动生效
	#索引为”触发源“，值为连带自动触发的effect列表
	#如果值也是tag那这个表就静态了……但实际情况是，”触发连带“也是要自行注册的
	#manager中一般会把这个表用来寻找原effect的”修饰effect“
	#
	#与board最简单的区别方法：trigger本身存的不是自己的tag，而board是自己的tag
	#
	#比如”防御“会以”攻击“为trigger，”破甲“会 以”防御“为trigger
	#取交集的话……这里可以给出方法


#注册表的行为：注册，
#（”效果“的行为交给效果自己吧……？）
#emmmmm干脆“注册”之类的操作也交给effect吧？（写起来方便点）
#算了，effect是因为board才需要“注册”功能的


