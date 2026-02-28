extends Node2D
@onready var button = $CanvasLayer/Play

func _ready() -> void:
	button.pressed.connect(_on_button_pressed)

func _on_button_pressed():
	get_tree().change_scene_to_file("res://underwater.tscn")
