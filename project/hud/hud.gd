extends Control

@onready var pinatas_label: Label = $PinatasLabel


func update_pinatas_remaining(count: int) -> void:
	pinatas_label.text = "Pinatas left: %d" % count
