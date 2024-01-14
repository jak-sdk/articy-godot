extends Node

# I set this 
var dialog_box = null

func start_dialog(dialogue_id):
	print("starting dialog " + str(dialogue_id))
	
	# here you could pause the gameplay for example

	# get first fragment
	var fragment_id = Articy.package.objects.get_member(dialogue_id).get_first_fragment()
	
	# display first fragment
	display_fragment(fragment_id)
	
func display_fragment(fragment):	
	var text = fragment.display_text()
	
	dialog_box.say_dialogue_fragment(text)
	
	# handle the output pins from fragment
	var outputs = len(fragment.output_pins[0]['Connections'])
	
	if outputs == 1:
		var next_fragment = fragment.get_next()
		
		# this is a hack for now
		if next_fragment.type == "Dialogue":
			dialog_box.present_dialogue_options([{"text":"END", "next": "END"}])
		else:	
			dialog_box.present_dialogue_options([{"text":"Continue", "next": next_fragment.id}])
	
	elif outputs > 1:
		# present the options
		var opts = []
		var next = null
		for opt in fragment.output_pins[0]['Connections']:
			next = Articy.package.objects.get_member(opt['Target'])
			opts.append({"text": next.display_text(), "next": next.id})
		dialog_box.present_dialogue_options(opts)

	else: 
		dialog_box.present_dialogue_options([{"text":"END", "next": "END"}])
		
func end_dialog():
	print("ending dialog")
	# minimise the dialogue window
	# tell the game to resume play

# callback from the dialogue box, i.e. a button that represents one of the response options
# could call this and pass in the Id of the next dialogue fragment to go to 
func _continue(next=null):
	var next_fragment = Articy.package.objects.get_member(next)
	display_fragment(next_fragment)

