extends Area2D

signal coin_entered
@onready var coin_adquired = $"../coin_adquired"



func _on_body_entered(body):
	coin_adquired.play()
	Game.coins+=1
	queue_free()
