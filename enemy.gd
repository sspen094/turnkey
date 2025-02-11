extends Node2D

@export var lives := 1
@export var speed := 25
var direction_x := -1

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	check_lives()
	move(delta)

func check_lives():
	if lives <= 0:
		queue_free()
		
func lower_lives():
	lives -= 1

func move(delta):
	position.x += speed * delta * direction_x


func switchDirection():
	direction_x = (-1) * direction_x 
	for child in get_children():
		if 'is_enemy_key' in child:
			child.position.x *= (-1)

func _on_border_area_body_entered(body: Node2D) -> void:
	switchDirection()

func _on_left_cliff_area_body_exited(body: Node2D) -> void:
	switchDirection()

func _on_right_cliff_area_body_exited(body: Node2D) -> void:
	switchDirection()
