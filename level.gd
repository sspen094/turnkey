extends Node2D

func travelTo(sceneTo, location_x, location_y):
	print(get_parent())
	if "changeScene" in get_parent():
		print("hello2")
		get_parent().changeScene(sceneTo, location_x, location_y)
