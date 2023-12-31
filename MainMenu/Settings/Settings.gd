extends Panel

onready var applied = 0
onready var checkbox = $VBoxContainer/FullscreenCheckbox/CheckBox

signal apply_button_pressed(settings)
signal dontchange()
signal uncheck()

var _settings := {resolution = Vector2(1280, 720), fullscreen = false}


func _on_Apply_pressed() -> void:
	emit_signal("apply_button_pressed", _settings)
	$VBoxContainer/Apply/ApplyAudio.play()
	applied = 1
	$Applied/Label.text = "Yes"
	start.sdata.resolution = _settings.resolution
	start.sdata.fullscreen = _settings.fullscreen
	start.save_data()
func _on_ResolutionSelector_resolution_changed(new_resolution: Vector2) -> void:
	_settings.resolution = new_resolution
	applied = 0
	$Applied/Label.text = "No"
	$Applied.visible = true
func _on_FullscreenCheckbox_toggled(is_button_pressed: bool) -> void:
	_settings.fullscreen = is_button_pressed
	checkbox.set_toggle_mode(true)
	applied = 0
	$Applied/Label.text = "No"
	$Applied.visible = true

func _on_Button_pressed():
	GBSFX.play()
	if applied == 0:
		#emit_signal("dontchange")
		$Applied/Label.text = "No"
		if checkbox.toggle_mode == true and OS.window_fullscreen == false:
			emit_signal("uncheck")
	elif applied == 1:
		$Applied/Label.text = "Yes"
		start.save_data()
		applied = 0
		if checkbox.toggle_mode == true and OS.window_fullscreen == false:
			emit_signal("uncheck")
	
	visible = false

func _process(delta):
	$CurrentRes/res.text = str(OS.window_size)

func _physics_process(delta):
	#if applied == 0:
	#	$Applied/Label.text = "No"
	if applied == 1:
		$Applied/Label.text = "Yes"
