extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var speed = 200
var animating = false


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _input(event):
	if(event.is_action_pressed("LMB") and get_global_mouse_position().y >100):
		record_point()

func reset():
	$Path2D.curve.clear_points()

func record_point():
	if(!animating):
		if($Path2D.curve.get_baked_length() == 0):
			$Path2D.curve.add_point(get_global_mouse_position()-global_position)
		else:
			$Path2D.curve.add_point(get_global_mouse_position()-global_position,Vector2(randf()*60,randf()*60),Vector2(-randf()*60,-randf()*60))
#	$orb3.global_position = $Path2D.curve.get_point_position()
	print($Path2D.curve.get_point_count())
	pass

func _process(delta):
	if(animating):
		$Path2D/PathFollow2D.offset += delta * speed
	pass


func _on_Start_pressed():
	print($Path2D.curve.get_point_count())
	animating = true
	$Line2D.visible = true
	$Line2D.clear_points()
	$Line2D.points = $Path2D.curve.get_baked_points()
	pass # Replace with function body.


func _on_Stop_pressed():
	$Path2D/PathFollow2D.offset = 0
	reset()
	$Line2D.visible = false
	animating = false
	pass # Replace with function body.
