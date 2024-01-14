extends ArticyBase

var global_variable
var value

func _init(obj):
	super(obj)
	var expression = obj['Properties']['Expression'].split(" ")
	if len(expression) == 3:
		global_variable = expression[0]
		value = expression[2]

func test():
	# todo: support < etc.
	return Articy.variables[global_variable] == value
