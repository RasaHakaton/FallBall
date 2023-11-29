extends KinematicBody2D

onready var godo = $Godo
onready var box = $Box
onready var speed = 250
onready var rotspeed = 2.5

func _ready():
	spritechoose()

func _physics_process(delta):
	rotation_degrees += rotspeed
	var yin = 1
	var input_v = Vector2( 0, yin)
	var move = input_v.normalized()
	move_and_slide(move * speed, Vector2.ZERO)
	#print(position.x)
	#speed = speed + 0.01
	#rotspeed = rotspeed + 0.001

func _on_Player_body_entered(body):
	position.y = -100
	#randomize()
	position.x = rand_range(704, 1216)
	spritechoose()
	speed = speed + 4.5
	if rotspeed <= 12:
		rotspeed = rotspeed + 0.0005
	elif rotspeed > 12:
		rotspeed = 12

func _on_DeathZone_body_entered(body):
	position.y = -100
	#randomize()
	position.x = rand_range(704, 1216)
	spritechoose()
	speed = speed + 5
	if rotspeed <= 12:
		rotspeed = rotspeed + 0.0008
	elif rotspeed > 12:
		rotspeed = 12

func spritechoose():
	if randi() % 2 == 0:
		godo.visible = true
		box.visible = false
	elif randi() % 2 == 1:
		box.visible = true
		godo.visible = false
