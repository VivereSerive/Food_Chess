extends Node

## Code
func _ready() -> void:
	var parent = get_parent()
	await parent.ready
	for child in get_children():
		child.parent = parent
		child.enter()
