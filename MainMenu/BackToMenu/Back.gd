extends Button





func _on_Back_pressed():
	GBSFX.play()
	get_tree().change_scene('res://MainMenu/MainMenu.tscn')
