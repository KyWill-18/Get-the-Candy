extends Control

@onready var pinats_label: Label = $PinatasLabel


func update_pinatas_remaining(count: int) -> void:
	pinats_label.text = "Pinatas left: %d" % count
