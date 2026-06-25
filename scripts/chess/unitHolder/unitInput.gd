extends Node

## Parameters
var parent

## Code
func enter() -> void:
	parent.unit_hitbox.input_pickable = true

func _on_unit_hitbox_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.pressed:
		if event.button_index == MOUSE_BUTTON_LEFT:
			#emit_signal("unitClicked", parent)
			print("click")
