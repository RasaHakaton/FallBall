extends Control
onready var settings = $Settings

func update_settings(settings: Dictionary) -> void:
	OS.window_fullscreen = settings.fullscreen
	#get_tree().set_screen_stretch(SceneTree.STRETCH_MODE_VIEWPORT, SceneTree.STRETCH_ASPECT_IGNORE, settings.resolution)
	OS.set_window_size(settings.resolution)
	if settings.resolution == Vector2(1920, 1080) and OS.get_screen_size() == Vector2(1920, 1080):
		OS.window_fullscreen = true
	else: OS.window_fullscreen = settings.fullscreen

func _on_Settings_apply_button_pressed(settings) -> void:
	update_settings(settings)


func _on_Settings_pressed():
	settings.visible = true


func _on_Quit_pressed():
	get_tree().quit()


func _on_Play_pressed():
	get_tree().change_scene('res://Game/Main.tscn')


func _on_Credits_pressed():
	get_tree().change_scene("res://MainMenu/Credits/Credits.tscn")
