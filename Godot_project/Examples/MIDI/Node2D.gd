extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_MidiPlayer_midi_event(channel, event):
	var track =	$HBoxContainer.get_child(channel.number) as ColorRect
	print(channel.number," : ",channel.note_on)
	if event.type == 128 :
		track.color = ColorN("Red")
	elif event.type == 144 :
		track.color = ColorN("Green")
	else:
		track.color = ColorN("Blue")
#	print(channel.number," : ", event.type)

#			var channel:GodotMIDIPlayerChannelStatus = self.channel_status[event_chunk.channel_number]
#		var event:SMF.MIDIEvent = event_chunk.event
	pass # Replace with function body.



