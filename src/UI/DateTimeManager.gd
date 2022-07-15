extends Node2D
class_name DateTimeManager
class hhmmss:
	var hh: int = 0
	var mm: int = 0
	var ss: int = 0
	var _time: float = 0.0

	func _init(time: float):
		[hh, mm, ss] = calc_time(time)
	
	func calc_time(time: float):
		hh = int(time / 3600)
		mm = int((int(time) % 3600) / 60)
		ss = int(int(time) % 60)
		return [hh, mm, ss]

# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"
var one_second_passing: float = 0.0
var WorldTime: float = 0.0
var flag_one_second_for_7Segment = false
var flag_one_second_for_AnalogueClock = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	one_second_passing += delta
	if one_second_passing >= 1.0:
		flag_one_second_for_7Segment = true
		flag_one_second_for_AnalogueClock = true
		#does not happen every second, because one second can be dilatated:
		one_second_passing = 0.0
		
