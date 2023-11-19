extends Button
@onready var confirm = $"../../confirm"
@onready var timer = $"../../Timer"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_pressed():
	timer.start()
	confirm.play()
	


func _on_timer_timeout():
	get_tree().quit()
