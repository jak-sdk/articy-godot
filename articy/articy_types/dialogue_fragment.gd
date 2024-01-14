extends ArticyBase

var _text = ""

func _init(obj):
	super(obj)
	_text = obj['Properties']['Text']
	
	
func display_text(lang = "en-GB"):
	return Articy.package.localizations[_text][lang]['Text']
	
