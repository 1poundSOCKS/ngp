extends Camera2D

@export var target_player: Area2D
@export var level : Node2D

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if target_player:
		var player_pos : Vector2 = target_player.global_position
		#position = player_pos - Vector2(200,200)
		position = Vector2(0,level.scrollPosition)
