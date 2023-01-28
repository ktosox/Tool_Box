extends HBoxContainer

export var busName : String

var targetBus = -1

func _ready():
	if busName == "":
		return
	targetBus = AudioServer.get_bus_index(busName)
	assert(targetBus != -1 ) # error, no such bus exists
	$Label.text = busName
	$HSlider.value = AudioServer.get_bus_volume_db(targetBus)

func _on_HSlider_value_changed(value):
	AudioServer.set_bus_volume_db(targetBus,value)
