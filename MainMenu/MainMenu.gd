extends Control
onready var settings = $Settings
onready var FadeInBall = $TextureRect2/FadeInBall
onready var anim = $AnimationPlayer

func update_settings(settings: Dictionary) -> void:
	OS.window_fullscreen = settings.fullscreen
	#get_tree().set_screen_stretch(SceneTree.STRETCH_MODE_VIEWPORT, SceneTree.STRETCH_ASPECT_IGNORE, settings.resolution)
	OS.set_window_size(settings.resolution)
	if settings.resolution == Vector2(1920, 1080) and OS.get_screen_size() == Vector2(1920, 1080):
		OS.window_fullscreen = true
	else: OS.window_fullscreen = settings.fullscreen
	
func _ready():
	start.load_data()
	OS.set_window_size(start.sdata.resolution)
	OS.window_fullscreen = start.sdata.fullscreen
	if mainmusic.playing == false:
		mainmusic.play()
	if start.firstboot == 0:
		$TextureRect2.visible = false
	if start.firstboot == 1:
		$TextureRect2.visible = true
		FadeInBall.play("FadeOutBall")
	start.firstboot = 0
	start.fadeingame = 1

func _on_Settings_apply_button_pressed(settings) -> void:
	update_settings(settings)
	start.save_data()

func _on_Settings_pressed():
	GBSFX.play()
	settings.visible = true


func _on_Quit_pressed():
	GBSFX.play()
	start.save_data()
	get_tree().quit()


func _on_Play_pressed():
	GBSFX.play()
	anim.play("FadeOut")
	get_tree().change_scene('res://Game/Main.tscn')


func _on_Credits_pressed():
	GBSFX.play()
	anim.play("FadeOut")
	get_tree().change_scene("res://MainMenu/Credits/Credits.tscn")
