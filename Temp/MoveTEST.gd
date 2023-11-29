extends KinematicBody2D
 
var speed = 500
var sprintspeed = 700
onready var priority = 3 #w=1, s=2, a=4, d=3
onready var sprite = $Sprite
onready var walksound = $WalkSound
var soundcheck = 0
onready var counter = $HUD/Control/Container/HBoxContainer/Counter

var roses = 0



func _physics_process(delta):
	var expos = get_position()
	priority_check()
	moveanim()
	var xin = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	var yin = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	
	var input_v = Vector2( xin, yin)
	var movedir = input_v.normalized()
	
	if Input.is_action_pressed("ui_cancel"):
		move_and_slide(movedir * sprintspeed, Vector2.ZERO)
	else:
		move_and_slide(movedir * speed, Vector2.ZERO)
		
	if get_position() != expos: #cant be moved to a diff func
		if soundcheck != 1:
			walksound.play()
		soundcheck = 1
	else:
		walksound.playing = 0
		soundcheck = 0
	
	roses()





func priority_check():
	if Input.is_action_pressed("ui_right") or Input.is_action_pressed("ui_left"):
		if Input.is_action_pressed("ui_right") and Input.is_action_pressed("ui_left"):
			priority = 3
		elif Input.is_action_pressed("ui_right"):
			priority = 3
		elif Input.is_action_pressed("ui_left"):
			priority = 4


func moveanim():
	if priority == 4:
		sprite.flip_h = 1
	else: sprite.flip_h = 0

func roses():
	counter.text = str(roses)
