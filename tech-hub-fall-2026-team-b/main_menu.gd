extends Control


func _on_start_pressed() -> void:
		get_tree().change_scene_to_file("res://mainScene.tscn")


func _on_settings_pressed() -> void:
	get_tree().change_scene_to_file("res://Settings.tscn")


func _on_credits_pressed() -> void:
	get_tree().change_scene_to_file("res://Credits.tscn")
