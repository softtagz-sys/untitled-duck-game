extends CharacterBody2D

signal shoot

@export var speed: int = 200
@export var sprint_bonus: int = 100
var can_shoot = true

func get_key_input() -> Vector2:
	return Input.get_vector("move_left", "move_right", "move_up", "move_down").normalized()

func _process(_delta: float) -> void:
	var player_input = get_key_input()
	
	if player_input.x != 0:
			$Duck.scale.x = 1 if player_input.x < 0 else -1

	# Adjust speed for sprinting
	var current_speed = speed
	if Input.is_action_pressed("sprint"):
		current_speed += sprint_bonus
	
	# Set velocity
	velocity = player_input * current_speed

	# Move the character
	move_and_slide()

	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT) and can_shoot:
		var dir = get_global_mouse_position() - position	
		shoot.emit($Duck/Gun/Nozzle.global_position, dir)
		can_shoot = false
		$shotTimer.start()


func _on_shot_timer_timeout() -> void:
	can_shoot = true
