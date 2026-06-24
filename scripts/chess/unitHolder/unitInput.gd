extends Node

## Parameters
var parent

## Code
func _ready() -> void:
	# Wait for script_manager to delegate parent
	if parent == null:
		await get_tree().create_timer(1.0).timeout # Wait for script_manager to init parent
	parent.unit_hitbox.input_pickable = true
	parent.unit_hitbox.connect("input_event", _on_unit_hitbox_input_event)

func _on_unit_hitbox_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.pressed:
		if event.button_index == MOUSE_BUTTON_LEFT:
			emit_signal("unitClicked", self)
