extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var anim = $AnimatedSprite

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	_animmation_player()

func _animmation_player():
	if Input.is_action_pressed("ui_right"):
		anim.flip_h = false
		anim.play("run")
	elif Input.is_action_pressed("ui_left"):
		anim.flip_h = true
		anim.play("run")
	elif Input.is_action_pressed("ui_up"):
		anim.flip_h = false
		anim.play("jump")
	elif Input.is_action_pressed("ui_click_left"):
		anim.flip_h = false
		anim.play("attack")
	else:
		anim.flip_h = false
		anim.play("default")
