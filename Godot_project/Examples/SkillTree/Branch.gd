extends Path2D

export var maxPoints = 5.0

export var points = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	update_line()
	$Token.unit_offset = 0
	pass # Replace with function body.


func update_line():
	curve.clear_points()
	curve.add_point($start.global_position-global_position)
	curve.add_point($end.global_position-global_position)
	$Line2D.points = curve.get_baked_points()
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func add_point(nr):
	if (maxPoints < nr + points):
		print("cant add ",nr," points - over max points")
	else:
		points += nr
		$Token.unit_offset = points/maxPoints
	pass

func rem_point(nr):
	if(nr>points):
		print("error - cant remove ",nr," points, only ", points," points are avialabe")
	else:
		points -= nr
		$Token.unit_offset = points/maxPoints
	pass

func _on_Button_pressed():
	add_point(1)
	pass # Replace with function body.


func _on_Button2_pressed():
	rem_point(2)
	pass # Replace with function body.
