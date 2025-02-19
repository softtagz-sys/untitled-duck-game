extends Node2D

@export var collection_name: String  # Set this in the Inspector (e.g., "bodies_collection", "heads_collection")
@export var allow_none: bool = false  # Toggle to allow 'none' as an option
@export var next_button: NodePath  # Assign in Inspector (Button to go to next sprite)
@export var prev_button: NodePath  # Assign in Inspector (Button to go to previous sprite)

@onready var sprite: Sprite2D = $Sprite2D
@onready var next_btn: Button = get_node_or_null(next_button)
@onready var prev_btn: Button = get_node_or_null(prev_button)

var keys = []
var current_index = 0

func _ready():
	set_keys()
	update_sprite()
	connect_buttons()

# Set keys dynamically based on collection_name
func set_keys():
	if collection_name in Global:
		keys = Global[collection_name].keys()
		if allow_none:
			keys.insert(0, null)  # Add 'none' option at the start

# Update sprite and color
func update_sprite():
	if keys.is_empty():
		return

	var current_key = keys[current_index]

	# Set texture to null if current_key is None
	if current_key == null:
		sprite.texture = null
	else:
		sprite.texture = Global[collection_name][current_key]

	# Store selection in Global dynamically
	Global["selected_" + collection_name] = current_key

# Connect button signals if they exist
func connect_buttons():
	if next_btn:
		next_btn.pressed.connect(_on_next_button_pressed)
	if prev_btn:
		prev_btn.pressed.connect(_on_prev_button_pressed)

# Cycle to the next sprite
func _on_next_button_pressed():
	current_index = (current_index + 1) % keys.size()
	update_sprite()

# Cycle to the previous sprite
func _on_prev_button_pressed():
	current_index = (current_index - 1 + keys.size()) % keys.size()
	update_sprite()
