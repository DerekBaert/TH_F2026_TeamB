extends Area2D

@onready var pause_menu = $Control/PauseMenu

func _on_area_2d_area_entered(area: Area2D) -> void:
	death_screen()


func death_screen() -> void:
	get_tree().paused
