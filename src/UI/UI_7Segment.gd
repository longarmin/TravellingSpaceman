#extends Node2D
extends DateTimeManager
# Declare member variables here. Examples:

var segmentTime = hhmmss.new(0.0)


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if(flag_one_second_for_7Segment):
		updTime(flag_one_second_for_7Segment)
		flag_one_second_for_7Segment = false

	
func updTime(delta_time: float):
	segmentTime._time += delta_time
	segmentTime.calc_time(segmentTime._time)
	$hours10.frame = int(segmentTime.hh / 10)
	$hours01.frame = int(segmentTime.hh % 10)
	$minutes10.frame = int(segmentTime.mm / 10)
	$minutes01.frame = int(segmentTime.mm % 10)
	$seconds10.frame = int(segmentTime.ss / 10)
	$seconds01.frame = int(segmentTime.ss % 10)
