extends CharacterBody2D

@onready var duck: Node2D = $Duck
@onready var gun: Node2D = $Gun
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var shot_timer: Timer = $shotTimer

@onready var body: Sprite2D = $Duck/Body
@onready var glasses: Sprite2D = $Duck/Glasses
@onready var headset: Sprite2D = $Duck/Headset
@onready var helmet: Sprite2D = $Duck/Helmet
@onready var vest: Sprite2D = $Duck/Vest

@export var speed: int = 200
@export var sprint_bonus: int = 100
var can_shoot = true

func _ready() -> void:
	pass
	#player_init()

func _process(_delta: float) -> void:
	var player_input = get_key_input()
	
	if player_input.x != 0:
			duck.scale.x = 1 if player_input.x < 0 else -1

	# Adjust speed for sprinting
	var current_speed = speed
	if Input.is_action_pressed("sprint"):
		current_speed += sprint_bonus
	
	# Set velocity
	velocity = player_input * current_speed

	# Move the character
	move_and_slide()

	if Input.is_action_pressed("shoot") and can_shoot:
		gun.shoot()
		can_shoot = false
		shot_timer.start()

func get_key_input() -> Vector2:
	return Input.get_vector("move_left", "move_right", "move_up", "move_down").normalized()

func player_init() -> void:
	body.texture = Global.bodies[Global.selected_bodies]
	glasses.texture = Global.glasses[Global.selected_glasses]
	headset.texture = Global.headsets[Global.selected_headsets]
	helmet.texture = Global.helmets[Global.selected_helmets]
	vest.texture = Global.vests[Global.selected_vests]

func _on_shot_timer_timeout() -> void:
	can_shoot = true
