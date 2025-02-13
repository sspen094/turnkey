extends RigidBody2D

class_name PhysicsEnemy

@export var lives := 1
@export var speed := 25
var direction_x := -1


func check_lives():
	if lives <= 0:
		queue_free()

func lower_lives():
	lives -= 1
