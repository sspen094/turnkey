extends Node2D

func _ready() -> void:
	get_tree().change_scene_to_file("res://level.tscn")

func changeScene(sceneTo, location_x, location_y):
	get_tree().change_scene_to_file(sceneTo)
	
