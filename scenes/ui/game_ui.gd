class_name UserInterface
extends Control

@onready var lscore: Label = $MarginContainer/VBoxContainer/HBoxContainer/HBoxContainer/ScoreL
@onready var rscore: Label = $MarginContainer/VBoxContainer/HBoxContainer/HBoxContainer/ScoreR
@onready var info: Label = $MarginContainer/VBoxContainer/InfoLabel
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func get_lscore():
	return lscore.text

func get_rscore():
	print(rscore.text)
	return rscore.text
	
func clear():
	rscore.text = "0"
	lscore.text = "0"
	info.text = ""

func set_info(text):
	info.text = text

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func set_lscore(lvalue):
	print(lvalue)
	lscore.text = str(lvalue)

func set_rscore(rvalue):
	print(rvalue)
	rscore.text = str(rvalue)

func change_score(lvalue, rvalue):
	lscore.text = lvalue
	rscore.text = rvalue
