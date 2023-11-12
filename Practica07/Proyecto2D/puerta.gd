extends Area2D

signal scene_change
var entered=false

func _on_body_entered(body: PhysicsBody2D):
	entered=true


func _on_body_exited(body):
	entered=false
func _process(delta):
	if entered == true:
		get_tree().change_scene_to_file("res://scena2.tscn")
