extends Node2D

@export var player : Area2D
var scrollPosition : float = 100
const SCROLL_SPEED : float = 250

const ENEMY_SCENE = preload("res://enemy.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var scrollAmount : float = SCROLL_SPEED * delta
	scrollPosition -= scrollAmount
	player.position.y -= scrollAmount
	$Boundary.position = Vector2(0,scrollPosition)
	$Boundary/CollisionShape2D.shape.size = Vector2(800,1800)

func createNewEnemy() -> void:
	
	var newEnemy : Area2D = ENEMY_SCENE.instantiate()
	newEnemy.position = Vector2(randf_range(-200.0, 200.0),scrollPosition - 800)
	add_child(newEnemy)

func _on_timer_timeout() -> void:
	createNewEnemy()


func _on_boundary_area_exited(area: Area2D) -> void:
	area.queue_free()
