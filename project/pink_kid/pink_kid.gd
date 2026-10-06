class_name PinkKid
extends CharacterBody2D

signal pinata_hit(pinata: Pinata)

const WALK_SPEED = 300.0
const JUMP_VELOCITY = -400.0

var gravity: float = ProjectSettings.get("physics/2d/default_gravity")

@onready var animated_sprite := $AnimatedSprite2D
@onready var attack_hitbox := $AttackHitbox
@onready var swing_sound := $SwingSound
@onready var jump_sound := $JumpSound


func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity.y += gravity * delta

	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	var direction := Input.get_axis("move_left", "move_right")

	if direction:
		velocity.x = direction * WALK_SPEED
		animated_sprite.flip_h = (direction < 0)
		attack_hitbox.scale.x = signf(direction)
	else:
		velocity.x = move_toward(velocity.x, 0, WALK_SPEED)

	if Input.is_action_just_pressed("attack"):
		attack()

	move_and_slide()

	if animated_sprite.animation == "hit" and animated_sprite.is_playing():
		return

	var animation_to_play := "idle"

	if not is_on_floor():
		animation_to_play = "jump"
		jump_sound.play()
	elif direction != 0:
		animation_to_play = "run"

	animated_sprite.play(animation_to_play)


func attack() -> void:
	animated_sprite.play("hit")
	swing_sound.play()
	for area in attack_hitbox.get_overlapping_areas():
		if area is Pinata:
			pinata_hit.emit(area)
