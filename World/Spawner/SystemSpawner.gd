class_name SystemSpawner
extends Node2D


# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"
export var Planet: PackedScene


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func spawn_planet() -> void:
		var earth := Planet.instance()
		add_child(earth)
		
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass
