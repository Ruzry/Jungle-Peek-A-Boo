extends Node2D

enum ANIMAL_TYPE { LION, ELEPHANT, GORILLA }

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
@onready var bgAudio = $BGAudio
@onready var animalRoarAudio = $AnimalRoarAudio
@onready var lionRoar = preload("res://Assets/Sound/SFX/Jungle Peek A Boo Lion Reveal sfx.wav")
@onready var elephantRoar = preload("res://Assets/Sound/SFX/Jungle Peek A Boo Elephant Reveal sfx.wav")
@onready var gorillaRoar = preload("res://Assets/Sound/SFX/Jungle Peek A Boo Monkey Ambience sfx.wav")

#Animal node Arrays
var lionNodeSprites: Array
var elephantNodeSprites: Array
var gorillaNodeSprites: Array

var currentAnimal: ANIMAL_TYPE
var animalAudioStreams: Array

signal menuReturn

# Called when the node enters the scene tree for the first time.
func _ready():
	lionNodeSprites = [lionHeadSprite, lionLeftPawSprite, lionRightPawSprite]
	elephantNodeSprites = [elephantHeadSprite, elephantBodySprite, elephantLeftPawSprite, elephantRightPawSprite]
	gorillaNodeSprites = [gorillaHeadSprite, gorillaLeftPawSprite, gorillaRightPawSprite]
	animalAudioStreams = [lionRoar, elephantRoar, gorillaRoar]
	setAnimalVisiblity()
	resetGame()

# Sets game components to default state.
func resetGame():
	fgAnimPlayer.play("Idle")
	bgAnimPlayer.play("Idle")
	btnAnimPlayer.play("Attract")
	gameStartButton.visible = true
	gameResetButton.visible = false

# Set animal to be loaded.
func setCurrentAnimal(animalIndex: int):
	currentAnimal = animalIndex as ANIMAL_TYPE

# Sets visibility of Animal Sprite Nodes.
func setAnimalVisiblity():
	for n in lionNodeSprites.size():
		lionNodeSprites[n].visible = true if (currentAnimal == ANIMAL_TYPE.LION) else false
		
	for n in elephantNodeSprites.size():
		elephantNodeSprites[n].visible = true if (currentAnimal == ANIMAL_TYPE.ELEPHANT) else false
		
	for n in gorillaNodeSprites.size():
		gorillaNodeSprites[n].visible = true if (currentAnimal == ANIMAL_TYPE.GORILLA) else false

#Plays attract animation based on AttractTimer
func playAttractAnimation():
	fgAnimPlayer.play("Attract")

#Sets forground animation to idle state. 
func resetFgAnimation():
	fgAnimPlayer.play("Idle")

# Sets roar based on currentAnimal.
func setRoarAudioStream():
	animalRoarAudio.stream = animalAudioStreams[currentAnimal]

# Start Reveal animation.
func startReveal():
	fgAnimPlayer.play("Reveal")
	gameStartButton.visible = false
	attractTimer.stop()

# Called by reveal animation to display reset button at the end of animation.
func showResetButton():
	gameResetButton.visible = true;

# Emits signal to Menu to close the game scene.
func returnToMenu():
	emit_signal("menuReturn")

