extends Label

var time
# Called when the node enters the scene tree for the first time.
func _ready():
	time = Global.t
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	text = "You won!\n "+ str(Global.gemas) + "/"+str(Global.gemas_totales)+"\n Time taken: "+str(time)
