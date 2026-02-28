extends CharacterBody2D

@export var move_speed := 150
@export var spawn_x := 1152    
@export var despawn_x := -100  
@export var min_spacing_x := 100
@export var min_y := 200
@export var max_y := 400

@onready var fishes := [
	$"Purple"
]

func _ready():
	randomize()
	for fish in fishes:
		respawn_fish(fish)


func _physics_process(delta):
	for fish in fishes:
		fish.position.x -= move_speed * delta

		var collision = fish.move_and_collide(Vector2.ZERO)
		if collision and collision.get_collider().is_in_group("Character"):
			fish.queue_free() 

		if fish.position.x < despawn_x:
			respawn_fish(fish)


func respawn_fish(fish):
	var valid_position := false
	var new_x := 0

	while not valid_position:
		new_x = spawn_x + randi_range(0, 300)
		valid_position = true
		for other in fishes:
			if other == fish:
				continue
			if abs(other.position.x - new_x) < min_spacing_x:
				valid_position = false
				break

	fish.position.x = new_x
	fish.position.y = randi_range(min_y, max_y)
