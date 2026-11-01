extends Control

@onready var main: Panel = $Main
@onready var settings: Panel = $Settings

func _ready() -> void:
	main.visible = true
	settings.visible = false


func _on_play_pressed() -> void:
	SceneLoader.load_scene("uid://cqjc8fkilwk2g", 1)


func _on_settings_pressed() -> void:
	main.visible = false
	settings.visible = true


func _on_exit_pressed() -> void:
	get_tree().quit()


func _on_back_pressed() -> void:
	main.visible = true
	settings.visible = false


func _on_fullscreen_toggle_toggled(toggled_on: bool) -> void:
	print("toggle")
	if toggled_on:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
