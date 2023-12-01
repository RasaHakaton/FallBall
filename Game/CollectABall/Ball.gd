extends KinematicBody2D

onready var godo = $Godo
onready var box = $Box
onready var tennis = $tennis
onready var speed = 250
onready var shape = $CollisionShape2D
onready var rotspeed = 2.5
export onready var sfp = 4.5
export onready var sfd = 5
export onready var rfp = 0.0005
export onready var rfd = 0.0008
export onready var rotmax = 12
onready var gpl = get_node("..")

func _ready():
	randomize()
	spritechoose()
	position.y = -90
	position.x = rand_range(0, 1080)

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
	randomize()
	var chosen = randi() % 15
	if chosen == 0:
		godo.modulate = Color(1, 1, 1)
		shape.shape.radius = 60
		godo.visible = true
		box.visible = false
		tennis.visible = false
	elif chosen == 1:
		box.modulate = Color(1, 1, 1)
		shape.shape.radius = 60
		box.visible = true
		godo.visible = false
		tennis.visible = false
	elif chosen == 2:
		tennis.modulate = Color(1, 1, 1)
		shape.shape.radius = 60
		tennis.visible = true
		box.visible = false
		godo.visible = false
	elif chosen == 3:
		shape.shape.radius = 60
		tennis.modulate = Color(1, 0, 0) #red tennisball
		tennis.visible = true
		box.visible = false
		godo.visible = false
	elif chosen == 4:
		box.modulate = Color(1, 0, 0) #red football
		shape.shape.radius = 60
		box.visible = true
		godo.visible = false
		tennis.visible = false
	elif chosen == 5:
		box.modulate = Color(1, 1, 0) #yellow football
		shape.shape.radius = 60
		box.visible = true
		godo.visible = false
		tennis.visible = false
	elif chosen == 6:
		shape.shape.radius = 60
		tennis.modulate = Color(1, 1, 0) #yellow tennisball
		tennis.visible = true
		box.visible = false
		godo.visible = false
	elif chosen == 7:
		shape.shape.radius = 60
		tennis.modulate = Color(0, 1, 0) #greener tennisball
		tennis.visible = true
		box.visible = false
		godo.visible = false
	if chosen == 8:
		godo.modulate = Color(1, 1, 0) #yellow basket
		shape.shape.radius = 60
		godo.visible = true
		box.visible = false
		tennis.visible = false
	if chosen == 9:
		godo.modulate = Color(0, 1, 1) #green bask
		shape.shape.radius = 60
		godo.visible = true
		box.visible = false
		tennis.visible = false
	elif chosen == 10:
		shape.shape.radius = 60
		tennis.modulate = Color(0, 0.3, 1) #blue tennisball
		tennis.visible = true
		box.visible = false
		godo.visible = false
	if chosen == 11:
		godo.modulate = Color(1, 0, 1) #red bask
		shape.shape.radius = 60
		godo.visible = true
		box.visible = false
		tennis.visible = false
	elif chosen == 12:
		box.modulate = Color(0, 0.5, 1) #blue football
		shape.shape.radius = 60
		box.visible = true
		godo.visible = false
		tennis.visible = false
	elif chosen == 13:
		box.modulate = Color(1, 0, 1) #pink football
		shape.shape.radius = 60
		box.visible = true
		godo.visible = false
		tennis.visible = false
	if chosen == 14:
		godo.modulate = Color(1, 1, 1)
		shape.shape.radius = 60
		godo.visible = true
		box.visible = false
		tennis.visible = false

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
