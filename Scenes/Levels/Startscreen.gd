extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("ani")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_start_pressed():
	get_tree().change_scene_to_file("res://Scenes/First_World/world_1.tscn")


func _on_quit_pressed():
	get_tree().quit()
