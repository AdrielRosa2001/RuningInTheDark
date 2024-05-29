extends CharacterBody2D


const SPEED = 200.0
const JUMP_FORCE = -520.0
var runing_song = 0.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = 1380 #ProjectSettings.get_setting("physics/2d/default_gravity")

@onready var animation := $AnimatedSprite2D as AnimatedSprite2D

@onready var sound_runing := $runing_gram

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
		animation.play("Jump")
		sound_runing.stop()
			

	# Handle jump.
	if is_on_floor():
		animation.play("Run")
		if Input.is_action_just_pressed("ui_up") and is_on_floor():
			velocity.y = JUMP_FORCE
		if sound_runing.get_playback_position() == 0:
			sound_runing.play()

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	
	#var direction := 1
	#velocity.x = direction * SPEED
	#animation.scale.x = direction

	"""
	var direction = Input.get_axis("ui_left", "ui_right")
	
	if direction:
		velocity.x = direction * SPEED
		animation.scale.x = direction
		if !is_jumping:
			animation.play("Run")
	elif is_jumping:
		animation.play("Jump")
	else:
		animation.play("Idle")
		velocity.x = move_toward(velocity.x, 0, SPEED)
	"""
	
	move_and_slide()
