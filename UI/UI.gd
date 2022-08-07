extends CanvasLayer


# Declare member variables here.
onready var popupwindow = $HUD/MarginContainer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	popupwindow.visible = false
	Events.connect("ship_on_docking_area", self, "_on_DockArea_Entered")

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass
func _on_DockArea_Entered(bFlag):
	if bFlag:
		popupwindow.visible = true
		print("Hat geklappt!\n")
	if not bFlag:
		popupwindow.visible = false
		print("Hat geklappt, ist wieder raus!\n")
