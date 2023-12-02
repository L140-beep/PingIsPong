extends Area2D

signal llose
signal rlose
enum POSITION {
	LEFT,
	RIGHT
}

@export var pos: POSITION = POSITION.LEFT
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	if pos == POSITION.LEFT:
		emit_signal("llose")
	else:
		emit_signal("rlose")
