extends Node2D

const BULLET = preload("res://Scenes/bullet.tscn")

func _process(_delta: float) -> void:
	look_at(get_global_mouse_position())
	
	rotation_degrees = wrap(rotation_degrees, 0, 360)
	if rotation_degrees > 90 and rotation_degrees < 270:
		scale.y = -1
	else:
		scale.y = 1

func shoot():
	var bullet_instance = BULLET.instantiate()
	get_tree().root.add_child(bullet_instance)
	bullet_instance.global_position = $Muzzle.global_position
	bullet_instance.rotation = rotation
