extends Node2D

const ENEMY_SCENE = preload("res://enemy.tscn")

signal create_enemy(position : Vector2)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_create_enemy(position: Vector2) -> void:
	var newEnemy : Area2D = ENEMY_SCENE.instantiate()
	#newEnemy.position = Vector2(randf_range(-400.0, 400.0),scrollPosition - 800)
	newEnemy.position = position
	add_child(newEnemy)
