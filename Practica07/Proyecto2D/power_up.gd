extends Area2D

@onready var character_body_2d = $"../CharacterBody2D"
@onready var power_up_sound = $"../power_up_sound"





func _on_body_entered(body: PhysicsBody2D):
	power_up_sound.play()
	Game.jump = -600.0
	Game.current_time=Game.t
	Game.power_up=true
	
	
	
