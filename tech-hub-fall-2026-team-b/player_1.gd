extends CharacterBody2D

@export var speed = 400
@export var acceleration = 50
@export var jump_speed = -1000
@export var gravity = 2000
@onready var animations: AnimatedSprite2D = $AnimatedSprite2D

enum State{IDLE, WALK, JUMP, DOWN}
var current_state: State = State.IDLE

func _physics_process(delta: float) -> void:
	handle_input()
	update_movement(delta)
	update_states()
	update_animation()
	move_and_slide()

func handle_input() -> void:
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = jump_speed
		current_state = State.JUMP
		
	var direction = Input.get_axis("ui_left", "ui_right")
	
	if direction == 0:
		velocity.x = move_toward(velocity.x, 0, acceleration)
	else:
		velocity.x = move_toward(velocity.x, speed * direction, acceleration)

func update_movement(delta: float) -> void:
	velocity.y += gravity * delta

func update_states() -> void:
	match current_state:
		State.IDLE when velocity.x != 0:
			current_state = State.WALK
			
		State.WALK:
			if velocity.x == 0:
				current_state = State.IDLE
			if not is_on_floor() && velocity.y > 0:
				current_state = State.DOWN
 				
		State.JUMP when velocity.y > 0:
			current_state = State.DOWN
			
		State.DOWN when is_on_floor():
			if velocity.x == 0:
				current_state = State.IDLE
			else:
				current_state = State.WALK

func update_animation() -> void:
	if velocity.x != 0:
		animations.scale.x = sign(velocity.x)
		
	match current_state:
		State.IDLE: animations.play("idle")
		State.WALK: animations.play("walk")
		State.JUMP: animations.play("jump")
		State.DOWN: animations.play("down")
