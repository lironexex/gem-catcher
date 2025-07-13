extends Node2D


const GEM = preload("res://Scenes/Gem/gem.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	spawn_gem()
	
func spawn_gem() -> void:
	var new_gem: Gem = GEM.instantiate()
	var x_pos: float = 100.0 # change to random
	new_gem.position = Vector2(x_pos, -50.0)
	new_gem.gem_off_screen.connect(_on_gem_off_screen)
	add_child(new_gem)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_gem_off_screen() -> void:
	print("Game:: _on_gem_off_screen Game Over")


func _on_timer_timeout() -> void:
	spawn_gem()
