extends ArticyBase

var global_variable
var value

func _init(obj):
	super(obj)
	var expression = obj['Properties']['Expression'].split(" ")
	global_variable = expression[0]
	value = expression[2]

func execute():
	Articy.variables[global_variable] = value
