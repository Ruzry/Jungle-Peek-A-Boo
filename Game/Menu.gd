extends Control

#Menu Audio
@onready var sfxAudio = $SfxAudio
@onready var bgAudio = $BackgroundAudio

#Game Scene
var gameScene

# Removes Game Scene and resumes BG audio.
func handleMenuReturn():
	get_tree().root.remove_child(gameScene)
	bgAudio.play()

# Creates a new game scene and sets the animal index based on what button is pressed.
# LION: 0, ELEPHANT: 1, GORILLA: 2.
func startGameScene(animalIndex):
	gameScene = preload("res://game.tscn").instantiate()
	gameScene.connect("menuReturn", func(): handleMenuReturn())
	gameScene.setCurrentAnimal(animalIndex)
	bgAudio.stop()
	get_tree().root.add_child(gameScene)


func exitGame():
	get_tree().quit()


func playButtonPressSound():
	sfxAudio.play()

