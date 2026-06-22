class_name MainMenu
extends Control

## Paramaters
# Scene References
const SETTINGS_MENU = preload("uid://cuu3snvd8mph")
const CHESS_MAIN = preload("uid://mhdy3qanvcfa")

func _on_btn_start_pressed() -> void:
	get_tree().change_scene_to_packed(CHESS_MAIN)

func _on_btn_settings_pressed() -> void:
	get_tree().change_scene_to_packed(SETTINGS_MENU)

func _on_btn_exit_pressed() -> void:
	get_tree().quit()
