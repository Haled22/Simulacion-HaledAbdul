extends Node2D
@onready var confirm = $confirm

var t 



func _on_exit_pressed():
	confirm.play()
	await get_tree().create_timer(.85).timeout
	get_tree().quit()


func _on_play_pressed():
	confirm.play()
	await get_tree().create_timer(.85).timeout
	Game.t =0
	get_tree().change_scene_to_file("res://scena1.tscn")
