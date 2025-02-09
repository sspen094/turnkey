extends CharacterBody2D


@export var SPEED = 300.0
@export var JUMP_VELOCITY = -400.0

var is_right = true
var key_array = []
var interactable = true


func _process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
		if (velocity.x > 0):
			is_right = true
		if (velocity.x < 0):
			is_right = false
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	handleFacing()
	interact_with_key()
	move_and_slide()
	


func handleFacing():
	if(is_right):
		get_node("interactBox").position.x = 15
	else:
		get_node("interactBox").position.x = -15

func damage(amount: int):
	print("Damage: " + str(amount))

func interact_with_key():
	if Input.is_action_pressed("interact") and interactable:
		var area = key_array.pop_front()
		interactable = false
		$Timers/InteractTimer.start()
		if area != null:
			area.take_key()


func _on_interact_timer_timeout() -> void:
	interactable = true


func _on_interact_box_area_entered(area: Area2D) -> void:
	if 'is_enemy_key' in area:
		key_array.append(area)


func _on_interact_box_area_exited(area: Area2D) -> void:
	if 'is_enemy_key' in area:
		key_array.erase(area)
