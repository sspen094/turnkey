extends Area2D

@export var sceneTo = ""
@export var location_x = 0
@export var location_y = 0




func _on_body_entered(body: Node2D) -> void:
	if "travelTo" in get_parent():
		get_parent().travelTo(sceneTo, location_x, location_y)
