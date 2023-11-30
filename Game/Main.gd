extends Node2D

onready var a = 0
onready var score = 0
onready var scorog = 0
onready var lives = 3
onready var init = true
onready var scorelabel = $GameplayLoop/ScoreHolder/HBoxContainer/Score
onready var liveslabel = $GameplayLoop/ScoreHolder/LiveBox/Lives
onready var highscorelabel = $GameplayLoop/ScoreHolder/HighBox/Highscore
onready var sfxp = $sfx
onready var musicp = $Music
onready var dif = 0 #difficulty

var sfx = {
	"death": preload("res://Sounds/die.wav"),
	"collect": preload("res://Sounds/pickup.wav"),
	"miss": preload("res://Sounds/miss.wav")
	}
var music = {
	"tornflesh": preload("res://Music/TornFlesh.mp3"),
	"metal": preload("res://Music/CultoftheSkull.mp3")
	}

func _ready():
	start.load_data()
	musicp.volume_db = 0
	randomize()
	
func _process(delta):
	if dif == 4 and musicp.stream != music.tornflesh:
		musicp.stream = music.tornflesh
		musicp.play()
	if dif == 5 and musicp.stream != music.metal:
		musicp.stream = music.metal
		musicp.volume_db = -10
		musicp.play()
	

func _on_Player_body_entered(body):
	if body.name == "Ball":
		score = score + 50
		if (score - scorog) == 50*20:
			if lives < 3:
				lives = lives + 1
			scorog = score
		init = false
		
		sfxp.stream = sfx.collect
		sfxp.play()

func _on_DeathZone_body_entered(body):
	if body.name == "Ball":
	#	score = score - 100
		lives = lives - 1
		init = false
		
		sfxp.stream = sfx.miss
		sfxp.play()

func _physics_process(delta):
	scorelabel.text = str(score)
	liveslabel.text = str(lives)
	highscorelabel.text = str(start.sdata.highscore)
	#if score < 1 and init == false and a == 1:
	#	$GameplayLoop.visible = false
	#	$TryAgain.visible = true
	if lives <= 0 and init == false and a == 1:
		if score > start.sdata.highscore:
			start.sdata.highscore = score
			start.save_data()
		start.save_data()
		$GameplayLoop.visible = false
		$TryAgain.visible = true
		if sfxp.stream != sfx.death:
			sfxp.stream = sfx.death
			sfxp.play()

func _on_Difficulty_dying(difficulty):
	init = true
	a = 1
	dif = difficulty
	mainmusic.stop()

func _on_Retry_pressed():
	get_tree().change_scene('res://Game/Main.tscn')
