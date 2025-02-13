extends PhysicsEnemy

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	get_node("JumpTimer").start()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	check_lives()



func jump():
	var jumpDirection = Vector2(direction_x*50, -300)
	position.y = position.y - 1
	set_axis_velocity(jumpDirection)
	get_node("JumpTimer").start()


func _on_jump_timer_timeout() -> void:
	jump()


func _on_turnaround_area_body_entered(body: Node2D) -> void:
	print("Turn")
	direction_x *= -1
