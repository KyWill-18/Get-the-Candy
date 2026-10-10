extends Node2D

var _pinatas_remaining: int

@onready var _hud: Control = $HUD


func _ready() -> void:
	var pinatas := get_tree().get_nodes_in_group("pinatas")
	_pinatas_remaining = pinatas.size()

	for pinata: Pinata in pinatas:
		pinata.destroyed.connect(_on_pinata_destroyed)

	_hud.update_pinatas_remaining(_pinatas_remaining)


func _on_pinata_destroyed() -> void:
	_pinatas_remaining -= 1
	_hud.update_pinatas_remaining(_pinatas_remaining)

	if _pinatas_remaining == 0:
		await get_tree().create_timer(1.0).timeout
		get_tree().change_scene_to_file("res://outcome/win.tscn")
