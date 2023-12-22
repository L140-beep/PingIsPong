extends Control


@onready var texture_button: TextureButton = $MarginContainer/VBoxContainer/MarginContainer2/ButtonContainer/TextureButton
# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("DoorsOpen")
	$AnimatedSprite2D.play("default")
	#$AnimationPlayer2.play("Light")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_quit_pressed():
	get_tree().quit()


func _on_start_game_pressed():
	get_tree().change_scene_to_file("res://choose_menu.tscn")


func _on_start_pressed():
	get_tree().change_scene_to_file("res://choose_menu.tscn")


func _on_single_player_pressed():
	get_tree().change_scene_to_file("res://choose_menu.tscn")


func _on_animation_player_animation_finished(anim_name):
	$CanvasLayer.layer = 2


func _on_animated_sprite_2d_animation_looped():
	$AnimatedSprite2D.stop()
	$AnimatedSprite2D.visible = false
