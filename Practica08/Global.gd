extends Node

var gemas =0.0
var health = 5
var jump = 4
var gemas_totales = 6
var timer
var t =0
var seconds =0
var minutes =0
var minutes_string =""
var seconds_string =""


func temporizador():
	t+=1
	if not t%60:
		seconds=0
		minutes+=1
	else:
		seconds+=1
		
	if minutes>9:
		minutes_string = str(minutes)
	else:
		minutes_string = "0"+str(minutes)
	
	if seconds < 10:
		seconds_string = "0"+ str(seconds)
	else:
		seconds_string =str(seconds)


func _init():
	timer = Timer.new()
	add_child(timer)
	timer.wait_time=1.0
	timer.autostart=true
	timer.connect("timeout",temporizador)
