extends Node

var timer

func _ready() -> void:
	pass

func new_game():
	$Player.start($StartPosition.position)
	$HUD.update_score(Timer)

func _on_score_timer_timeout() -> void:
	timer += 1
	$HUD.update_score(Timer)
