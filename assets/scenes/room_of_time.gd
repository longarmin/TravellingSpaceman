extends Node2D


# Declare member variables here. Examples:
var bl: float =1
var bla: float =1
var mass: float = 100
var mass0: float = 100
var impls: float = 0
var spd: float = 0
var lghtspd: float = 10
var nrg: float = 0
var nrg0: float = mass * pow(lghtspd,2)
var pow_nrg0: float = pow(nrg0,2)


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	nrg += nrg0

func _process(delta: float) -> void:
	$NRG_MONITOR.text = "Energy: " + str(nrg)
	$SPD_MONITOR.text = "Speed: " + str(spd)
	$MASS_MONITOR.text = "Mass: " + str(mass) + "\nbl: " + str(bl)+ "\nbla: " + str(bla)
	

func _physics_process(delta: float) -> void:
	if(Input.is_action_pressed("up")):
		nrg += 100*delta
	if(Input.is_action_pressed("down")):
		nrg -= 100*delta

#new:
	bl = pow((spd/lghtspd),2)
	bla = sqrt(1-bl)
	mass = mass0/bla
	spd = sqrt(pow(nrg,2) - pow_nrg0)/(mass * lghtspd)

	#old:
	# bl = pow((spd/lghtspd),2)
	# bla = sqrt(1-bl)
	# mass = mass0/bla
	# spd = sqrt(2*nrg/mass)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass
