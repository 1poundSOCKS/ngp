extends Node

var player_score : int

signal score_changed(new_score : int)

var score : int = 0:
	set(value):
		score = value
		score_changed.emit(score) # Tell everyone the score changed

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
