# Overview
This is an attempt to parse and integrate the JSON export format from Articy into Godot

# How To Use This
1. Copy the `articy/` folder into your Godot project.
2. Copy the `autoload/` folder into your Godot project
3. In Godot -> Project Setting -> Autoload, add the `autoload/articy.gd` as `Articy`
4. In `autoload/articy.gd`, set `ARTICY_DIR` to where your export `.json` files are.
5. Now in your Godot scripts you can interact with the loaded Articy project like so:
```
some_dialog = Articy.package.objects.get_member("some-dialog-id") # the id can the Id or the TechnicalName
first_dialog_fragment = some_dialog.get_first_fragment()

connections = fragment.output_pins[0]['Connections']

next_dialog_fragment_id = connections[0]["Target"]
next_dialog_fragment = Articy.package.objects.get_member(next_dialog_fragment_id)
```

## Example
The `autoload/dialogue.gd` file is purely provided as an example of how I use another singleton to manage interacting with Articy and controlling some UI component

# Notes
## Global variables
Global variables are read into `Articy.variables`.
## WIP
This is a work in progess!  
Important things **in progress**:
* Running instructions to set global variables
* Parsing conditions
* Custom scripts / instructions
* Properly handling end of dialog tree's / sub tree's
