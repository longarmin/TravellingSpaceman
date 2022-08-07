extends Node
class_name Inertial_System

const lghtspd: int = 300 #Megameters/second
const inc_step: int = int(pow(lghtspd, 2))
# const mass0: int = 2000 #kilograms

var time: float = 0.0
var time_1sec: float = 0.0
var spd: float = 0.0
var kinetic_energy: float = 0.0
var dist: float = 0.0
var mass0: float = 2000
var mass: float = mass0
var nrg0: float = mass0 * pow(lghtspd,2)
var nrg: float = 0.0

func calc_spd() -> float:
	return sqrt(1 - pow(float(mass0)*pow(float(lghtspd),2)/nrg, 2))

func calc_time_delta(delta: float) -> float:
	return sqrt(1 - pow(spd,2)) * delta
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	nrg += nrg0	

func _physics_process(delta):

	var dist_delta = spd * delta
	dist += dist_delta
	time_1sec += delta 
	
	if time_1sec >= 1.0:
		time += calc_time_delta(time_1sec)
		time_1sec = 0.0

func set_nrg(delta: float):
	nrg += inc_step*delta
	if nrg < nrg0:
		nrg = nrg0
	spd = calc_spd()
