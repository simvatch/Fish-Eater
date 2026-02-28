extends Area2D

signal add_point
@export var move_speed := 175
@export var spawn_x := 1200  
@export var despawn_x := -100  
@export var min_y := 200
@export var max_y := 400
@export var min_respawn_time := 3.0
@export var max_respawn_time := 10.0

var waiting_to_respawn := false

func _ready():
	randomize()
	respawn()
	connect("body_entered", Callable(self, "_on_body_entered"))

func _physics_process(delta):
	if waiting_to_respawn:
		return 
		
	position.x -= move_speed * delta

	if position.x < despawn_x:
		start_respawn_timer()

func _on_body_entered(body):
	if body.is_in_group("Character"):
		if Globals.level < 2:
			get_tree().change_scene_to_file("res://game_over.tscn")
		else:
			add_point.emit(2)
			start_respawn_timer()

func start_respawn_timer():
	if waiting_to_respawn:
		return
	waiting_to_respawn = true
	position.x = despawn_x - 50 
	var delay = randf_range(min_respawn_time, max_respawn_time)
	await get_tree().create_timer(delay).timeout
	respawn()
	waiting_to_respawn = false

func respawn():
	position.x = spawn_x + randi_range(50, 300)
	position.y = randi_range(min_y, max_y)
