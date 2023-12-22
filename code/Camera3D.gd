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

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_WHEEL_UP:
			desired_Fov = desired_Fov - fov_Step
		elif event.button_index == MOUSE_BUTTON_WHEEL_DOWN:
			desired_Fov = desired_Fov + fov_Step
	if event.is_action_pressed("click_find"):
		ShootRay()

	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func ShootRay():
	var Mouse_pos = get_viewport().get_mouse_position()
	var ray_Length = 10000
	var from = project_ray_origin(Mouse_pos)
	var to = from + project_ray_normal(Mouse_pos) * ray_Length
	var space = get_world_3d().direct_space_state
	var ray_query = PhysicsRayQueryParameters3D.new()
	ray_query.from = from
	ray_query.to = to
	var raycast_result = space.intersect_point(ray_query)
	print(raycast_result)

