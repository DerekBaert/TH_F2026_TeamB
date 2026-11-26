extends RigidBody2D
var speed = 200
func _process(delta):
	$"..".progress += delta*speed
