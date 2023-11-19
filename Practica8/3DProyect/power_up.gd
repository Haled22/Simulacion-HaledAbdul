extends Area3D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	rotate_y(deg_to_rad(2))


func _on_body_entered(body):
	$power_up.play()
	$Timer.start()


func _on_timer_timeout():
	Global.jump =6
	queue_free()
