extends Control

#Menu Audio
@onready var sfxAudio = $SfxAudio
@onready var bgAudio = $BackgroundAudio

#Game Scene
@onready var buttons: Array = [$Buttons/LionButton, $Buttons/ElephantButton, $Buttons/GorillaButton, $Buttons/ExitButton]
var gameScene
var christmasMode: bool

func _ready():
	var currentDate = Time.get_datetime_dict_from_system()
	if currentDate.month == 12 && currentDate.day > 14:
		christmasMode = true;
	
	$ChristmasTitleBackground.visible = christmasMode
	$TitleBackground.visible = !christmasMode
	$SnowParticles.emitting = christmasMode

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
	gameScene.setChristmasMode(christmasMode)
	bgAudio.stop()
	disableMenu(true)
	get_tree().root.add_child(gameScene)


func exitGame():
	get_tree().quit()


func playButtonPressSound():
	sfxAudio.play()

# Disabled buttons so they cant be pressed during game.
func disableMenu(flag: bool):
	for n in buttons.size():
		buttons[n].disabled = flag
