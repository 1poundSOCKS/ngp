extends Node2D

const ENEMY_SCENE = preload("res://enemy.tscn")
const ASTEROID_SCENE = preload("res://asteroid.tscn")

signal create_enemy(position : Vector2)
signal create_asteroid(position : Vector2)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_create_enemy(position: Vector2) -> void:
	var newEnemy : Area2D = ENEMY_SCENE.instantiate()
	newEnemy.position = position
	add_child(newEnemy)

func _on_create_asteroid(position: Vector2) -> void:
	var newAsteroid : Area2D = ASTEROID_SCENE.instantiate()
	newAsteroid.position = position
	add_child(newAsteroid)
