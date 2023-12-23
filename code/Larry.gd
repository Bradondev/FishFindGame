class_name  FindItem extends Node3D
@export var Name : String
var Found = false
# Called when the node enters the scene tree for the first time.
signal  CheckIfAllObjectsWereFound
signal  CrossOutLabel(Index)
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_3d_input_event(camera, event, position, normal, shape_idx):
	if event is InputEventMouseButton:
		if Input.is_action_just_pressed("click_find"):
			Found = true
			print("finded")
			emit_signal("CheckIfAllObjectsWereFound")
			emit_signal("CrossOutLabel",get_parent().ObjectsGetttingLookedFor.find(self))
