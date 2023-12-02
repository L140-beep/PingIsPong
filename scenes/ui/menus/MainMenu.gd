extends Control


@onready var texture_button: TextureButton = $MarginContainer/VBoxContainer/MarginContainer2/ButtonContainer/TextureButton
@onready var just_button: Button = $MarginContainer/VBoxContainer/MarginContainer2/ButtonContainer/StartGame
# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("DoorsOpen")
	$AnimationPlayer2.play("Light")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_quit_pressed():
	get_tree().quit()


func _on_start_game_pressed():
	get_tree().change_scene_to_file("res://scenes/game_scene.tscn")


func _on_start_pressed():
	get_tree().change_scene_to_file("res://scenes/game_scene.tscn")


func _on_single_player_pressed():
	get_tree().change_scene_to_file("res://scenes/single_player_scene.tscn")


func _on_animation_player_animation_finished(anim_name):
	$CanvasLayer.layer = 2
