class_name Plate
extends CharacterBody2D

const SPEED = 1300.0

@export var ACCELERATION = 1400.0
@export var FRICTION = 1500.0

enum PLATE_POSITION {
	LEFT,
	RIGHT
}
@export var ai = false
var goal = global_position.y
const CONTROL_MODE = {
	PLATE_POSITION.LEFT: {
		"up": "l_up",
		"down": "l_down"
	},
	PLATE_POSITION.RIGHT: {
		"up": "r_up",
		"down": "r_down"
	}
}

@export var plate_position: PLATE_POSITION = PLATE_POSITION.LEFT

var up
var down
var paused = false
var pause_screen: PauseMenu
@onready var lshape: CollisionShape2D = $LShape
@onready var rshape = $RShape
var width = 0
# Get the gravity from the project settings to be synced with RigidBody nodes.
func _ready():
	up = CONTROL_MODE[plate_position]["up"]
	down = CONTROL_MODE[plate_position]["down"]
	var width = $Sprite2D.get_rect().size.y

func resume():
	get_tree().paused = false
	visible = true
	pause_screen.visible = false
	paused = true

func _physics_process(delta):
	# Add the gravity.
	# if not is_on_floor():
	#	velocity.y += gravity * delta

	## Handle Jump.
	#if Input.is_action_just_pressed("ui_accept") and is_on_floor():
	#	velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	
	if !pause_screen.visible:
		if !ai:
			if Input.is_action_pressed("Pause"):
				#pause game
				visible = false
				get_tree().paused = true
				#show pause screen popup
				pause_screen.visible = true
				#stops movement processing 
				#set_physics_process(false)
				#set pauses state to be true
				paused = true
			else:
				var direction = Input.get_axis(up, down)
				if direction:
					velocity.y = move_toward(velocity.y, direction * SPEED, delta * ACCELERATION)
				else:
					velocity.y = move_toward(velocity.y, 0, delta * FRICTION)
				move_and_slide()
		else:
			var direction = goal- global_position.y
			if abs(global_position.y - goal) > 10:
				velocity.y = move_toward(velocity.y, direction * SPEED, delta * ACCELERATION)
			else:
				velocity.y = move_toward(velocity.y, 0, delta * FRICTION)
			move_and_slide()
	else:
		if Input.is_action_pressed("Pause"):
			resume()


func _on_resume_pressed():
	resume()


func _on_quit_pressed():
	print('qi')
	get_tree().paused = false
	get_tree().change_scene_to_file("res://scenes/ui/menus/MainMenu.tscn")
