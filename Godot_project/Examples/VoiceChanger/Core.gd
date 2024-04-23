extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var playback2 = $Mic2.get_stream_playback()

onready var playback3 = $Mic3.get_stream_playback()
# Called when the node enters the scene tree for the first time.
func _ready():

	for device in AudioServer.capture_get_device_list():
		$SelectCaptureDevice.add_item(device)
	
	for device in AudioServer.get_device_list():
		$SelectOutputDevice.add_item(device)
		
	AudioServer.capture_device = $SelectCaptureDevice.get_item_text(1)
	AudioServer.device = $SelectOutputDevice.get_item_text(2)
	#AudioServer.set_deferred("device",)
#	AudioServer.set_device("VoiceMeeter Input (VB-Audio VoiceMeeter VAIO)")
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var idx = AudioServer.get_bus_index("Record")
	var capture = AudioServer.get_bus_effect(idx, 0)
	var buffer = capture.get_buffer(capture.get_frames_available())
	playback2.push_buffer(buffer)
	playback3.push_buffer(buffer)
	pass





func _on_SelectCaptureDevice_item_selected(index):
	AudioServer.capture_device = $SelectCaptureDevice.get_item_text(index)
	yield(get_tree().create_timer(0.2),"timeout")
	print("capture_device: ", AudioServer.capture_device)
	pass # Replace with function body.


func _on_SelectOutputDevice_item_selected(index):
	AudioServer.device = $SelectOutputDevice.get_item_text(index)
	yield(get_tree().create_timer(0.2),"timeout")
	print("output_device: ", AudioServer.device)
	pass # Replace with function body.


func _on_Button_pressed():
	$testSFX.play()
	pass # Replace with function body.
