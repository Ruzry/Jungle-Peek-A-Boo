extends Control

#Menu Audio
@onready var sfxAudio = $SfxAudio
@onready var bgAudio = $BackgroundAudio

#Buttons
@onready var lionButton = $Buttons/LionButton
@onready var elephantButton = $Buttons/ElephantButton
@onready var gorillaButton = $Buttons/GorillaButton
@onready var exitButton = $Buttons/ExitButton

#Game Scene
var gameScene

var buttons: Array

func _ready():
	buttons = [lionButton, elephantButton, gorillaButton, exitButton]


# Removes Game Scene and resumes BG audio.
func handleMenuReturn():
	get_tree().root.remove_child(gameScene)
	bgAudio.play()
	disableMenu(false)

# Creates a new game scene and sets the animal index based on what button is pressed.
# LION: 0, ELEPHANT: 1, GORILLA: 2.
func startGameScene(animalIndex):
	gameScene = preload("res://game.tscn").instantiate()
	gameScene.connect("menuReturn", func(): handleMenuReturn())
	gameScene.setCurrentAnimal(animalIndex)
	bgAudio.stop()
	disableMenu(true)
	get_tree().root.add_child(gameScene)


func exitGame():
	get_tree().quit()


func playButtonPressSound():
	sfxAudio.play()


func disableMenu(flag: bool):
	for n in buttons.size():
		buttons[n].disabled = flag
