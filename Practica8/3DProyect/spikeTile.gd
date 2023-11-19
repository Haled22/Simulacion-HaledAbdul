extends Node3D




	
	


func _on_timer_timeout():
	Global.gemas=0
	get_tree().change_scene_to_file("res://world1.tscn")


func _on_child_entered_tree(node):
	$Timer.start()
