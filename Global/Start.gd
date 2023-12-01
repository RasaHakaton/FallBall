extends Node

var i = 1
var firstboot = 1
var fadeingame = 1
const SAVE_FILE = "user://data.save"
var sdata = {}

func save_data():
	var file = File.new()
	file.open(SAVE_FILE, file.WRITE)
	file.store_var(sdata)
	file.close()

func load_data():
	var file = File.new()
	if not file.file_exists(SAVE_FILE):
		sdata = {
			"resolution": Vector2(720, 1280),
			"fullscreen": false,
			"highscore": {"easy": 0, "normal": 0, "hard": 0, "uv": 0,"nightmare": 0}
		}
		save_data()
	file.open(SAVE_FILE, file.READ)
	sdata = file.get_var()
	file.close()

func _ready():
	load_data()
	OS.set_window_size(sdata.resolution)
	OS.window_fullscreen = sdata.fullscreen

func _process(delta):
	if Input.is_action_pressed("clearsave"):
		sdata = {
			"resolution": Vector2(720, 1280),
			"fullscreen": false,
			"highscore": {"easy": 0, "normal": 0, "hard": 0, "uv": 0,"nightmare": 0}
		}
		save_data()
	if Input.is_action_pressed("game_quit"):
		i = i + 1
		print (i)
	else:
		i = 0
	if i >= 50:
		save_data()
		get_tree().quit()

	if Input.is_action_just_pressed("fullscreen"):
		OS.window_fullscreen = !OS.window_fullscreen
