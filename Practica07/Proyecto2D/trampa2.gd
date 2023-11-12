extends Area2D
@onready var death = $"../death"



func _on_body_entered(body: PhysicsBody2D):
	Game.death=true
	death.play()
	await get_tree().create_timer(.30).timeout
	Game.death=false
	Game.coins=0
	Game.t=0
	get_tree().change_scene_to_file("res://scena1.tscn")
