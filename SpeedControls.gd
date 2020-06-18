extends HBoxContainer

func _ready() -> void:
    display_speed(Globals.speed)
    Globals.connect("speed_changed", self, "_on_speed_changed")

func _on_DecreaseButton_button_up() -> void:
    Globals.speed -= 100

func _on_IncreaseButton_button_up() -> void:
    Globals.speed += 100

func _on_speed_changed(new_speed: float) -> void:
    display_speed(new_speed)

func display_speed(speed: float) -> void:
    $SpeedLabel.text = "%d" % [speed]
