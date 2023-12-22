extends Control

var gameScene = preload("res://game.tscn").instantiate()
@onready var sfxAudio = $SfxAudio
@onready var bgAudio = $BackgroundAudio
@onready var menuAnimationPlayer = $MenuAnimationPlayer


func _on_play_button_pressed():
	menuAnimationPlayer.play("AnimalSelection")


func startGameScene(animalIndex):
	gameScene.setAnimalIndex(animalIndex)
	bgAudio.stop()
	get_tree().root.add_child(gameScene)


func _on_exit_button_pressed():
	get_tree().quit()


func playButtonPressSound():
	sfxAudio.play()

