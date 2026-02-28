extends Node2D
@onready var button = $CanvasLayer/Play
@onready var label = $Label

func _ready() -> void:
	button.pressed.connect(_on_button_pressed)

func _process(delta: float) -> void:
	pass
	
func _on_button_pressed():
	get_tree().change_scene_to_file("res://underwater.tscn")
