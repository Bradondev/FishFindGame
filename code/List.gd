extends VBoxContainer

@export var label : PackedScene
var ArrayOfLabals
# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	

func _on_find_item_list_add_to_list(object):
	print(object.Name)
	var NewObject = label.instantiate()
	NewObject.text += object.Name
	object.connect("CrossOutLabel", _on_find_item_list_cross_out_label)
	add_child(NewObject)

func _on_find_item_list_create_arrary_for_objects_for_ui():
	ArrayOfLabals = get_children()




func _on_find_item_list_cross_out_label(Index):
	ArrayOfLabals[Index].CrossOut()
