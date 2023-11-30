extends Node2D

onready var a = 0
onready var score = 0
onready var scorog = 0
onready var lives = 3
onready var init = true
var localhs = 0
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
	"metal": preload("res://Music/CultoftheSkull.mp3"),
	"cipher": preload("res://Music/Cipher.mp3"),
	"wallpaper": preload("res://Music/Wallpaper.mp3"),
	"thereitis": preload("res://Music/ThereItIs.mp3")
	}

func _ready():
	if start.fadeingame == 1:
		$TextureRect2/AnimationPlayer.play("FadeIn")
	start.fadeingame = 0
	start.load_data()
	hsdiff()
	musicp.volume_db = 0
	randomize()
	
func _process(delta):
	hsdiff()
	choose_song()

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
	highscorelabel.text = str(localhs)
	#if score < 1 and init == false and a == 1:
	#	$GameplayLoop.visible = false
	#	$TryAgain.visible = true
	if lives <= 0 and init == false and a == 1:
		if score > localhs:
			localhs = score
			updatehs()
			print (start.sdata.highscore.nightmare)
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
	start.fadeingame = 0
	get_tree().change_scene('res://Game/Main.tscn')

func choose_song():
	if dif == 4 and musicp.stream != music.tornflesh:
		musicp.stream = music.tornflesh
		musicp.volume_db = 0
		musicp.play()
	if dif == 5 and musicp.stream != music.metal:
		musicp.stream = music.metal
		musicp.volume_db = -10
		musicp.play()
	if dif == 1 and musicp.stream != music.cipher:
		musicp.stream = music.cipher
		musicp.volume_db = -5
		musicp.play()
	if dif == 2 and musicp.stream != music.wallpaper:
		musicp.stream = music.wallpaper
		musicp.volume_db = -5
		musicp.play()
	if dif == 3 and musicp.stream != music.thereitis:
		musicp.stream = music.thereitis
		musicp.volume_db = -10
		musicp.play()
func hsdiff():
	if dif == 1:
		localhs = start.sdata.highscore.easy
	if dif == 2:
		localhs = start.sdata.highscore.normal
	if dif == 3:
		localhs = start.sdata.highscore.hard
	if dif == 4:
		localhs = start.sdata.highscore.uv
	if dif == 5:
		localhs = start.sdata.highscore.nightmare

func updatehs():
	if dif == 1:
		start.sdata.highscore.easy = localhs
	if dif == 2:
		start.sdata.highscore.normal = localhs 
	if dif == 3:
		start.sdata.highscore.hard = localhs
	if dif == 4:
		start.sdata.highscore.uv = localhs
	if dif == 5:
		start.sdata.highscore.nightmare = localhs
