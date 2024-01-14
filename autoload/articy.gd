extends Node2D

var ARTICY_DIR      = "articy_data"
var ARTICY_DIR_RES  = "res://"+ARTICY_DIR+"/"
var ARTICY_MANIFEST = ARTICY_DIR_RES+"manifest.json"

var manifest = preload("res://articy/manifest.gd").new() 
var variables = {}
var package = preload("res://articy/package.gd").new() 

func _ready():
	manifest.set_manifest_data(ARTICY_MANIFEST)
	
	variables = manifest.load_variables()
	
	package.load(manifest.load_packages())
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
