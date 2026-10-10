extends Control

@onready var _press_start_button: Button = %PressStartButton


func _ready() -> void:
	_press_start_button.pressed.connect(_on_press_start_button_pressed)
	_press_start_button.grab_focus()


func _on_press_start_button_pressed() -> void:
	get_tree().change_scene_to_file("res://world/world.tscn")
