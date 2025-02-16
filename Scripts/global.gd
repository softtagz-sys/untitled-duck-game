extends Node

# Collection of body sprites
var bodies = {
	"01" : preload("res://Assets/ducks/duck/duck_base.png")
}

# Collection of glas sprites
var glasses = {
	"01" : preload("res://Assets/ducks/duck gear/glasses/duck_glasses_0.png")
}

# Collection of headset sprites
var headsets = {
	"01" : preload("res://Assets/ducks/duck gear/headset/duck_headset_0.png")
}

# Collection of helmet sprites
var helmets = {
	"01" : preload("res://Assets/ducks/duck gear/helmet/duck_helmet_gray_0.png"),
	"02" : preload("res://Assets/ducks/duck gear/helmet/duck_helmet_tan_0.png"),
	"03" : preload("res://Assets/ducks/duck gear/helmet/duck_helmet_UN_0.png")
}

# Collection of vest sprites
var vests = {
	"01" : preload("res://Assets/ducks/duck gear/vest/duck_vest_gray_0.png"),
	"02" : preload("res://Assets/ducks/duck gear/vest/duck_vest_tan_0.png"),
	"03" : preload("res://Assets/ducks/duck gear/vest/duck_vest_UN_0.png")
}

var selected_bodies = ""
var selected_glasses = ""
var selected_headsets = ""
var selected_helmets = ""
var selected_vests = ""

var player_name = ""
