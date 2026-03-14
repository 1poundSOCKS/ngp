extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -800.0
const MAX_SPEED = 1000.0
const FRICTION = 1000.0

signal hit

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("move_up") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	if Input.is_action_pressed("move_right") and velocity.x < 0:
		velocity.x += 2000 * delta
		$AnimatedSprite2D.play()
	if Input.is_action_pressed("move_right"):
		velocity.x += 500 * delta
		$AnimatedSprite2D.play()
	elif Input.is_action_pressed("move_left") and velocity.x > 0:
		velocity.x -= 2000 * delta
		$AnimatedSprite2D.play()
	elif Input.is_action_pressed("move_left"):
		velocity.x -= 500 * delta
		$AnimatedSprite2D.play()
	else:
		velocity.x = move_toward(velocity.x, 0, FRICTION * delta)
		$AnimatedSprite2D.stop()

	velocity = velocity.limit_length(MAX_SPEED)

	move_and_slide()

func _on_area_2d_body_entered(body: Node2D) -> void:
	print("hit!!!")
