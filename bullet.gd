extends Area2D

var velocity : Vector2 = Vector2.ZERO

func _physics_process(delta: float) -> void:
	position += velocity * delta

func _on_body_entered(body: Node2D) -> void:
	print("Hello")
	body.queue_free()
	queue_free()


func _on_area_entered(area: Area2D) -> void:
	print("Bullet: " + area.name)
	#if area.name == "Enemy":
		#area.queue_free()
