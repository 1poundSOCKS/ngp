extends CharacterBody2D


const SPEED = 30000.0
const MAX_SPEED = 1000.0
const FRICTION = 1000.0

signal hit

func _physics_process(delta: float) -> void:

	var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")

	if direction.length() > 0:
		$AnimatedSprite2D.play()
		direction = direction.normalized()
	else:
		$AnimatedSprite2D.stop()
		

	velocity = direction * SPEED * delta

	move_and_slide()

func _on_area_2d_body_entered(body: Node2D) -> void:
	
	if body.name == "Enemy":
		print("hit!!!")
		get_tree().reload_current_scene()
