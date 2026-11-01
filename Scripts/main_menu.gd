extends Control

@onready var main: Panel = $Main
@onready var settings: Panel = $Settings

func _ready() -> void:
	main.visible = true
	settings.visible = false


func _on_play_pressed() -> void:
	pass # Replace with function body.


func _on_settings_pressed() -> void:
	main.visible = false
	settings.visible = true


func _on_exit_pressed() -> void:
	get_tree().quit()


func _on_back_pressed() -> void:
	main.visible = true
	settings.visible = false
