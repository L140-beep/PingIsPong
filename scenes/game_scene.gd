extends Node2D

var end = false

@export var AIBallScene: PackedScene
@export var MAX_SCORE = 5
@onready var ball: Ball = $Ball
@onready var lplate = $PlateLayer/LPlate
@onready var rplate = $PlateLayer/RPlate
@onready var lpos: Marker2D = $LPlateStartPosition
@onready var rpos: Marker2D = $RPlateStartPosition
@onready var ball_pos: Marker2D  = $BallStartPosition
@onready var ui: UserInterface = $CanvasLayer/UI
const HARDMODE = 5
# Called when the node enters the scene tree for the first time.
func _ready():
	var pause_menu = get_node("PauseMenu")
	lplate.pause_screen = pause_menu
	lplate.pause_screen.resume.connect(lplate.resume)
	rplate.pause_screen = pause_menu
	rplate.pause_screen.resume.connect(rplate.resume)
	start()
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("restart") and end:
		restart()
	if Input.is_action_pressed("exit") and end:
		get_tree().change_scene_to_file("res://scenes/ui/menus/MainMenu.tscn")

func start():
	ball.visible = true
	ball.stop()
	lplate.visible = true
	rplate.visible = true
	ball.global_position = ball_pos.global_position
	lplate.global_position = lpos.global_position
	rplate.global_position = rpos.global_position
	rplate.goal = rplate.global_position.y
	end = false
	await get_tree().create_timer(0.1).timeout
	ball.start_move()

func restart():
	start()
	ui.clear()

func stop():
	ball.velocity = Vector2(0, 0)
	ball.visible = false
	lplate.visible = false
	rplate.visible = false
	end = true

func check_win(lscore, rscore):
	if lscore == MAX_SCORE:
		ui.set_info("LEFT WIN")
		stop()
		return
	elif rscore == MAX_SCORE:
		ui.set_info("RIGHT WIN")
		stop()
	else:
		start()

func _on_end_game_area_2_rlose():
	var lscore = ui.get_lscore()
	var rscore = ui.get_rscore()
	
	ui.set_lscore(int(lscore) + 1)
	check_win(int(lscore) + 1, int(rscore))

func _on_end_game_area_llose():
	var lscore = ui.get_lscore()
	var rscore = ui.get_rscore()
	
	ui.set_rscore(int(rscore) + 1)
	check_win(int(lscore), int(rscore) + 1)

func _on_ai_detect_area_body_entered(body: Ball):
	print('here')
	var ai_ball: Ball = AIBallScene.instantiate()
	ai_ball.global_position = body.global_position
	ai_ball.velocity = body.velocity * HARDMODE
	ai_ball.MAX_SPEED = ai_ball.MAX_SPEED * HARDMODE
	add_child(ai_ball)
func _on_ai_goal_area_body_entered(body):
	rplate.goal = body.global_position.y
func _on_ai_goal_area_body_exited(body):
	body.queue_free()


func _on_ai_detect_area_2_body_entered(body):
	print('here')
	var ai_ball: Ball = AIBallScene.instantiate()
	ai_ball.global_position = body.global_position
	ai_ball.velocity = body.velocity * HARDMODE * 2
	ai_ball.MAX_SPEED = ai_ball.MAX_SPEED * HARDMODE * 2
	add_child(ai_ball)
