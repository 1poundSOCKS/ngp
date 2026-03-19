extends Area2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#var boundary : Area2D = $"../Boundary"
	#if overlaps_body(boundary):
	pass


func _on_area_entered(area: Area2D) -> void:
	if area.name == "Bullet":
		queue_free()
		area.queue_free()
