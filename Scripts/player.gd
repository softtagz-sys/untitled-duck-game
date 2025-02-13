extends CharacterBody2D

@export var speed: int = 200
@export var sprint_bonus: int = 100

var input: Vector2

func get_input() -> Vector2:
	return Input.get_vector("move_left", "move_right", "move_up", "move_down").normalized()

func _process(_delta: float) -> void:
	var player_input = get_input()
	
	# Flip sprite based on movement direction
	if player_input.x > 0:
		$Duck.scale.x = -1
	elif player_input.x < 0:
		$Duck.scale.x = 1

	# Adjust speed for sprinting
	var current_speed = speed
	if Input.is_action_pressed("sprint"):
		current_speed += sprint_bonus
	
	# Set velocity
	velocity = player_input * current_speed

	# Move the character
	move_and_slide()
