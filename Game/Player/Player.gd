extends Area2D

onready var clicked = false
#var defmpos = Vector2(640, 360)
#func _enter_tree():
#	get_viewport().warp_mouse(defmpos)
# warning-ignore:unused_argument


func _physics_process(delta):
	if clicked == true:
		position.x = get_global_mouse_position().x * 1
	if position.x < 703:
		position.x = 704
	if position.x > 1216:
		position.x = 1216
func _input_event(viewport, event, shape_idx ):
	if Input.is_action_just_pressed("left_click"):
		clicked = true
func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and not event.pressed:
			clicked = false
