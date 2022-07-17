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
const lghtspd: int = 300 #Megameters/second
const inc_step: int = int(pow(lghtspd, 2))
# const mass0: int = 2000 #kilograms

class Inertial_System:
	var time: float = 0.0
	var time_1sec: float = 0.0
	var spd: float = 0.0
	var kinetic_energy: float = 0.0
	var dist: float = 0.0
	var nrg: float = 0.0
	var mass0: float = 2000
	var mass: float = mass0
	var nrg0: float = mass0 * pow(lghtspd,2)

	func calc_spd() -> float:
		return sqrt(1 - pow(float(mass0)*pow(float(lghtspd),2)/nrg, 2))
	
	func calc_time_delta(delta: float) -> float:
		return sqrt(1 - pow(spd,2)) * delta

	func _physics_process(delta):

		var dist_delta = spd * delta
		dist += dist_delta
		time_1sec += calc_time_delta(delta)
		
		if time_1sec >= 1.0:
			time += time_1sec
			time_1sec = 0.0

		if(Input.is_action_pressed("up")):
			nrg += inc_step
			spd = calc_spd()
			
		if(Input.is_action_pressed("down") && nrg>nrg0):
			nrg -= inc_step
			spd = calc_spd()

# Group: Variables
var ship: Inertial_System = Inertial_System.new()
var time: float = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	ship.nrg += ship.nrg0	

func _process(delta: float) -> void:
	$NRG_MONITOR.text = "Energy: " + str(ship.nrg)
	$SPD_MONITOR.text = "Speed: " + str(ship.spd) + "  " + str($Speedometer.frame)
	$MASS_MONITOR.text = "Mass: " + str(ship.mass) + "\n"
	$TIME_MONITOR.text = "Time: " + str(time)
	$TIMEMOV_MONITOR.text = "Time Moving System: " + str(ship.time)
	$DIST_MONITOR.text = "Distance travelled: " + str(ship.dist)
	$Speedometer.update()

	
func _physics_process(delta: float) -> void:
	ship._physics_process(delta)
	time = time + delta
	$DateTimeManager/AnalogueClock.updTime(ship.time)
	$Speedometer.frame = int(256*ship.spd)
