extends Node2D

@export var min_fish := 1
@export var max_fish := 5
@export var spawn_x_min := 1152
@export var spawn_x_max := 1450
@export var min_y := 200
@export var max_y := 400

var fish_scene: PackedScene = preload("res://underwater.tscn")

func _ready():
	randomize()
	
	var fish_count = randi_range(min_fish, max_fish)
	for i in range(fish_count):
		var fish_instance = fish_scene.instantiate()
		add_child(fish_instance)
		fish_instance.position.x = randi_range(spawn_x_min, spawn_x_max)
		fish_instance.position.y = randi_range(min_y, max_y)
