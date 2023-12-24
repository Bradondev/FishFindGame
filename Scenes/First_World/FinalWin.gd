extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready():
	$Frog2.LoopDance()
	$Frog3.LoopDance()
	$Frog.LoopDance()
	$Frog5.LoopDance()
	$Frog4.LoopDance()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
