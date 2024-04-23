extends ViewportContainer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.



#func _process(delta):



func _on_Timer_timeout():
	$Viewport.render_target_update_mode = Viewport.UPDATE_ONCE
	pass # Replace with function body.
