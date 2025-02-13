extends Node2D

var level = load("res://level.tscn")
var levelInstance = level.instantiate()

func _ready() -> void:
	get_node("LevelHolder").add_child(levelInstance)
	
func changeScene(sceneTo, location_x, location_y):
	var newLevel = load(sceneTo)
	var newLevelInstance = newLevel.instantiate()
	if newLevelInstance.get_node("player") != null:
		newLevelInstance.get_node("player").position.x = location_x
		newLevelInstance.get_node("player").position.y = location_y
	for child in get_node("LevelHolder").get_children():
		child.queue_free()
	get_node("LevelHolder").add_child(newLevelInstance)
