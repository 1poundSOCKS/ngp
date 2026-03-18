extends Node2D

@export var player : CharacterBody2D
var scrollPosition : float = 100
const SCROLL_SPEED : float = 100

const ENEMY_SCENE = preload("res://enemy.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var scrollAmount : float = SCROLL_SPEED * delta
	scrollPosition -= scrollAmount
	player.position.y -= scrollAmount

func createNewEnemy() -> void:
	
	var newEnemy : RigidBody2D = ENEMY_SCENE.instantiate()
	newEnemy.position = player.position + Vector2(0,-200)
	add_child(newEnemy)


func _on_timer_timeout() -> void:
	createNewEnemy()
	print("timer")
	
