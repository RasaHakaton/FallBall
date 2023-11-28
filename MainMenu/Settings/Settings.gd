extends Panel

onready var applied = 0

signal apply_button_pressed(settings)
signal dontchange()
signal uncheck()

var _settings := {resolution = Vector2(1280, 720), fullscreen = false}


# Emit the `apply_button_pressed` signal, when user presses the button.
func _on_Apply_pressed() -> void:
	emit_signal("apply_button_pressed", _settings)
	applied = 1
# Store the resolution selected by the user. As this function is connected
# to the `resolution_changed` signal, this will be executed any time the
# users chooses a new resolution
func _on_ResolutionSelector_resolution_changed(new_resolution: Vector2) -> void:
	_settings.resolution = new_resolution

# Store the fullscreen setting. This will be called any time the users toggles
# the UIFullScreenCheckbox
func _on_FullscreenCheckbox_toggled(is_button_pressed: bool) -> void:
	_settings.fullscreen = is_button_pressed
	$VBoxContainer/FullscreenCheckbox/CheckBox.set_toggle_mode(true)

func _on_Button_pressed():
	if applied == 0:
		emit_signal("dontchange")
	elif applied == 1:
		applied = 0
	visible = false
