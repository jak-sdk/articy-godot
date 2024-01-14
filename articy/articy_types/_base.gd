extends Node
class_name ArticyBase

var input_pins = []
var output_pins = []
var id
var type

func _init(obj):
	set_input_pins(obj)
	set_output_pins(obj)
	id = obj['Properties']['Id']
	type = obj['Type']

func set_input_pins(obj):
	if 'InputPins' in obj['Properties']:
		for pin in obj['Properties']['InputPins']:
			input_pins.append(pin)

func set_output_pins(obj):
	if 'OutputPins' in obj['Properties']:
		for pin in obj['Properties']['OutputPins']:
			output_pins.append(pin)

# Most objects just resolve to themselves
# However 'Jump' objects must recursively keep resolving until
# we get to a normal object
func resolve():
	return self

func get_next():
	if len(output_pins[0]['Connections']) == 1:
		return Articy.package.objects.get_member(output_pins[0]['Connections'][0]['Target']).resolve()
