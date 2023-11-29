extends CheckBox




func _on_FullscreenCheckbox_passdown():
	get_tree().reload_current_scene()
