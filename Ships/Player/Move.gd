extends PlayerState
const lghtspd: int = 300 #Megameters/second
const inc_step: int = int(pow(lghtspd, 2))
# const mass0: int = 2000 #kilograms



# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("dock") && ship.dockables.size()>0:
		print("Ship goes docking")
