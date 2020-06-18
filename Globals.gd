extends Node

var speed: float = 800 setget set_speed

signal speed_changed(speed)

func set_speed(new_speed: float) -> void:
    speed = new_speed
    emit_signal("speed_changed", speed)
