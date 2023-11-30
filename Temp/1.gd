extends Control





func _on_NewGame_pressed():
	$ColorRect.visible = true
	$ColorRect/AnimationPlayer.play("FadeOutMain")
	yield($ColorRect/AnimationPlayer, "animation_finished")
# warning-ignore:return_value_discarded
	get_tree().change_scene('res://Game/Main.tscn')


func _on_Quit_pressed():
	get_tree().quit()
