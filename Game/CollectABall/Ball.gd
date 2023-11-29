extends KinematicBody2D

onready var godo = $Godo
onready var box = $Box
onready var speed = 250
onready var rotspeed = 2.5
export onready var sfp = 4.5
export onready var sfd = 5
export onready var rfp = 0.0005
export onready var rfd = 0.0008
export onready var rotmax = 12
onready var gpl = get_node("..")

func _ready():
	spritechoose()
	position.y = -90
	position.x = rand_range(704, 1216)

func _physics_process(delta):
	if gpl.visible == true:
		rotation_degrees += rotspeed
		var yin = 1
		var input_v = Vector2( 0, yin)
		var move = input_v.normalized()
		move_and_slide(move * speed, Vector2.ZERO)
	elif gpl.visible == false: position.y = -90
	#print(position.x)
	#speed = speed + 0.01
	#rotspeed = rotspeed + 0.001

func _on_Player_body_entered(body):
	if body.name == "Ball":
		position.y = -100
		#randomize()
		position.x = rand_range(704, 1216)
		spritechoose()
		speed = speed + sfp
		if rotspeed <= rotmax:
			rotspeed = rotspeed + rfp
		elif rotspeed > rotmax:
			rotspeed = rotmax

func _on_DeathZone_body_entered(body):
	if body.name == "Ball":
		position.y = -100
		#randomize()
		position.x = rand_range(704, 1216)
		spritechoose()
		speed = speed + sfd
		if rotspeed <= rotmax:
			rotspeed = rotspeed + rfd
		elif rotspeed > rotmax:
			rotspeed = rotmax

func spritechoose():
	if randi() % 2 == 0:
		godo.visible = true
		box.visible = false
	elif randi() % 2 == 1:
		box.visible = true
		godo.visible = false


func _on_Difficulty_dying(difficulty):
	if difficulty == 2:
		speed = 280
		rotspeed = 2.8
		sfp = sfd * 2
		sfd = sfd * 2 + 1.5
		rfp = rfp * 2
		rfd = rfd * 2
		rotmax = 14
	if difficulty == 3:
		speed = 310
		rotspeed = 3.1
		sfp = sfd * 3.5
		sfd = sfd * 3.5 + 3.5
		rfp = rfp * 3.5
		rfd = rfd * 3.5 
		rotmax = 18
	if difficulty == 4:
		speed = 340
		rotspeed = 3.4
		sfp = sfd * 7.5
		sfd = sfd * 8.5 + 4.5
		rfp = rfp * 7.5
		rfd = rfd * 8.5 
		rotmax = 20
	if difficulty == 5:
		speed = 390
		rotspeed = 4.5
		sfp = sfd * 10
		sfd = sfd * 15 + 10.5
		rfp = rfp * 10
		rfd = rfd * 15
		rotmax = 69
