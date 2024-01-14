extends ArticyBase

var target

func _init(obj):
	super(obj)
	target = obj['Properties']['Target']
	
# recursive, handles chained jumps
func resolve():
	return Articy.package.objects.get_member(target).resolve()
