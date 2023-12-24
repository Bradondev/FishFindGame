extends Node3D

var scenes_paths = ["res://Scenes/First_World/world_1.tscn", "res://Scenes/First_World/world_2.tscn"]
var ObjectsGetttingLookedFor
var LengthOfList
var current_scene
@export var win_panel : CanvasLayer
# Called when the node enters the scene tree for the first time.
signal  AddToList(object)
signal  CreateArraryForObjectsForUi
func _ready():
	ObjectsGetttingLookedFor = get_children()
	for Found in ObjectsGetttingLookedFor:
		Found.connect("CheckIfAllObjectsWereFound",CheckIfAllFound)
		emit_signal("AddToList", Found)
	print(LengthOfList)
	emit_signal("CreateArraryForObjectsForUi")
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	current_scene = get_tree().current_scene.name

func CheckIfAllFound():
	var Temp = -1
	LengthOfList =  ObjectsGetttingLookedFor.size()
	for Found in ObjectsGetttingLookedFor:
		Temp += 1
		if Found.Found == true:
			print(Found.Name + " Is found")
			LengthOfList -= 1
			
		else: 
			print("all items are not found yet")
	print("Number of Objects left to find: "+str(LengthOfList))
	if LengthOfList == 0:
		win_panel.visible = !win_panel.visible

func change_scene(scene_path : String):
	get_tree().change_scene_to_file(scene_path)

func _on_win_panel_next():
	if current_scene == "World_1":
		change_scene(scenes_paths[1])
	if current_scene == "World_2":
		change_scene(scenes_paths[0])


func _on_win_panel_menu():
	change_scene("res://start_screen.tscn")
