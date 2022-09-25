extends Object
class_name TagBoard

var board:Dictionary #索引为tag，值为Array类型

func register(item):#要求item有tags数组（Array[String]）
	for tag in item.tags:
		if not board.has(tag):
			board[tag]=[]
		board[tag].append(item)

func delete(item):
	for tag in item.tags:
		board[tag].remove_at(board[tag].find(item))
		if board[tag].is_empty():
			board.erase(tag)

func select_by_tags(tags:Array)->Array: #交集式选取
	var result:Array = []
	if not tags.is_empty():
		result = board[tags[0]].duplicate()
		for tag in tags:
			for item in result:
				if not board[tag].has(item):
					result.remove_at(result.find(item))
					#算法：排除式
	return result
