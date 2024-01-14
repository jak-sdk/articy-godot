extends Node

var manifest_data = {}

func set_manifest_data(filepath):
	var json = FileAccess.get_file_as_string(filepath)
	manifest_data = JSON.parse_string(json)
	
func load_variables():
	var variables_file = manifest_data['GlobalVariables']['FileName']
	var json = FileAccess.get_file_as_string(Articy.ARTICY_DIR_RES + variables_file)
	var raw_variables = JSON.parse_string(json)
	
	### design decision:
	# Articy has a hierarchy of global variables, but they are all represented
	# in the .json as dot-concatenated e.g. "scene1.trapdoor_opened"
	# So for now, we just use that whole string as a flat key for the variable hashmap
	var variables = {}
	for _namespace in raw_variables['GlobalVariables']:
		for variable in _namespace['Variables']:
			variables[_namespace['Namespace']+"."+variable['Variable']] = create_var(variable)
	
	print(str(len(variables)) + " variables loaded")
	
	return variables

func create_var(variable):
	if variable['Type'] == "Boolean":
		if variable['Value'] == "True":
			return true
		elif variable['Value'] == "False":
			return false
		else:
			push_error("Unrecognised Boolean")
			
	elif variable['Type'] == "Integer":
		return int(variable['Value'])
	elif variable['Type'] == "String":
		return variable['Value']
	else:
		push_error("Unrecognised variable type")

func load_packages():
	
	var packages = manifest_data['Packages']
	return packages
	

		
	
