extends Node2D


# Declare member variables here. Examples:
var bl: float =1
var bla: float =1
const mass0: int = 2000 #kilograms
var mass: float = float(mass0)
var impls: float = 0
var spd: float = 0
const lghtspd: int = 300 #Megameters/second
const inc_step: int = int(pow(lghtspd, 2))
var nrg: float = 0
var nrg0: float = mass * pow(lghtspd,2)
var pow_nrg0: float = pow(nrg0,2)
onready var chart_graph = get_node("CGLine")
var rng = RandomNumberGenerator.new()
var x = 0

var time: float = 0
var time_mov: float = 0
var dist: float = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	nrg += nrg0	
	
	chart_graph.initialize(chart_graph.LABELS_TO_SHOW.NO_LABEL,
	{
		stock = Color(0.58, 0.92, 0.07)
	})
	chart_graph.set_labels(5)

func _process(delta: float) -> void:
	$NRG_MONITOR.text = "Energy: " + str(nrg)
	$SPD_MONITOR.text = "Speed: " + str(spd) + "  " + str($Speedometer.frame)
	$MASS_MONITOR.text = "Mass: " + str(mass) + "\nbl: " + str(bl)+ "\nbla: " + str(bla)
	$TIME_MONITOR.text = "Time: " + str(time)
	$TIMEMOV_MONITOR.text = "Time Moving System: " + str(time_mov)
	$DIST_MONITOR.text = "Distance travelled: " + str(dist)
	$Speedometer.update()
	
	

func _physics_process(delta: float) -> void:
	time = time + delta
	dist = dist + spd * delta
	var spd2 = spd * float(lghtspd)
	time_mov = (time - spd2/pow(float(lghtspd),2)*dist) / sqrt(1 - pow((spd2/float(lghtspd)), 2))
	$DateTimeManager/AnalogueClock.WorldTime = time_mov
	
	if(Input.is_action_pressed("up")):
		nrg += inc_step
		spd = calc_spd()
		
	if(Input.is_action_pressed("down") && nrg>nrg0):
		nrg -= inc_step
		spd = calc_spd()
	$Speedometer.frame = int(256*spd)

#new:
func calc_spd() -> float:
	return sqrt(1 - pow(float(mass0)*pow(float(lghtspd),2)/nrg, 2))

