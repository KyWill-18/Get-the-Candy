extends Control

@onready var _play_again_button: Button = %PlayAgainButton


func _ready() -> void:
	_play_again_button.pressed.connect(_on_play_again_button_pressed)
	_play_again_button.grab_focus()


func _on_play_again_button_pressed() -> void:
	get_tree().change_scene_to_file("res://world/world.tscn")
