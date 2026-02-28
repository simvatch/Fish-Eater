extends Area2D

@export var move_speed := 150
@export var spawn_x := 1152    
@export var despawn_x := -100  
@export var min_y := 200
@export var max_y := 400

func _ready():
	randomize()
	respawn()
	connect("body_entered", Callable(self, "_on_body_entered"))

func _physics_process(delta):
	position.x -= move_speed * delta

	if position.x < despawn_x:
		respawn()

func _on_body_entered(body):
	if body.is_in_group("Character"):
		respawn()

func respawn():
	position.x = spawn_x + randi_range(50, 300)
	position.y = randi_range(min_y, max_y)
