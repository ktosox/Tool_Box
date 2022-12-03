extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var allShaderScenes = {}
var scenesToDo = []

# Called when the node enters the scene tree for the first time.
func _ready():
	var dir = Directory.new()
	if dir.open("res://Examples/Shader_Examples/ShaderScenes/") == OK:
		dir.list_dir_begin()
		var file_name = dir.get_next()
		while file_name != "":
			if !dir.current_is_dir():
				allShaderScenes[file_name] = load("res://Examples/Shader_Examples/ShaderScenes/"+file_name)
			file_name = dir.get_next()
	else:
		print("An error occurred when trying to access the path.")
	scenesToDo = allShaderScenes.keys()
	pass


func load_next_scene():
	if scenesToDo.size() == 0:
		get_tree().quit()
	var nextKey = scenesToDo.pop_front()
	$Label.text = nextKey.trim_suffix(".tscn")
	var nextScene = allShaderScenes[nextKey]
	$Node2D.get_child(0).queue_free()
	var newScene = nextScene.instance()
	$Node2D.add_child(newScene)
	if nextKey == "ThousandPetals.tscn" or nextKey == "EtherSmoke.tscn":
		print("slow")
		$AnimationPlayer.playback_speed = 0.6
	else:
		$AnimationPlayer.playback_speed = 1.0
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass



func _on_Button_pressed():
	$AnimationPlayer.play("nextSlide")
	$Button.queue_free()
	pass # Replace with function body.
