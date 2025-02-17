extends Node2D

var player_name: String = ""

func _on_confirm_pressed() -> void:
	Global.player_name = player_name
	get_tree().change_scene_to_file("res://Scenes/main.tscn")
