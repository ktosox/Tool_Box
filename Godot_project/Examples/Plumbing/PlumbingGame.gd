extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	test_fill()
	pass # Replace with function body.
func _input(event):
	if event.is_action_pressed("LMB"):
		if get_global_mouse_position().x<600 and get_global_mouse_position().y<600 :
			rotate_tile($TileMap.world_to_map(get_global_mouse_position()))
		
func rotate_tile(tile):
	if($TileMap.get_cellv(tile) == 1):
		$TileMap.set_cellv(tile, 1,false, false, !$TileMap.is_cell_transposed(tile.x,tile.y))
	if($TileMap.get_cellv(tile) == 2):
		match Vector2($TileMap.is_cell_x_flipped(tile.x,tile.y),$TileMap.is_cell_y_flipped(tile.x,tile.y)):
			Vector2(1,0):
				$TileMap.set_cellv(tile, 2,true, true)
				
			Vector2(0,0):
				$TileMap.set_cellv(tile, 2,true, false)
			Vector2(1,1):
				$TileMap.set_cellv(tile, 2,false, true)
				
			Vector2(0,1):
				$TileMap.set_cellv(tile, 2,false, false)
	pass		

func test_fill():
	for x in 12 :
		for y in 12:
			if($TileMap.get_cell(x,y) == -1 ):
				$TileMap.set_cell(x,y, (randi()%2)+1,randi()%2,randi()%2, randi()%2)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
