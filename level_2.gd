extends CharacterBody2D

@export var speed = 400
@export var min_x := 50
@export var max_x := 1102
@export var min_y := 50
@export var max_y := 598

func get_input():
	var input_direction = Input.get_vector("left", "right", "up", "down")
	velocity = input_direction * speed

func _physics_process(delta):
	get_input()
	move_and_slide()
	position.x = clamp(position.x, min_x, max_x)
	position.y = clamp(position.y, min_y, max_y)
