extends Area2D

const SPEED = 300.0
const MAX_SPEED = 1000.0
const FRICTION = 1000.0

var bulletScene : Resource = preload("res://bullet.tscn")

func _ready() -> void:
	position = Vector2(0,0)
	print("started")

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
	
	var velocity : Vector2 = direction * SPEED
	position += velocity * delta

func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.name == "Enemy":
		queue_free()


func _on_area_entered(area: Area2D) -> void:
	print("Player: " + area.name)
	if area.name == "Enemy":
		queue_free()
