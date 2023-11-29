extends Node2D

onready var a = 0
onready var score = 200
onready var scorog = 0
onready var lives = 5
onready var init = true
onready var scorelabel = $GameplayLoop/ScoreHolder/HBoxContainer/Score
onready var liveslabel = $GameplayLoop/ScoreHolder/LiveBox/Lives


func _on_Player_body_entered(body):
	score = score + 50
	if (score - scorog) == 50*20:
		if lives < 3:
			lives = lives + 1
		scorog = score
	init = false

func _on_DeathZone_body_entered(body):
	score = score - 100
	lives = lives - 1
	init = false

func _physics_process(delta):
	scorelabel.text = str(score)
	liveslabel.text = str(lives)
	if score <= 0 and init == false and a == 1:
		$GameplayLoop.visible = false
		$TryAgain.visible = true
	if lives <= 0 and init == false and a == 1:
		$GameplayLoop.visible = false
		$TryAgain.visible = true

func _on_Difficulty_dying(difficulty):
	init = true
	a = 1

func _on_Retry_pressed():
	get_tree().change_scene('res://Game/Main.tscn')
