extends PlayerState


# Declare member variables here. Examples:
# var a: int = 2
var linear_velocity := Vector2.ZERO


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func physics_process(delta: float) -> void:
	var movement : Vector2 = get_movement()
	linear_velocity += Vector2(movement.x * delta,	movement.y * delta)
	linear_velocity = ship.move_and_slide(linear_velocity)
	ship.rotation = linear_velocity.angle() + PI/2
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass
func get_movement() -> Vector2:
	return Vector2(
		Input.get_action_strength("right") - Input.get_action_strength("left"),
		Input.get_action_strength("down") - Input.get_action_strength("up")
	)
	
func _unhandled_input(event: InputEvent) -> void:
	_parent.unhandled_input(event)
