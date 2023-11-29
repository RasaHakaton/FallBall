extends Panel

export onready var difficulty = 0 #1-easy, 2-normal, 3-hard, 4-ultra violence, 5-nightmare
signal dying(difficulty)



func _on_Easy_pressed():
	difficulty = 1


func _on_Normal_pressed():
	difficulty = 2


func _on_Hard_pressed():
	difficulty = 3


func _on_Ultra_Violence_pressed():
	difficulty = 4


func _on_Nightmare_pressed():
	difficulty = 5

func _physics_process(delta):
	if difficulty != 0:
		emit_signal("dying", difficulty)
		queue_free()
