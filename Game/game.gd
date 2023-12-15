extends Node2D

@onready var fgAnimPlayer = $FgAnimationPlayer
@onready var bgAnimPlayer = $BgAnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready():
	fgAnimPlayer.play("Idle")
	bgAnimPlayer.play("Idle")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_pressed():
	pass # Replace with function body.
