extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var maxSpeed = 300

var acceleration = 1200

export var damping = 1.0

export var friction = 1.0

var gravity = 980

var velocity = Vector2(0,0)

var inAir = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _physics_process(delta):
	
	velocity.x = (velocity.x * abs(friction-1) ) + (delta * (acceleration/lerp(1.0,0.1,friction)) * ( -int(Input.is_action_pressed("ui_left"))+int(Input.is_action_pressed("ui_right")) ) )
	
	velocity.x  = clamp(velocity.x,-maxSpeed,maxSpeed)

	move_and_slide(velocity,Vector2(0,-1),true,4,2.0)
	if(!is_on_floor()):
		velocity.y+=gravity*delta
	else:
		inAir = false
		velocity.y = 0
#		$CollisionShape2D.position.y = -20
#		$Polygon2D.position.y = 0
		 
	
func _input(event):
	print(event)
	if (event.is_action_pressed("jump") and !inAir ):
		velocity.y =-400
#		$CollisionShape2D.position.y = -17
#		$Polygon2D.position.y = -3
		inAir = true
		print("jump")
	if event.is_action_pressed("ui_accept"):
		print(velocity)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
