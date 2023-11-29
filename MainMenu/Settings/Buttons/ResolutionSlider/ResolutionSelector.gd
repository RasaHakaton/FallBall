extends HBoxContainer


onready var textchange = 0

signal resolution_changed(new_resolution)


onready var option_button: OptionButton = $OptionButton
onready var oldtext = option_button.text

func _update_selected_item(text: String) -> void:
	var values := text.split_floats("x")
	emit_signal("resolution_changed", Vector2(values[0], values[1]))


func _on_OptionButton_item_selected(_index: int) -> void:
	textchange = 1
	_update_selected_item(option_button.text)


func _on_Settings_dontchange():
	option_button.text = oldtext
	textchange == 0


func _on_OptionButton_item_focused():
	if textchange == 0:
		oldtext = option_button.text


func _on_Settings_apply_button_pressed(settings):
	textchange = 0


func _on_OptionButton_pressed():
	if textchange == 0:
		oldtext = option_button.text
