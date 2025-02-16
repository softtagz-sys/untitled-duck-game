extends CharacterBody2D

@onready var animation_player: AnimationPlayer = $AnimationPlayer

@export var health: int = 50

const SPEED : int = 50
var playerEntered: bool = false
var player: Node2D = null
var alive: bool = true


func _process(_delta: float) -> void:
	if alive:
		if playerEntered and player:
			var direction = (player.global_position - global_position).normalized()
			velocity = direction * SPEED
			move_and_slide()
			
			if direction.x != 0:
				$Duck.scale.x = 1 if direction.x < 0 else -1
	else:
		pass

func die():
	alive = false
	$Area2D/CollisionShape2D.set_deferred("disabled", true)
	queue_free()

func hit(damage: int):
	health -= damage
	animation_player.play("flash")
	if health <= 0:
		die()


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):  # Ensure it's the player
		playerEntered = true
		player = body  # Store reference to the player
		print("body entered")


func _on_area_2d_body_exited(_body: Node2D) -> void:
	playerEntered = false
