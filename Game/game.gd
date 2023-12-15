extends Node2D

@onready var fgAnimPlayer = $FgAnimationPlayer
@onready var bgAnimPlayer = $BgAnimationPlayer
@onready var btnAnimPlayer = $ButtonAnimationPlayer

@onready var gameStartButton = $GameStartButton
@onready var attractTimer = $AttractTimer
@onready var gameResetButton = $GameResetButton

# Called when the node enters the scene tree for the first time.
func _ready():
	resetGame()

func resetGame():
	fgAnimPlayer.play("Idle")
	bgAnimPlayer.play("Idle")
	btnAnimPlayer.play("Attract")
	gameStartButton.visible = true
	gameResetButton.visible = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_timer_timeout():
	fgAnimPlayer.play("Attract")


func resetFgAnimation():
	fgAnimPlayer.play("Idle")


func _on_game_start_button_pressed():
	fgAnimPlayer.play("Reveal")
	gameStartButton.visible = false
	attractTimer.stop()


func showResetButton():
	gameResetButton.visible = true;


func _on_game_reset_button_pressed():
	resetGame()
