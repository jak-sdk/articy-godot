extends Node

var typemap = {
	"Dialogue" : preload("res://articy/articy_types/dialogue.gd"), 
	"DialogueFragment" : preload("res://articy/articy_types/dialogue_fragment.gd"), 
	"Condition" : preload("res://articy/articy_types/condition.gd"), 
	"Instruction" : preload("res://articy/articy_types/instruction.gd"), 
	"Jump" : preload("res://articy/articy_types/jump.gd")
	}

var object_type = null
var objects = {}
var object_name_to_id = {}


func add(obj):
	objects[obj['Properties']['Id']] = typemap[obj['Type']].new(obj)
	object_name_to_id[obj['Properties']['TechnicalName']] = obj['Properties']['Id']
	
func get_member(reference):
	if reference in objects.keys():
		return objects[reference]
	elif reference in object_name_to_id.keys():
		return objects[object_name_to_id[reference]]
	else:
		push_error("object " + reference + " not found!")

