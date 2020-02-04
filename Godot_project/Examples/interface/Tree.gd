extends Tree


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	var newItem = create_item()
	newItem.set_text(0, "gffgfgfgfG")
	newItem.set_tooltip(2,"ffdffddfdfd")
	newItem = create_item()
	newItem.set_text(3, "gffgf545454gfgfG")
	newItem.set_text(2, "9898989898")
	newItem = create_item()
	newItem.set_text(4, "g54gfgfG")
	var tex = load("res://icon.png")
	newItem.set_icon(2,tex)
	#newItem.move_to_top()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
