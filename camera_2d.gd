extends Camera2D

@export var target_player: CharacterBody2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if target_player:
		var player_pos : Vector2 = target_player.global_position
		#position = player_pos - Vector2(200,200)
