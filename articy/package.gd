extends Node

var TYPES = ["Dialogue", "DialogueFragment", "Condition", "Instruction", "Jump"]
var objects = {}
var localizations = {}

func _init():
	var collection = preload("res://articy/collection.gd")
	objects = collection.new()

func load(packages):
	## Massive assumption that Articy continues to only produce one package: "Name": "All objects"
	packages = packages[0]
	#print(packages)
	
	var objects_count = {}
	for type in TYPES:
		objects_count[type] = 0
	var obj_file = packages['Files']['Objects']['FileName']
	var obj_json = FileAccess.get_file_as_string(Articy.ARTICY_DIR_RES + obj_file)
	var raw_obj = JSON.parse_string(obj_json)
	for obj in raw_obj['Objects']:
		if obj['Type'] in TYPES:
			objects.add(obj)
			objects_count[obj['Type']] += 1
			
	for type in TYPES:
		print(str(objects_count[type]) + " " + type + " loaded")
	
	var txt_file = packages['Files']['Texts']['FileName']
	var txt_json = FileAccess.get_file_as_string(Articy.ARTICY_DIR_RES + txt_file)
	localizations = JSON.parse_string(txt_json)

