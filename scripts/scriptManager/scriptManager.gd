extends Node

## Code
func _ready() -> void:
	var parent = get_parent()
	for child in get_children():
		child.parent = parent
