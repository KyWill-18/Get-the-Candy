class_name Pinata
extends Area2D

signal destroyed

@onready var _animated_sprite := $AnimatedSprite2D
@onready var _collision_shape := $CollisionShape2D
@onready var _cpu_particles := $CPUParticles2D
@onready var _pinata_thud := $PinataThud

var _is_destroyed := false


func _ready() -> void:
	area_entered.connect(_on_area_entered)


func _on_area_entered(area: Area2D) -> void:
	if _is_destroyed or not area.is_in_group("attacks"):
		return

	_is_destroyed = true
	destroyed.emit()
	_animated_sprite.play("destroy")
	_collision_shape.set_deferred("disabled", true)
	_pinata_thud.play()
	_cpu_particles.emitting = true

	await _animated_sprite.animation_finished

	queue_free()
