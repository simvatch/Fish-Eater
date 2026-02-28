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

func respawn_seaweed(seaweed, additional_offset=0):
	var random_offset := randi_range(0, 50)
	seaweed.position.x = spawn_x + additional_offset + random_offset
