extends CharacterBody2D

@export var speed = 150.0
@export var sprintBonus = 100

var input: Vector2

func get_input():
	input.x = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	input.y = Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
	return input.normalized()

func _process(delta: float) -> void:
	var playerInput = get_input()
	
	if playerInput.x > 0:
		$Duck.scale.x = -1
	if playerInput.x < 0:
		$Duck.scale.x = 1

	
	if Input.is_action_pressed("sprint"):
		position += playerInput * (speed + sprintBonus) * delta
	else:
		position += playerInput * speed * delta
		
	
