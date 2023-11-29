extends RigidBody2D


func _physics_process(delta):
	angular_velocity = 3.5
	

#func _on_Ball_body_entered(body):
#	queue_free()
#

func _on_Player_body_entered(body):
	position.y = -100
