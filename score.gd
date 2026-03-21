extends Label

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# Connect to the global signal
	print("Connecting...")
	Global.score_changed.connect(_on_score_changed)
	text = str(Global.score)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_score_changed(new_score : int) -> void:
	print("on score changed")
	text = "Score: " + str(new_score)
