extends Camera3D

@export var desired_Fov = 70 ## better don't touch
@export var fov_Step = 5
@export var max_Fov = 90
@export var min_Fov = 45
var Fov_Smooth : int = 70

func _physics_process(delta):
	if Input.is_action_pressed("zoom_in"):
		desired_Fov = desired_Fov - fov_Step
	elif Input.is_action_pressed("zoom_out"):
		desired_Fov = desired_Fov + fov_Step
	
	desired_Fov = clamp(desired_Fov, min_Fov, max_Fov)
	Fov_Smooth = lerp(Fov_Smooth, desired_Fov, 0.2)
	self.set_fov(Fov_Smooth)
	

