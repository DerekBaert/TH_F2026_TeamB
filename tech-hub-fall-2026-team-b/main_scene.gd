extends Node2D

@onready var pause_menu = $Control/PauseMenu

func _ready():
	pause_menu.visible = false

func _process(_delta):
	if Input.is_action_just_pressed("Esc"):
		pause_game()

func pause_game() -> void:
	get_tree().paused = !get_tree().paused
	pause_menu.visible = get_tree().paused
