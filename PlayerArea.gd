extends Area2D

var speed: float = 1800
var velocity: Vector2 = Vector2(0, 0)
onready var screen_size: Vector2 = get_viewport_rect().size

func _input(event: InputEvent) -> void:
    self.velocity = Vector2()
    if Input.is_action_pressed("ui_right"):
        self.velocity.x = 1
    if Input.is_action_pressed("ui_left"):
        self.velocity.x = -1

func _process(delta: float) -> void:
    self.position += self.velocity * speed * delta
    # Limit position to screen size
    self.position.x = clamp(self.position.x, 0, self.screen_size.x)
