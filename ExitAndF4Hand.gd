extends Node2D

var i = 1

func _process(delta):
	if Input.is_action_pressed("game_quit"):
		i = i + 1
		print (i)
	else:
		i = 0
	if i >= 50:
		get_tree().quit()

	if Input.is_action_just_pressed("fullscreen"):
		OS.window_fullscreen = !OS.window_fullscreen
