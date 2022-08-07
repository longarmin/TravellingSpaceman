# About: Relativistic Operations and tranformative updates
#
# Here the relativistic calculations are performed.
#
# The relativistic calculations are performed in the following way:
#
# 1 - when the player hits "accelerate", the program increases the amount of kinetic Energy by a certain amount.
#
# 2 - from the sum of kinetic energy, the current velocity is deduced.
#
# 3 - from the speed, the time delta for the moving non-inertial-system is calculated.
#

extends Node2D
class_name RoomOfTime
# Group: Constants

# Group: Variables
var time: float = 0
onready var ship = $PlayerShip/Inertial_System
onready var speedometer = $UI/HUD/GridContainer/Speedometer
#TODO: shift to Spawner:
#onready var player_ship: PlayerShip = $PlayerShip

func _ready() -> void:
	$PlayerShip.grab_camera($Camera2D)
	$SystemSpawner.spawn_planet()

func _process(delta: float) -> void:
	$UI/HUD/NRG_MONITOR.text = "Energy: " + str($PlayerShip/Inertial_System.nrg)
	$UI/HUD/SPD_MONITOR.text = "Speed: " + str(ship.spd) + "  " + str(speedometer.frame)
	$UI/HUD/MASS_MONITOR.text = "Mass: " + str(ship.mass) + "\n"
	$UI/HUD/TIME_MONITOR.text = "Time: " + str(time)
	$UI/HUD/TIMEMOV_MONITOR.text = "Time Moving System: " + str(ship.time)
	$UI/HUD/DIST_MONITOR.text = "Distance travelled: " + str(ship.dist)
	speedometer.update()

	
func _physics_process(delta: float) -> void:
#	ship._physics_process(delta)
	time = time + delta
	$UI/DateTimeManager/AnalogueClock.updTime($PlayerShip/Inertial_System.time)
	speedometer.frame = int(256*$PlayerShip/Inertial_System.spd)
