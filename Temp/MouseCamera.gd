extends KinematicBody2D

#var defmpos = Vector2(640, 360)

#func _enter_tree():
#	get_viewport().warp_mouse(defmpos)

# warning-ignore:unused_argument
func _physics_process(delta):
	position.x = get_global_mouse_position().x * 1
