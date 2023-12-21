extends MeshInstance3D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass



func _on_area_3d_mouse_entered():
	if Input.is_action_pressed("click_find"):
		print("you found it")
	print("Enter")


func _on_area_3d_mouse_exited():
	pass # Replace with function body.


func _on_area_3d_input_event(camera, event, position, normal, shape_idx):
	if event is InputEventAction:
		if Input.is_action_just_pressed("click_find"):
			print("find")
