extends ArticyBase

var _display_name = ""

func _init(obj):
	super(obj)
	_display_name = obj['Properties']['DisplayName']
	
	
func display_name(lang = "en-GB"):
	return Articy.package.localizations[_display_name][lang]['Text']
	
func get_first_fragment():
	var target = input_pins[0]['Connections'][0]['Target']
	return Articy.package.objects.get_member(target)
