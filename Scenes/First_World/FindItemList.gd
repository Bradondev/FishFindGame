extends Node3D

var ObjectsGetttingLookedFor
var LengthOfList
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
	pass

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
		print("you found all the items")
