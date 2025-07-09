extends Area2D

const INITIAL_PADDLE_SPEED: float = 300.0
var MIN_X_VALUE: float
var MAX_X_VALUE: float
#const MIN_X_VALUE = get_viewport_rect().position.x
#const MAX_X_VALUE = get_viewport_rect().end.x

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	MIN_X_VALUE = get_viewport_rect().position.x
	MAX_X_VALUE = get_viewport_rect().end.x
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#if Input.is_action_pressed("move_left") == true:
		#position.x -= INITIAL_PADDLE_SPEED * delta
	#if Input.is_action_pressed("move_right") == true:
		#position.x += INITIAL_PADDLE_SPEED * delta

	var movement: float = Input.get_axis("move_left", "move_right")
	position.x += INITIAL_PADDLE_SPEED * delta * movement
	
	position.x = clampf(
		position.x,
		MIN_X_VALUE,
		MAX_X_VALUE
	)
