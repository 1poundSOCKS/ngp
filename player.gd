extends CharacterBody2D


const SPEED = 30000.0
const MAX_SPEED = 1000.0
const FRICTION = 1000.0


#signal hit

var bulletScene : Resource = preload("res://bullet.tscn")

func _physics_process(delta: float) -> void:

	var direction : Vector2 = Input.get_vector("move_left", "move_right", "move_up", "move_down")

	if direction.length() > 0:
		$AnimatedSprite2D.play()
		direction = direction.normalized()
	else:
		$AnimatedSprite2D.stop()
	
	if Input.is_action_just_pressed("shoot"):
		var bullet : Area2D = bulletScene.instantiate()
		bullet.position = position + Vector2(0,-100)
		bullet.velocity = Vector2(0,-1000)
		get_parent().add_child(bullet)
		#get_parent().move_child(bullet, 0)

	velocity = direction * SPEED * delta

	move_and_slide()

func _on_area_2d_body_entered(body: Node2D) -> void:
	
	if body.name == "Enemy":
		print("hit!!!")
		get_tree().reload_current_scene()
