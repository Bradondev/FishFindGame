extends MeshInstance3D

var axis = Vector3(0,1,0)

##this is the speed of rotation
@export var rotate_amount = 3


func _physics_process(delta):
	if Input.is_action_pressed("move_right"):
		rotate_y(rotate_amount * delta)
	
	if Input.is_action_pressed("move_left"):
		rotate_y(-rotate_amount * delta)
