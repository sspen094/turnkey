extends Node2D

var lives = 2
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	check_lives()

func check_lives():
	if lives <= 0:
		queue_free()
		
func lower_lives():
	lives -= 1
