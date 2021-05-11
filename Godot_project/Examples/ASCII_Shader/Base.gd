extends TextureRect


onready var images = [
	preload("res://Examples/ASCII_Shader/NMNH-Psychotria2.jpg"),
	preload("res://Examples/ASCII_Shader/NPG-S-NPG_90_50_u.jpg"),
	preload("res://Examples/ASCII_Shader/greg-ramsden-the-drift.jpg"),
	preload("res://Examples/ASCII_Shader/pexels-suzy-hazelwood-1329644.jpg"),
	preload("res://Examples/ASCII_Shader/image-asset.jpeg"),
	preload("res://Examples/ASCII_Shader/Among-us.jpg")
]

var current = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	load_next()
	pass # Replace with function body.

func load_next():
	texture = images[current]
	current+=1
	if current >= images.size() :
		current = 0
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Button_pressed():
	load_next()
	pass # Replace with function body.


func _on_Button2_pressed():
	$CPUParticles2D.emitting = !$CPUParticles2D.emitting
	pass # Replace with function body.


func _on_Button3_pressed():
	$CPUParticles2D2.emitting = !$CPUParticles2D2.emitting
	pass # Replace with function body.


func _on_VSlider_value_changed(value):
	self.self_modulate.r = value
	self.self_modulate.g = value
	self.self_modulate.b = value
	pass # Replace with function body.
