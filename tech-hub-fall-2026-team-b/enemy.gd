extends RigidBody2D
var speed = 500
func _process(delta):
	$"..".progress += delta*speed
