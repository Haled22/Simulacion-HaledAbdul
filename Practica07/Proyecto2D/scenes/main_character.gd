extends CharacterBody2D
@onready var sprite_2d = $Sprite2D
var coins = Game.coins
var timer = Game.timer
const SPEED = 300.0
var JUMP_VELOCITY = Game.jump
@onready var jump = $"../AudioStreamPlayer2D"
@onready var walk = $"../walk"

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	
	JUMP_VELOCITY = Game.jump
	
	
	if(velocity.x > 1 || velocity.x < -1):
		walk.play()
		sprite_2d.animation = "running"
	else:
		if Game.power_up:
			sprite_2d.animation = "power_up"
		elif Game.death:
			
			sprite_2d.animation ="death"
		else:
			sprite_2d.animation = "default"
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
		sprite_2d.animation ="jumping"

	# Handle Jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		jump.play()
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
	var isLeft = velocity.x<0
	sprite_2d.flip_h = isLeft


func _on_button_pressed():
	get_tree().quit()


func _on_area_2d_2_coin_entered():
	coins+=1


func _on_area_2d_3_coin_entered():
	coins+=1



