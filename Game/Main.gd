extends Node2D

onready var score = 200
onready var init = true
onready var scorelabel = $GameplayLoop/ScoreHolder/HBoxContainer/Score


func _on_Player_body_entered(body):
	score = score + 50
	init = false

func _on_DeathZone_body_entered(body):
	score = score - 100
	init = false

func _physics_process(delta):
	scorelabel.text = str(score)
	if score <= 0 and init == false:
		print ("gotov")
	else: print ("negotov")


func _on_Difficulty_dying(difficulty):
	init = true
