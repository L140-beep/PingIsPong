class_name WinScreen extends CanvasLayer
signal restart
signal home
signal opened
signal closed

@onready var player = $AnimationPlayer
@onready var score = $ColorRect/TextureRect/VBoxContainer/VBoxContainer/Label3

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func set_score(lscore, rscore):
	score.text = str(lscore) + ':' + str(rscore)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func close():
	player.play_backwards("open")

func open():
	player.play("open")

func _on_home_pressed():
	home.emit()

func _on_restart_pressed():
	restart.emit()

func _on_animation_player_animation_finished(anim_name):
	if anim_name == "close":
		closed.emit("closed")
	elif anim_name == "open":
		opened.emit("opened")
