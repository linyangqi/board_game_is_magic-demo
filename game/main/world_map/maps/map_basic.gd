extends TileMap


############
#模仿着写的函数
#源：https://github.com/godotengine/godot/pull/54549/commits/7305390fdcdfc3fa4c6e628fc1d5bb15160c7b94
#godot更新之后这个应该可以直接改为使用内置函数吧……
func get_cell_tile_data(layer:int,coords:Vector2i, use_proxies:bool)->TileData:
	var source_id := get_cell_source_id(layer, coords, use_proxies)
	var source:TileSetSource = tile_set.get_source(source_id)
	#源函数还有个“判断source有效性”的语句……这里省了
	return source.get_tile_data(get_cell_atlas_coords(layer, coords, use_proxies),0)#alternative_data是干啥用的……


#然后下面这个是自写函数，架构里Map只用了一层
#不过为了写法统一，还是把layer放前面吧
func get_cell_custom_data(layer:int,coords:Vector2i,layer_name:String)->Variant:
	var tile_data = get_cell_tile_data(layer,coords,false)
	return tile_data.get_custom_data(layer_name)
