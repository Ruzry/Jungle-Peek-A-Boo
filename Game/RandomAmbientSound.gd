extends Control

@onready var audio = $AmbienceAudio

#Animals Sounds
@onready var birdSound0 = preload("res://Assets/Sound/SFX/Jungle Peek A Boo Bird Ambience sfx 0.wav")
@onready var birdSound1 = preload("res://Assets/Sound/SFX/Jungle Peek A Boo Bird Ambience sfx 1.wav")
@onready var elephantSound = preload("res://Assets/Sound/SFX/Jungle Peek A Boo Elephant Ambience sfx.wav")
@onready var frogSound0 = preload("res://Assets/Sound/SFX/Jungle Peek A Boo Frog Ambience sfx 0.wav")
@onready var frogSound1 = preload("res://Assets/Sound/SFX/Jungle Peek A Boo Frog Ambience sfx 1.wav")
@onready var frogSound2 = preload("res://Assets/Sound/SFX/Jungle Peek A Boo Frog Ambience sfx 2.wav")
@onready var gibbonBirdSound = preload("res://Assets/Sound/SFX/Jungle Peek A Boo Gibbon and Bird Ambience sfx.wav")
@onready var lionSound = preload("res://Assets/Sound/SFX/Jungle Peek A Boo Lion Ambience sfx.wav")
@onready var monkeySound = preload("res://Assets/Sound/SFX/Jungle Peek A Boo Monkey Ambience sfx.wav")
@onready var snakeSound = preload("res://Assets/Sound/SFX/Jungle Peek A Boo Snake Ambience sfx.wav")

var animalSounds : Array
var upperTimeLimit = 8
var lowerTimeLimit = 6

# randomize to make sure our random numbers are always random.
# Populates array with animal sounds.
func _ready():
	randomize() 
	
	animalSounds = [ birdSound0, birdSound1, gibbonBirdSound, elephantSound, frogSound0, frogSound1, frogSound2, lionSound, monkeySound, snakeSound ] 
	
	playRandomSound()

# Plays a random sound from the array on a timer range.
func playRandomSound():
	var time = randi_range(lowerTimeLimit, upperTimeLimit)
	await get_tree().create_timer(time).timeout
	
	var soundIndex = randi_range(0, (animalSounds.size() - 1))
	var soundToPlay = animalSounds[soundIndex]
	
	audio.stream = soundToPlay
	audio.play()

