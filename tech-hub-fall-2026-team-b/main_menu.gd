extends Control

func _on_start_pressed() -> void:
	get_tree().change_scene_to_file("res://mainScene.tscn")


func _on_settings_pressed() -> void:
	get_tree().change_scene_to_file("res://Settings.tscn")


func _on_credits_pressed() -> void:
	get_tree().change_scene_to_file("res://Credits.tscn")


func _on_button_4_pressed() -> void:
	get_tree().quit()


func _on_button_mouse_entered() -> void:
	$Button/AnimationPlayer.play("mouse hovered")


func _on_button_mouse_exited() -> void:
	$Button/AnimationPlayer.play("mouse exited")
