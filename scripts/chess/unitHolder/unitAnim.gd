extends Node

## Parameters
var tween: Tween
var parent

## Code
func enter() -> void:
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
	tween.tween_property(parent, "scale:x", 1.2, 0.1)
	tween.tween_property(parent, "scale:y", 0.75, 0.13)
	tween.tween_property(parent, "rotation_degrees", randf_range(5.0, 10.0) * [-1.0, 1.0].pick_random(), 0.1)
	tween.chain().tween_property(parent, "scale:x", 1.1, 0.15)
	tween.tween_property(parent, "scale:y", 1.1, 0.15)
	tween.tween_property(parent, "rotation_degrees", 0.0, 0.1)

func userUnHover() -> void:
	if tween and tween.is_running():
		tween.kill()
	
	tween = create_tween().set_ease(Tween.EASE_IN_OUT).set_trans(Tween.TRANS_CUBIC)
	tween.set_parallel(true)
	
	tween.tween_property(parent, "scale", Vector2.ONE, 0.15)
	tween.tween_property(parent, "rotation_degrees", 0.0, 0.15)
