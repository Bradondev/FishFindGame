extends CanvasLayer

signal next ()
signal menu ()
# Called when the node enters the scene tree for the first time.


func _on_menu_pressed():
	menu.emit()


func _on_next_pressed():
	next.emit()
