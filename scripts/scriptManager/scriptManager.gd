extends Node

var parent = get_parent()
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print(parent)
