extends CharacterBody2D

@export var speed = 400
@export var acceleration = 50
@export var jump_speed = -1000
@export var gravity = 2000
@onready var animations: AnimatedSprite2D = $AnimatedSprite2D

func _physics_process(delta: float) -> void:
	handle_input()
	update_movement(delta)
	update_animation()
	move_and_slide()

func handle_input() -> void:
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = jump_speed
	var direction = Input.get_axis("ui_left", "ui_right")
	
	if direction == 0:
		velocity.x = move_toward(velocity.x, 0, acceleration)
	else:
		velocity.x = move_toward(velocity.x, speed * direction, acceleration)

func update_movement(delta: float) -> void:
	velocity.y += gravity * delta

func update_animation() -> void:
	if velocity.x == 0:
		animations.play("idle")
		return
		
	animations.scale.x = sign(velocity.x)
	animations.play("walk")
