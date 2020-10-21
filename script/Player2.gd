extends KinematicBody2D

# Declare member variables here. Examples:
onready var anim = $AnimatedSprite
var velocity = Vector2()
export var speed = 300
export var gravity = 1100
export var impulsion = -550
var is_jumping = true

# Called when the node enters the scene tree for the first time.
func _ready():
	anim.play("default")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	_animmation_player()

#physique, collition, déplacement
func _physics_process(delta):
	velocity.y += gravity * delta #Permet de mettre la gravité
	_ctrl_player()
	velocity = move_and_slide(velocity,Vector2(0,-1))

func _animmation_player():
	if Input.is_action_pressed("ui_right"):
		anim.flip_h = false #Permet de changer le côté de l'image (Flipper l'image)
		anim.play("run")
	elif Input.is_action_pressed("ui_left"):
		anim.flip_h = true
		anim.play("run")
	elif Input.is_action_pressed("ui_up"):
		anim.flip_h = false
		anim.play("jump")
	elif Input.is_action_pressed("ui_click_left"):
		anim.play("attack")
	else:
		anim.flip_h = false
		anim.play("default")

func _ctrl_player():
	var droite = Input.is_action_pressed("ui_right") #donne un true or false
	var gauche = Input.is_action_pressed("ui_left")
	var jump = Input.is_action_just_pressed("ui_up") #Barre d'espace
	
	velocity.x = 0 #Permet de mettre la vitesse à 0
	if droite: #Permet d'aller vers la droite
		velocity.x += speed
	if gauche: #Permet d'aller vers la gauche
		velocity.x -= speed
	if jump and is_on_floor(): #Verififer si le personnage est sur le sol
		is_jumping = true
		velocity.y = impulsion
