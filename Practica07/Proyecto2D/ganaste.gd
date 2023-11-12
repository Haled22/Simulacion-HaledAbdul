extends Node2D

@onready var confirm = $confirm




func _on_restart_pressed():
	Game.t =0
	Game.coins =0
	Game.power_up =false
	Game.jump = -450.0
	Game.current_time=0
	confirm.play()
	await get_tree().create_timer(.85).timeout
	get_tree().change_scene_to_file("res://scena1.tscn")


func _on_quit_pressed():
	confirm.play()
	await get_tree().create_timer(.85).timeout
	get_tree().quit()
	
	
	

	


	
