extends Node


var coins = 0
var jump = -450.0
var power_up =false
var current_time = 0
var timer
var t =0
var death = false

func temporizador():
	if power_up:
		if t-current_time==6:
			power_up =false
			jump =-450.0
			current_time=0
	t+=1
	

func _init():
	
	timer = Timer.new()
	add_child(timer)
	timer.wait_time=1.0
	timer.autostart=true
	timer.connect("timeout",temporizador)
	

	

	
