extends CharacterBody2D

const SPEED = 150
var GRAVITY = 12
const JUMP_POWER = -350
const FLOOR = Vector2(0, -1)
var on_ground = false
var is_gliding = false

func _physics_process(_delta):
	if velocity.x != 0:
		$AnimatedSprite2D.animation = "walk"
		$AnimatedSprite2D.flip_v = false
		$AnimatedSprite2D.flip_h = velocity.x > 0
	
	if Input.is_action_pressed("walkright"):
		velocity.x = SPEED
	elif Input.is_action_pressed("walkleft"):
		velocity.x = -SPEED
	else:
		velocity.x = 0
	
	if Input.is_action_pressed("jump"):
		if on_ground == true:
			velocity.y = JUMP_POWER
			on_ground = false
	
	if not is_gliding:
		velocity.y += GRAVITY
	
	if is_on_floor():
		on_ground = true
		
	else:
		on_ground = false
	
	move_and_slide()

func _on_body_entered(_body):
	hide()
	hit.emit()
	$CollisionShape2D.set_deferred("disabled", true)
	
func start(pos):
	position = pos
	show()
	$CollisionShape2D.disabled = false

func _tele():
	if global_position.y > 100:
		$AnimatedSprite2D.global_position.y = 0
		$AnimatedSprite2D.global_position.x = 0

signal hit
