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
	
	clamp_player()
	var velocity : Vector2 = direction * SPEED
	var oldPosition : Vector2 = position
	position += velocity * delta	

func _on_area_exited(area: Area2D) -> void:
	pass # Replace with function body.

func clamp_player() -> void:
	# 1. Get the boundaries of the Container
	var boundary_shape : CollisionShape2D = $"../Boundary/CollisionShape2D"
	var container_shape : RectangleShape2D = boundary_shape.shape
	var container_pos : Vector2 = boundary_shape.global_position

	var c_size : Vector2 = container_shape.size
	
	# 2. Get Actor boundaries (Capsule-specific)
	var actor_shape : CapsuleShape2D = $CollisionShape2D.shape
	var a_width : float = actor_shape.radius * 2
	var a_height : float = actor_shape.height
	
	# 3. Calculate safe limits
	# (Container width/2) - (Actor width/2)
	var limit_y : float = (c_size.y - a_height) / 2		
	var limit_x : float = (c_size.x - a_width) / 2

	# 4. Apply the Clamp relative to the Container's center
	global_position.x = clamp(global_position.x, container_pos.x - limit_x, container_pos.x + limit_x)
	global_position.y = clamp(global_position.y, container_pos.y - limit_y, container_pos.y + limit_y)
