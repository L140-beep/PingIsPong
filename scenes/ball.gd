class_name Ball
extends CharacterBody2D

@export var SPEED = Vector2(400.0, 400.0)
@export var ROTATION_SPEED = 0.01
var MAX_SPEED = 800.0
var stopped = false
# Get the gravity from the project settings to be synced with RigidBody nodes

func stop():
	velocity = Vector2.ZERO

func _limit():
	if velocity.x > MAX_SPEED:
		velocity.x = MAX_SPEED
	if velocity.y > MAX_SPEED:
		velocity.y = MAX_SPEED
func _physics_process(delta):
	# Add the gravity.
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var collide = move_and_collide(velocity*delta)
	if not stopped:	
		if collide:
			var direction = collide.get_normal()
			var norm_vec = velocity.normalized()
			#var _cos = ((direction.x * norm_vec.x) + (direction.y * norm_vec.y)) / (sqrt(direction.x ** 2 + direction.y ** 2) * sqrt(norm_vec.x ** 2 + norm_vec.y ** 2))
			#rad_to_deg(1 / _cos)
			
			#direction.y *= 0.01
			direction = direction.normalized()
			velocity = (-(5 * direction * velocity.dot(direction) - (velocity * 3))).normalized() * MAX_SPEED
			velocity *= 1.4
			
	velocity = velocity.limit_length(MAX_SPEED)
	if velocity.x < 0:
		rotation -= deg_to_rad(velocity.x) * ROTATION_SPEED
	else:
		rotation += deg_to_rad(velocity.x) * ROTATION_SPEED
func start_move():
	var degs = [20, 30, 45, -45, -30, -20, 110, 120, 135 -110, -120, -135]
	var deg = degs[randi_range(0, degs.size() - 1)]
	velocity = Vector2(cos(deg_to_rad(deg)) ,sin(deg_to_rad(deg))) * SPEED
func _on_input_event(viewport, event, shape_idx):
	#direction = -direction
	print("here")


func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
