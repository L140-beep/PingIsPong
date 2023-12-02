class_name PauseMenu
extends CanvasLayer
signal resume
signal quit
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_resume_pressed():
	emit_signal("resume")


func _on_quit_pressed():
	emit_signal("quit")
