extends Object
class_name Player
#主要用途是确定角色的控制者，以及网络通信之类


#由于在players管理中是直接用数组了，因此便免去id了
var name := "" #可能用不上……

var ip := "" #日后网络连接备用
var online := true #如果断线了……也好操作吧
