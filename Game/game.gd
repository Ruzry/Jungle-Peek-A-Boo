extends Node2D

enum ANIMAL_TYPE { LION, ELEPHANT, GORILLA}

#Animation Players
@onready var fgAnimPlayer = $FgAnimationPlayer
@onready var bgAnimPlayer = $BgAnimationPlayer
@onready var btnAnimPlayer = $ButtonAnimationPlayer
#General Nodes
@onready var gameStartButton = $GameStartButton
@onready var attractTimer = $AttractTimer
@onready var gameResetButton = $GameResetButton
#Lion Nodes
@onready var lionHeadSprite = $Animal/Head/LionHead
@onready var lionLeftPawSprite = $Animal/LeftPaw/LionLeftPaw
@onready var lionRightPawSprite = $Animal/RightPaw/LionRightPaw
#Elephant Nodes
@onready var elephantHeadSprite = $Animal/Head/ElephantHead
@onready var elephantBodySprite = $Animal/Body/ElephantBody
@onready var elephantLeftPawSprite = $Animal/LeftPaw/ElephantLeftPaw
@onready var elephantRightPawSprite = $Animal/RightPaw/ElephantRightPaw
#Gorilla nodes
@onready var gorillaHeadSprite = $Animal/Head/GorillaHead
@onready var gorillaLeftPawSprite = $Animal/LeftPaw/GorillaLeftPaw
@onready var gorillaRightPawSprite = $Animal/RightPaw/GorillaRightPaw
#Audio
@onready var BgAudio = $BGAudio
@onready var animalRoarAudio = $AnimalRoarAudio
@onready var lionRoar = preload("res://Assets/Sound/SFX/Jungle Peek A Boo Lion Reveal sfx.wav")
@onready var elephantRoar = preload("res://Assets/Sound/SFX/Jungle Peek A Boo Elephant Reveal sfx.wav")
@onready var gorillaRoar = preload("res://Assets/Sound/SFX/Jungle Peek A Boo Monkey Ambience sfx.wav")

#Animal node Arrays
var lionNodeSprites: Array
var elephantNodeSprites: Array
var gorillaNodeSprites: Array

var animalIndex: int
var animalAudioStreams: Array

# Called when the node enters the scene tree for the first time.
func _ready():
	lionNodeSprites = [lionHeadSprite, lionLeftPawSprite, lionRightPawSprite]
	elephantNodeSprites = [elephantHeadSprite, elephantBodySprite, elephantLeftPawSprite, elephantRightPawSprite]
	gorillaNodeSprites = [gorillaHeadSprite, gorillaLeftPawSprite, gorillaRightPawSprite]
	animalAudioStreams = [lionRoar, elephantRoar, gorillaRoar]
	setAnimalVisiblity()
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


func setAnimalIndex(animalIndex_: int):
	animalIndex = animalIndex_


func setAnimalVisiblity():
	for n in lionNodeSprites.size():
		lionNodeSprites[n].visible = true if (animalIndex == ANIMAL_TYPE.LION) else false
		
	for n in elephantNodeSprites.size():
		elephantNodeSprites[n].visible = true if (animalIndex == ANIMAL_TYPE.ELEPHANT) else false
		
	for n in gorillaNodeSprites.size():
		gorillaNodeSprites[n].visible = true if (animalIndex == ANIMAL_TYPE.GORILLA) else false


func _on_timer_timeout():
	fgAnimPlayer.play("Attract")


func resetFgAnimation():
	fgAnimPlayer.play("Idle")


func setRoarAudioStream():
	animalRoarAudio.stream = animalAudioStreams[animalIndex]


func _on_game_start_button_pressed():
	fgAnimPlayer.play("Reveal")
	gameStartButton.visible = false
	attractTimer.stop()


func showResetButton():
	gameResetButton.visible = true;


func _on_game_reset_button_pressed():
	resetGame()

