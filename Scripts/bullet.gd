extends Area2D

const SPEED : int = 500
var direction : Vector2
var damage: int = 15

func _process(delta: float) -> void:
	position += transform.x * SPEED * delta
	

func _on_timer_timeout() -> void:
	queue_free()

func _on_body_entered(body: Node2D) -> void:
	if body.alive:
		body.hit(10)
		queue_free()
