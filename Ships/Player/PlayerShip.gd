class_name PlayerShip
extends KinematicBody2D



# Declare member variables here.
var is_player_inside := false
var dockables := []

export var _spd: float = 0.0
export var _mass0: float = 0.0
onready var insys = $Inertial_System
onready var camera_transform = $CameraTransform
onready var ship_area = $ShipArea
#var mvmnt: Inertial_System = Inertial_System.new()


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	ship_area.connect("area_entered", self, "_on_ShipArea_area_entered")
	ship_area.connect("area_exited", self, "_on_ShipArea_area_exited")


func _physics_process(delta: float) -> void:
	if(Input.is_action_pressed("up")):
		insys.set_nrg(delta)
		
	if(Input.is_action_pressed("down")):
		insys.set_nrg(-1*delta)
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass
func grab_camera(camera: Camera2D) -> void:
	camera_transform.remote_path = camera.get_path()
	
func _on_ShipArea_area_entered(body: Node) -> void:
	if not is_player_inside:
		print("Player Ships currently colides with " + body.name)
		dockables.append(body)
	Events.emit_signal("ship_on_docking_area", true)
	is_player_inside = true

func _on_ShipArea_area_exited(body: Node) -> void:
	if is_player_inside:
		print("Player does not collide anymore with " + body.name)
		dockables.erase(body)
	Events.emit_signal("ship_on_docking_area", false)
	is_player_inside = false
	

