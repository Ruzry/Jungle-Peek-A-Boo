extends Control

@onready var sfxAudio = $SfxAudio

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_play_button_pressed():
	get_tree().change_scene_to_file("res://game.tscn")


func _on_exit_button_pressed():
	get_tree().quit()


func _on_play_button_button_down():
	sfxAudio.play()


func _on_exit_button_button_down():
	sfxAudio.play()
