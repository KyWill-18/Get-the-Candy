extends Node2D

var pinatas_remaining: int

@onready var pink_kid: PinkKid = $"Pink Kid"


func _ready() -> void:
	var pinatas := get_tree().get_nodes_in_group("pinatas")
	pinatas_remaining = pinatas.size()
	for pinata: Pinata in pinatas:
		pinata.destroyed.connect(_on_pinata_destroyed)
	pink_kid.pinata_hit.connect(_on_pink_kid_pinata_hit)


func _on_pink_kid_pinata_hit(pinata: Pinata) -> void:
	pinata.get_hit()


func _on_pinata_destroyed() -> void:
	pinatas_remaining -= 1
