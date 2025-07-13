extends Node2D


const GEM = preload("res://Scenes/Gem/gem.tscn")
const MARGIN: float = 70.0
var START_OF_SCREEN_X: float
var END_OF_SCREEN_X: float

@onready var spawn_timer: Timer = $SpawnTimer
@onready var paddle: Area2D = $Paddle

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	START_OF_SCREEN_X = get_viewport_rect().position.x
	END_OF_SCREEN_X = get_viewport_rect().end.x
	spawn_gem()
	
func spawn_gem() -> void:
	var new_gem: Gem = GEM.instantiate()
	var x_pos: float = randf_range(
		START_OF_SCREEN_X,
		END_OF_SCREEN_X - MARGIN
	)
	new_gem.position = Vector2(x_pos, -MARGIN)
	new_gem.gem_off_screen.connect(_on_gem_off_screen)
	add_child(new_gem)

func stop_all() -> void:
	spawn_timer.stop()
	paddle.set_process(false)
	for child in get_children():
		if child is Gem:
			child.set_process(false)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_gem_off_screen() -> void:
	stop_all()
	print("Game:: _on_gem_off_screen Game Over")


func _on_timer_timeout() -> void:
	spawn_gem()
