extends Node

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$PlaceformeVerticale/AnimationPlayer.play("sceneAnimationVericale1")
	$PlaceformeVerticale2/AnimationPlayer.play("sceneAnimationVericale")
	$PlaceformeHorizontale/AnimationPlayer.play("sceneAnimationHorizontale")
	$PlaceformeHorizontale2/AnimationPlayer.play("sceneAnimationHorizontale2")
