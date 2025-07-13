extends Area2D

class_name Gem

const INITIAL_SPEED: float = 200.0 
var END_OF_SCREEN_Y: float

signal gem_off_screen

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	END_OF_SCREEN_Y = get_viewport_rect().end.y
	pass # Replace with function body.

func die() -> void:
	set_process(false)
	queue_free()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.y += INITIAL_SPEED * delta
	
	if position.y > END_OF_SCREEN_Y:
		print ("gem fell out of screen")
		gem_off_screen.emit()
		die()

func _on_area_entered(area: Area2D) -> void:
	print ("gem hits paddle")
	die()
