extends Sprite2D

## Paramaters
var tween: Tween

# Signals
signal unitHover(unit)
signal unitClicked(unit)

# Nodes
@onready var unit_hitbox: Area2D = $unitHitbox

## Code
# Setup
func _ready() -> void:
	unit_hitbox.input_pickable = true
	unit_hitbox.connect("input_event", _on_unit_hitbox_input_event)
	unit_hitbox.mouse_entered.connect(userHover)
	unit_hitbox.mouse_exited.connect(userUnHover)

# Main

# Function Declerations
func _on_unit_hitbox_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.pressed:
		if event.button_index == MOUSE_BUTTON_LEFT:
			emit_signal("unitClicked", self)

func userHover() -> void:
	if tween and tween.is_running():
		tween.kill()
	
	# Init tween
	tween = create_tween().set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_BACK)
	tween.set_parallel(true)
	
	# Tween
	tween.tween_property(self, "scale:x", 1.2, 0.1)
	tween.tween_property(self, "scale:y", 0.75, 0.13)
	tween.tween_property(self, "rotation_degrees", randf_range(5.0, 10.0) * [-1.0, 1.0].pick_random(), 0.1)
	tween.chain().tween_property(self, "scale.x", 1.1, 0.15)
	tween.tween_property(self, "scale:y", 1.1, 0.15)
	tween.tween_property(self, "rotation_degrees", 0.0, 0.1)

func userUnHover() -> void:
	if tween and tween.is_running():
		tween.kill()
	
	tween = create_tween().set_ease(Tween.EASE_IN_OUT).set_trans(Tween.TRANS_CUBIC)
	tween.set_parallel(true)
	
	tween.tween_property(self, "scale", Vector2.ONE, 0.15)
	tween.tween_property(self, "rotation_degrees", 0.0, 0.15)
