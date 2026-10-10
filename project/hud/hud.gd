extends Control

@onready var _pinatas_label: Label = $PinatasLabel


func update_pinatas_remaining(count: int) -> void:
	_pinatas_label.text = "Pinatas left: %d" % count
