extends Area2D

signal add_point
@export var move_speed := 50
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
	if body.is_in_group("Colliding"):
		add_point.emit(1)
		respawn()
	

func respawn():
	var new_pos
	var safe = false
	while not safe:
		new_pos = Vector2(spawn_x + randi_range(50, 300), position.y)
		safe = true
		for other_fish in get_tree().get_nodes_in_group("Colliding"):
			if other_fish != self and other_fish.position.distance_to(new_pos) < 100:
				safe = false
				break
	position = new_pos
