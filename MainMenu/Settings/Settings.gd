extends Panel

onready var applied = 0
onready var checkbox = $VBoxContainer/FullscreenCheckbox/CheckBox

signal apply_button_pressed(settings)
signal dontchange()
signal uncheck()

var _settings := {resolution = Vector2(1280, 720), fullscreen = false}


func _on_Apply_pressed() -> void:
	emit_signal("apply_button_pressed", _settings)
	applied = 1
func _on_ResolutionSelector_resolution_changed(new_resolution: Vector2) -> void:
	_settings.resolution = new_resolution
func _on_FullscreenCheckbox_toggled(is_button_pressed: bool) -> void:
	_settings.fullscreen = is_button_pressed
	checkbox.set_toggle_mode(true)

func _on_Button_pressed():
	#if OS.window_fullscreen == true:
	#	checkbox.set_toggle_mode(true)
	#	checkbox.toggle_mode = true
	#	print ("whistle1")
	if applied == 0:
		emit_signal("dontchange")
		if checkbox.toggle_mode == true and OS.window_fullscreen == false:
			emit_signal("uncheck")
		#if OS.window_fullscreen == true and checkbox.toggle_mode == false:
		#	checkbox.toggle_mode(true)
		#	checkbox.toggle_mode = true
		#	print ("whistle2")
	elif applied == 1:
		applied = 0
		if checkbox.toggle_mode == true and OS.window_fullscreen == false:
			emit_signal("uncheck")
		#if OS.window_fullscreen == true and checkbox.toggle_mode == false:
		#	checkbox.toggle_mode(true)
		#	checkbox.toggle_mode = true
		#	print ("whistle3")
	#if OS.window_fullscreen == true:
	#	checkbox.set_toggle_mode(true)
	#	checkbox.toggle_mode = true
	visible = false
