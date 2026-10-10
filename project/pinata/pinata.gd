class_name Pinata
extends Area2D

signal destroyed

const _BURST_FRAME := 1

@onready var _animated_sprite := $AnimatedSprite2D
@onready var _collision_shape := $CollisionShape2D
@onready var _cpu_particles := $CPUParticles2D
@onready var _pinata_thud := $PinataThud

var _is_destroyed := false


func _ready() -> void:
	area_entered.connect(_on_area_entered)
	_animated_sprite.frame_changed.connect(_on_frame_changed)


func _on_area_entered(area: Area2D) -> void:
	if _is_destroyed or not area.is_in_group("attacks"):
		return

	_is_destroyed = true
	destroyed.emit()
	_animated_sprite.play("destroy")
	_collision_shape.set_deferred("disabled", true)
	_pinata_thud.play()

	await _animated_sprite.animation_finished

	_animated_sprite.hide()

	await _cpu_particles.finished

	queue_free()


func _on_frame_changed() -> void:
	if _animated_sprite.animation == "destroy" and _animated_sprite.frame == _BURST_FRAME:
		_cpu_particles.emitting = true
