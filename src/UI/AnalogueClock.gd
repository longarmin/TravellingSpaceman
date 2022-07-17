# About: Analogue Clock
# Creates time for analogue clock and displays it on the screen.
#
extends DateTimeManager


# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"
var AnalogueTime = hhmmss.new(0.0)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
# func _process(delta: float) -> void:
# 	if(flag_one_second_for_AnalogueClock):
# 		updTime(flag_one_second_for_AnalogueClock)
# 		flag_one_second_for_AnalogueClock = false
# 		$HourHand.frame = AnalogueTime.hh
# 		$MinuteHand.frame = AnalogueTime.mm
# 		$SecondHand.frame = AnalogueTime.ss
		
# Function: updTime(float)
# Increments time, and updates the clock. Writes HH MM SS to scene.
func updTime(time: float):
	AnalogueTime._time = time
	AnalogueTime.calc_time(AnalogueTime._time)
	$HourHand.frame = AnalogueTime.hh
	$MinuteHand.frame = AnalogueTime.mm
	$SecondHand.frame = AnalogueTime.ss
