extends Node

## Parameters
var tween: Tween
var parent

## Code
func _ready() -> void:
	# Wait for script_manager to delegate parent
	if parent == null:
		await get_tree().create_timer(1.0).timeout 
	parent.unit_hitbox.mouse_entered.connect(userHover)
	parent.unit_hitbox.mouse_exited.connect(userUnHover)

## Function Declerations
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
	tween.chain().tween_property(self, "scale:x", 1.1, 0.15)
	tween.tween_property(self, "scale:y", 1.1, 0.15)
	tween.tween_property(self, "rotation_degrees", 0.0, 0.1)

func userUnHover() -> void:
	if tween and tween.is_running():
		tween.kill()
	
	tween = create_tween().set_ease(Tween.EASE_IN_OUT).set_trans(Tween.TRANS_CUBIC)
	tween.set_parallel(true)
	
	tween.tween_property(self, "scale", Vector2.ONE, 0.15)
	tween.tween_property(self, "rotation_degrees", 0.0, 0.15)
