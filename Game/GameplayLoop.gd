extends Node2D

onready var ball = $Ball

func _on_Difficulty_dying(difficulty):
	visible = true
	
func _ready():
	randomize()
