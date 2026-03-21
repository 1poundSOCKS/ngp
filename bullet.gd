extends Area2D

var velocity : Vector2 = Vector2.ZERO

func _physics_process(delta: float) -> void:
	position += velocity * delta

func _on_area_entered(area: Area2D) -> void:
	print("Bullet: " + area.name)
	if area.name != "Boundary":
		queue_free()
