extends VBoxContainer

export var autoFill = true # takes all of the existing busses and creates a volume slider for each one

onready var volumeBar = $VolumeBar

func _ready():
	if autoFill:
		for nextBus in AudioServer.bus_count:
			var newBar = volumeBar.duplicate()
			newBar.busName = AudioServer.get_bus_name(nextBus)
			add_child(newBar)
		volumeBar.queue_free() # get rid of the original
