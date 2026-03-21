extends Node2D

@export var player : Area2D
var scrollPosition : float = 100
const SCROLL_SPEED : float = 350

const ENEMY_SCENE = preload("res://enemy.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var scrollAmount : float = SCROLL_SPEED * delta
	scrollPosition -= scrollAmount
	if player != null:
		player.position.y -= scrollAmount
	$Boundary.position = Vector2(0,scrollPosition)
	$Boundary/CollisionShape2D.shape.size = Vector2(800,1800)

func _on_timer_timeout() -> void:
	var position : Vector2 = Vector2(randf_range(-400.0, 400.0),scrollPosition - 800)
	$EnemyContainer.emit_signal("create_enemy", position)
