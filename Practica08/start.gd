extends Button
@onready var confirm = $"../../confirm"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_pressed():
	confirm.play()
	Global.t=0
	Global.minutes=0
	Global.seconds =0
	get_tree().change_scene_to_file("res://world1.tscn")
	
