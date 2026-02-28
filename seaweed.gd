extends CharacterBody2D

@export var move_speed := 70
@export var spawn_x := 1152    
@export var despawn_x := -100  
@export var min_spacing_x := 100  

@onready var seaweeds := [
	$Long,
	$Mega,
	$Small
]

func _ready():
	randomize()
	for seaweed in seaweeds:
		respawn_seaweed(seaweed)


func _physics_process(delta):
	for seaweed in seaweeds:
		seaweed.position.x -= move_speed * delta

		if seaweed.position.x < despawn_x:
			respawn_seaweed(seaweed)


func respawn_seaweed(seaweed):
	var valid_position := false
	var new_x := 0

	while not valid_position:
		new_x = spawn_x + randi_range(0, 300)
		valid_position = true
		for other in seaweeds:
			if other == seaweed:
				continue
			if abs(other.position.x - new_x) < min_spacing_x:
				valid_position = false
				break

	seaweed.position.x = new_x
