extends DateTimeManager


# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"
var AnalogueTime = hhmmss.new(0.0)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if(flag_one_second_for_AnalogueClock):
		updTime(flag_one_second_for_AnalogueClock)
		flag_one_second_for_AnalogueClock = false
		$HourHand.frame = AnalogueTime.hh
		$MinuteHand.frame = AnalogueTime.mm
		$SecondHand.frame = AnalogueTime.ss
		
		
func updTime(delta_time: float):
	AnalogueTime._time = WorldTime
	AnalogueTime.calc_time(AnalogueTime._time)
	print(AnalogueTime._time)
