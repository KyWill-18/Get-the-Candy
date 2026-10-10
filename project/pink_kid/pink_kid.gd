class_name PinkKid
extends CharacterBody2D

const _WALK_SPEED = 300.0
const _JUMP_VELOCITY = -400.0

var _gravity: float = ProjectSettings.get("physics/2d/default_gravity")

@onready var _animated_sprite := $AnimatedSprite2D
@onready var _attack_hitbox := $AttackHitbox
@onready var _attack_shape := $AttackHitbox/CollisionShape2D
@onready var _swing_sound := $SwingSound
@onready var _jump_sound := $JumpSound


func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity.y += _gravity * delta

	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = _JUMP_VELOCITY
		_jump_sound.play()

	var direction := Input.get_axis("move_left", "move_right")

	if direction:
		velocity.x = direction * _WALK_SPEED
		_animated_sprite.flip_h = (direction < 0)
		_attack_hitbox.scale.x = signf(direction)
	else:
		velocity.x = move_toward(velocity.x, 0, _WALK_SPEED)

	if Input.is_action_just_pressed("attack"):
		_attack()

	move_and_slide()

	if _animated_sprite.animation == "hit" and _animated_sprite.is_playing():
		return

	var animation_to_play := "idle"

	if not is_on_floor():
		animation_to_play = "jump"
	elif direction != 0:
		animation_to_play = "run"

	_animated_sprite.play(animation_to_play)


func _attack() -> void:
	_attack_shape.set_deferred("disabled", false)
	_animated_sprite.play("hit")
	_swing_sound.play()

	await _animated_sprite.animation_finished

	_attack_shape.set_deferred("disabled", true)
