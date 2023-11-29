extends Node2D

onready var score = 200
onready var scorelabel = $GameplayLoop/ScoreHolder/HBoxContainer/Score



func _on_Player_body_entered(body):
	score = score + 50

func _on_DeathZone_body_entered(body):
	score = score - 100
	
func _physics_process(delta):
	scorelabel.text = str(score)


