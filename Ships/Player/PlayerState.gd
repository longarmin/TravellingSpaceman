class_name PlayerState
extends State


# Declare member variables here. Examples:
var ship: PlayerShip


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	yield(owner, "ready")
	ship = owner

