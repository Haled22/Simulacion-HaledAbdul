extends CharacterBody3D


const SPEED = 5.0
var JUMP_VELOCITY = Global.jump
@onready var camera_base = $CameraBase
@onready var character = $character/AnimationPlayer

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = 9.8

func _ready():
	#Input.mouse_mode =2
	pass

func _input(event):
	if event is InputEventMouseMotion and Input.is_action_pressed("control_rotation"):
		camera_base.rotation.x -= deg_to_rad(event.relative.y *1)
		camera_base.rotation.x = clamp(camera_base.rotation.x,deg_to_rad(-90),deg_to_rad(90))
		rotation.y -= deg_to_rad(event.relative.x *1)
	
func _physics_process(delta):
	# Add the gravity.
	JUMP_VELOCITY = Global.jump
	if not is_on_floor():
		velocity.y -= gravity * delta

	# Handle Jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		$jump.play()
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir = Input.get_vector("left", "right", "foward", "backward")
	var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	
	if direction and is_on_floor():
		if $Timer.time_left <=0:
			$steps.pitch_scale = randf_range(0.8,1.2)
			$steps.play()
			$Timer.start(0.36)
		character.play("run")
	elif is_on_floor():
		character.play("idle")
		
	if Input.is_action_just_pressed("jump") and is_on_floor():
		
		character.play("jump")
		character.seek(0.6, true)
	if direction:
		
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)

	move_and_slide()
