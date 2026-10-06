class_name Pinata
extends Area2D

signal destroyed

@onready var animated_sprite := $AnimatedSprite2D
@onready var collision_shape := $CollisionShape2D
@onready var cpu_particles := $CPUParticles2D

var is_destroyed := false


func get_hit() -> void:
	if is_destroyed:
		return
	is_destroyed = true
	destroyed.emit()
	animated_sprite.play("destroy")
	collision_shape.set_deferred("disabled", true)
	cpu_particles.emitting = true

	await animated_sprite.animation_finished

	queue_free()
