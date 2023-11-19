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
	Global.gemas=0
	Global.health =5
	Global.jump=4
	
	get_tree().change_scene_to_file("res://world1.tscn")
	Global.t=0
	Global.seconds =0
	Global.minutes=0
