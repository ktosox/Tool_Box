extends TileMap

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var cells_to_clear = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	for x in 90:
		for y in 90:
			if (get_cell(x,y) == 10):
				cells_to_clear+=1
	print (cells_to_clear)
	
	pass # Replace with function body.

func _input(event):
	if(event.is_action_pressed("LMB")):
		action_tile(world_to_map(get_global_mouse_position()))
		

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func scan_tile(tile):
	var adjesent_tiles = [tile+Vector2(1,0), tile+Vector2(0,1), tile+Vector2(1,1), tile+Vector2(-1,0), tile+Vector2(0,-1), tile+Vector2(-1,-1), tile+Vector2(-1,1), tile+Vector2(1,-1)]
	var bomb_count = 0
	for x in adjesent_tiles :
		if (get_cellv(x)==11):
			bomb_count+=1
	set_cellv(tile,bomb_count)
	cells_to_clear -= 1
	if(cells_to_clear == 0):
		print("game won")
	if(bomb_count == 0):
		for z in adjesent_tiles :
			if (get_cellv(z) == 10):
				scan_tile(z)

	return bomb_count
	pass

func action_tile(tile):
	match(get_cellv(tile)):
		10:
			scan_tile(tile)
		11:
			set_cellv(tile,9)
			print("game lost")
	pass
	
