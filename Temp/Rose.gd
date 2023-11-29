extends Node2D

onready var ap = $AnimationPlayer
onready var audio = $AudioStreamPlayer2D
onready var boki = get_tree().get_root().find_node("boki", true, false)

func _ready():
	ap.play("Rose")


func _on_Area2D_body_entered(body):
	if body.name == "boki":
		boki.roses += 1
		audio.play()
		ap.play("Fade")
func _on_AudioStreamPlayer2D_finished():
	queue_free()
