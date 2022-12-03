extends KinematicBody


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	var direction = Vector3(int(Input.is_action_pressed("ui_right"))-int(Input.is_action_pressed("ui_left")),0,int(Input.is_action_pressed("ui_down"))-int(Input.is_action_pressed("ui_up")))
	direction = direction.normalized()
	if !is_on_floor():
		direction.y=-0.5
	move_and_slide(direction*5)
	
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
