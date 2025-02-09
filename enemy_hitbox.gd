extends Area2D

@onready var colision_shape: CollisionShape2D = get_child(0)

func _ready() -> void:
	assert(colision_shape != null)


func _on_body_entered(body: Node2D) -> void:
	if 'damage' in body:
		body.damage(10)
